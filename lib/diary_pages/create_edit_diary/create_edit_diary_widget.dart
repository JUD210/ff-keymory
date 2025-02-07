import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/diary_pages/a_i_comment_editor/a_i_comment_editor_widget.dart';
import '/feed/diary_card_chat/diary_card_chat_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_edit_diary_model.dart';
export 'create_edit_diary_model.dart';

class CreateEditDiaryWidget extends StatefulWidget {
  const CreateEditDiaryWidget({
    super.key,
    this.diariesDoc,
    bool? isEditMode,
    this.dateFocused,
  }) : this.isEditMode = isEditMode ?? false;

  final DiariesRecord? diariesDoc;
  final bool isEditMode;
  final DateTime? dateFocused;

  @override
  State<CreateEditDiaryWidget> createState() => _CreateEditDiaryWidgetState();
}

class _CreateEditDiaryWidgetState extends State<CreateEditDiaryWidget> {
  late CreateEditDiaryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateEditDiaryModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.diariesDoc != null) {
        _model.aiCommentContent = valueOrDefault<String>(
          widget!.diariesDoc?.tmpAiComment,
          'tmp_ai_comment',
        );
        _model.diaryDateTime = widget!.diariesDoc?.createdTime;
        _model.moodKeywordsSelected =
            widget!.diariesDoc!.moodKeywords.toList().cast<String>();
        _model.aiCommentBy = widget!.diariesDoc?.aiCommentBy;
        _model.linkedChatsRef =
            widget!.diariesDoc!.linkedChats.toList().cast<DocumentReference>();
        safeSetState(() {});
        FFAppState().editorText = widget!.diariesDoc!.content;
        safeSetState(() {});
      } else {
        _model.diaryDateTime = widget!.dateFocused;
        _model.moodKeywordsSelected = [].toList().cast<String>();
        safeSetState(() {});
      }
    });

    _model.moodDescriptionTextController ??= TextEditingController(
        text: widget!.diariesDoc != null
            ? widget!.diariesDoc?.moodKeywordsDescription
            : '');
    _model.moodDescriptionFocusNode ??= FocusNode();

    _model.titleTextController ??= TextEditingController(
        text: widget!.diariesDoc != null ? widget!.diariesDoc?.title : '');
    _model.titleFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 8.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            context.safePop();
                          },
                        ),
                      ),
                      if (widget!.isEditMode)
                        Text(
                          'Edit Diary',
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                      if (!widget!.isEditMode)
                        Text(
                          'Create Diary',
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                    ],
                  ),
                  Material(
                    color: Colors.transparent,
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              '작성 일자',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Text(
                              dateTimeFormat(
                                "y년 M월 d일",
                                _model.diaryDateTime,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Noto Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            Divider(
                              thickness: 2.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            Text(
                              '당신의 기분을 알려주세요.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Slider(
                              activeColor: Color(0xFFFFBCFF),
                              inactiveColor:
                                  FlutterFlowTheme.of(context).alternate,
                              min: 1.0,
                              max: 100.0,
                              value: _model.sliderValue ??=
                                  valueOrDefault<double>(
                                widget!.diariesDoc?.moodScoreByUser != null
                                    ? widget!.diariesDoc?.moodScoreByUser
                                        ?.toDouble()
                                    : 50.0,
                                50.0,
                              ),
                              label: _model.sliderValue?.toStringAsFixed(0),
                              divisions: 99,
                              onChanged: (newValue) {
                                newValue =
                                    double.parse(newValue.toStringAsFixed(0));
                                safeSetState(
                                    () => _model.sliderValue = newValue);
                              },
                            ),
                            Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  '',
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 2.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            Text(
                              '당신의 감정들을 선택해주세요.\n(생략 가능)',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 80.0,
                                  decoration: BoxDecoration(),
                                  child: Text(
                                    '매우 긍정',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          FlutterFlowChoiceChips(
                                            options: FFAppConstants
                                                .moodKeywordRate5Options
                                                .map((label) => ChipData(label))
                                                .toList(),
                                            onChanged: (val) async {
                                              safeSetState(() => _model
                                                      .moodKeywordsRate5Values =
                                                  val);
                                              _model.moodKeywordsSelected = functions
                                                  .updateMoodKeywordsSelected(
                                                      _model
                                                          .moodKeywordsSelected
                                                          .toList(),
                                                      _model
                                                          .moodKeywordsRate5Values!
                                                          .toList(),
                                                      FFAppConstants
                                                          .moodKeywordRate5Options
                                                          .toList())
                                                  .toList()
                                                  .cast<String>();
                                              safeSetState(() {});
                                            },
                                            selectedChipStyle: ChipStyle(
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        letterSpacing: 0.0,
                                                      ),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              iconSize: 16.0,
                                              elevation: 1.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            unselectedChipStyle: ChipStyle(
                                              backgroundColor:
                                                  Color(0x00000000),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              iconSize: 16.0,
                                              elevation: 1.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            chipSpacing: 8.0,
                                            rowSpacing: 8.0,
                                            multiselect: true,
                                            initialized: _model
                                                    .moodKeywordsRate5Values !=
                                                null,
                                            alignment: WrapAlignment.start,
                                            controller: _model
                                                    .moodKeywordsRate5ValueController ??=
                                                FormFieldController<
                                                    List<String>>(
                                              functions.updateChoiceChipSelected(
                                                  (widget!.diariesDoc != null
                                                          ? widget!.diariesDoc!
                                                              .moodKeywords
                                                          : _model
                                                              .moodKeywordsSelected)
                                                      .toList(),
                                                  FFAppConstants
                                                      .moodKeywordRate5Options
                                                      .toList()),
                                            ),
                                            wrapped: true,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 80.0,
                                  decoration: BoxDecoration(),
                                  child: Text(
                                    '긍정',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          FlutterFlowChoiceChips(
                                            options: FFAppConstants
                                                .moodKeywordRate4Options
                                                .map((label) => ChipData(label))
                                                .toList(),
                                            onChanged: (val) async {
                                              safeSetState(() => _model
                                                      .moodKeywordsRate4Values =
                                                  val);
                                              _model.moodKeywordsSelected = functions
                                                  .updateMoodKeywordsSelected(
                                                      _model
                                                          .moodKeywordsSelected
                                                          .toList(),
                                                      _model
                                                          .moodKeywordsRate4Values!
                                                          .toList(),
                                                      FFAppConstants
                                                          .moodKeywordRate4Options
                                                          .toList())
                                                  .toList()
                                                  .cast<String>();
                                              safeSetState(() {});
                                            },
                                            selectedChipStyle: ChipStyle(
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        letterSpacing: 0.0,
                                                      ),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              iconSize: 16.0,
                                              elevation: 1.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            unselectedChipStyle: ChipStyle(
                                              backgroundColor:
                                                  Color(0x00000000),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              iconSize: 16.0,
                                              elevation: 1.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            chipSpacing: 8.0,
                                            rowSpacing: 8.0,
                                            multiselect: true,
                                            initialized: _model
                                                    .moodKeywordsRate4Values !=
                                                null,
                                            alignment: WrapAlignment.start,
                                            controller: _model
                                                    .moodKeywordsRate4ValueController ??=
                                                FormFieldController<
                                                    List<String>>(
                                              functions.updateChoiceChipSelected(
                                                  (widget!.diariesDoc != null
                                                          ? widget!.diariesDoc!
                                                              .moodKeywords
                                                          : _model
                                                              .moodKeywordsSelected)
                                                      .toList(),
                                                  FFAppConstants
                                                      .moodKeywordRate4Options
                                                      .toList()),
                                            ),
                                            wrapped: true,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 80.0,
                                  decoration: BoxDecoration(),
                                  child: Text(
                                    '중립',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          FlutterFlowChoiceChips(
                                            options: FFAppConstants
                                                .moodKeywordRate3Options
                                                .map((label) => ChipData(label))
                                                .toList(),
                                            onChanged: (val) async {
                                              safeSetState(() => _model
                                                      .moodKeywordsRate3Values =
                                                  val);
                                              _model.moodKeywordsSelected = functions
                                                  .updateMoodKeywordsSelected(
                                                      _model
                                                          .moodKeywordsSelected
                                                          .toList(),
                                                      _model
                                                          .moodKeywordsRate3Values!
                                                          .toList(),
                                                      FFAppConstants
                                                          .moodKeywordRate3Options
                                                          .toList())
                                                  .toList()
                                                  .cast<String>();
                                              safeSetState(() {});
                                            },
                                            selectedChipStyle: ChipStyle(
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        letterSpacing: 0.0,
                                                      ),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              iconSize: 16.0,
                                              elevation: 1.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            unselectedChipStyle: ChipStyle(
                                              backgroundColor:
                                                  Color(0x00000000),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              iconSize: 16.0,
                                              elevation: 1.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            chipSpacing: 8.0,
                                            rowSpacing: 8.0,
                                            multiselect: true,
                                            initialized: _model
                                                    .moodKeywordsRate3Values !=
                                                null,
                                            alignment: WrapAlignment.start,
                                            controller: _model
                                                    .moodKeywordsRate3ValueController ??=
                                                FormFieldController<
                                                    List<String>>(
                                              functions.updateChoiceChipSelected(
                                                  (widget!.diariesDoc != null
                                                          ? widget!.diariesDoc!
                                                              .moodKeywords
                                                          : _model
                                                              .moodKeywordsSelected)
                                                      .toList(),
                                                  FFAppConstants
                                                      .moodKeywordRate3Options
                                                      .toList()),
                                            ),
                                            wrapped: true,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 80.0,
                                  decoration: BoxDecoration(),
                                  child: Text(
                                    '부정',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          FlutterFlowChoiceChips(
                                            options: FFAppConstants
                                                .moodKeywordRate2Options
                                                .map((label) => ChipData(label))
                                                .toList(),
                                            onChanged: (val) async {
                                              safeSetState(() => _model
                                                      .moodKeywordsRate2Values =
                                                  val);
                                              _model.moodKeywordsSelected = functions
                                                  .updateMoodKeywordsSelected(
                                                      _model
                                                          .moodKeywordsSelected
                                                          .toList(),
                                                      _model
                                                          .moodKeywordsRate2Values!
                                                          .toList(),
                                                      FFAppConstants
                                                          .moodKeywordRate2Options
                                                          .toList())
                                                  .toList()
                                                  .cast<String>();
                                              safeSetState(() {});
                                            },
                                            selectedChipStyle: ChipStyle(
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        letterSpacing: 0.0,
                                                      ),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              iconSize: 16.0,
                                              elevation: 1.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            unselectedChipStyle: ChipStyle(
                                              backgroundColor:
                                                  Color(0x00000000),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              iconSize: 16.0,
                                              elevation: 1.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            chipSpacing: 8.0,
                                            rowSpacing: 8.0,
                                            multiselect: true,
                                            initialized: _model
                                                    .moodKeywordsRate2Values !=
                                                null,
                                            alignment: WrapAlignment.start,
                                            controller: _model
                                                    .moodKeywordsRate2ValueController ??=
                                                FormFieldController<
                                                    List<String>>(
                                              functions.updateChoiceChipSelected(
                                                  (widget!.diariesDoc != null
                                                          ? widget!.diariesDoc!
                                                              .moodKeywords
                                                          : _model
                                                              .moodKeywordsSelected)
                                                      .toList(),
                                                  FFAppConstants
                                                      .moodKeywordRate2Options
                                                      .toList()),
                                            ),
                                            wrapped: true,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 80.0,
                                  decoration: BoxDecoration(),
                                  child: Text(
                                    '매우 부정',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          FlutterFlowChoiceChips(
                                            options: FFAppConstants
                                                .moodKeywordRate1Options
                                                .map((label) => ChipData(label))
                                                .toList(),
                                            onChanged: (val) async {
                                              safeSetState(() => _model
                                                      .moodKeywordsRate1Values =
                                                  val);
                                              _model.moodKeywordsSelected = functions
                                                  .updateMoodKeywordsSelected(
                                                      _model
                                                          .moodKeywordsSelected
                                                          .toList(),
                                                      _model
                                                          .moodKeywordsRate1Values!
                                                          .toList(),
                                                      FFAppConstants
                                                          .moodKeywordRate1Options
                                                          .toList())
                                                  .toList()
                                                  .cast<String>();
                                              safeSetState(() {});
                                            },
                                            selectedChipStyle: ChipStyle(
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        letterSpacing: 0.0,
                                                      ),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              iconSize: 16.0,
                                              elevation: 1.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            unselectedChipStyle: ChipStyle(
                                              backgroundColor:
                                                  Color(0x00000000),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              iconSize: 16.0,
                                              elevation: 1.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            chipSpacing: 8.0,
                                            rowSpacing: 8.0,
                                            multiselect: true,
                                            initialized: _model
                                                    .moodKeywordsRate1Values !=
                                                null,
                                            alignment: WrapAlignment.start,
                                            controller: _model
                                                    .moodKeywordsRate1ValueController ??=
                                                FormFieldController<
                                                    List<String>>(
                                              functions.updateChoiceChipSelected(
                                                  (widget!.diariesDoc != null
                                                          ? widget!.diariesDoc!
                                                              .moodKeywords
                                                          : _model
                                                              .moodKeywordsSelected)
                                                      .toList(),
                                                  FFAppConstants
                                                      .moodKeywordRate1Options
                                                      .toList()),
                                            ),
                                            wrapped: true,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (_model.moodKeywordsSelected.isNotEmpty)
                                    Text(
                                      '선택된 감정들',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Roboto',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  FlutterFlowChoiceChips(
                                    options: _model.moodKeywordsSelected
                                        .map((label) => ChipData(label))
                                        .toList(),
                                    onChanged: true
                                        ? null
                                        : (val) => safeSetState(() => _model
                                                .moodKeywordsSelectedViewerValues =
                                            val),
                                    selectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            letterSpacing: 0.0,
                                          ),
                                      iconColor:
                                          FlutterFlowTheme.of(context).info,
                                      iconSize: 16.0,
                                      elevation: 1.0,
                                      borderColor:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    unselectedChipStyle: ChipStyle(
                                      backgroundColor: Color(0x00000000),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                      iconColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      iconSize: 16.0,
                                      elevation: 1.0,
                                      borderColor:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    chipSpacing: 8.0,
                                    rowSpacing: 8.0,
                                    multiselect: true,
                                    initialized: _model
                                            .moodKeywordsSelectedViewerValues !=
                                        null,
                                    alignment: WrapAlignment.start,
                                    controller: _model
                                            .moodKeywordsSelectedViewerValueController ??=
                                        FormFieldController<List<String>>(
                                      [],
                                    ),
                                    wrapped: true,
                                  ),
                                ].divide(SizedBox(height: 12.0)),
                              ),
                            ),
                            Text(
                              '어떻게 위의 감정들을 느끼게 되셨나요?\n(생략 가능)',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            TextFormField(
                              controller: _model.moodDescriptionTextController,
                              focusNode: _model.moodDescriptionFocusNode,
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Mood Description',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      letterSpacing: 0.0,
                                    ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFE0E0E0),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                              minLines: 1,
                              validator: _model
                                  .moodDescriptionTextControllerValidator
                                  .asValidator(context),
                            ),
                            Divider(
                              thickness: 2.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            Text(
                              '제목',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            TextFormField(
                              controller: _model.titleTextController,
                              focusNode: _model.titleFocusNode,
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Title',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      letterSpacing: 0.0,
                                    ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFE0E0E0),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                              minLines: 1,
                              validator: _model.titleTextControllerValidator
                                  .asValidator(context),
                            ),
                            Text(
                              '일기',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 350.0,
                              child: custom_widgets.FleatherEditorWidget(
                                width: double.infinity,
                                height: 350.0,
                                initialText: widget!.diariesDoc != null
                                    ? widget!.diariesDoc!.content
                                    : '',
                              ),
                            ),
                            if (_model.aiCommentContent != null &&
                                _model.aiCommentContent != '')
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5F5F5),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      _model.aiCommentPageReturnObj != null
                                          ? valueOrDefault<String>(
                                              _model.aiCommentPageReturnObj
                                                  ?.aiCommentContent,
                                              'tmp2',
                                            )
                                          : valueOrDefault<String>(
                                              _model.aiCommentContent,
                                              'tmp1',
                                            ),
                                      '답변 생성 대기중...',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            if (_model.aiCommentContent != null &&
                                _model.aiCommentContent != '')
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5F5F5),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            if (!_model.isCommentDeleted &&
                                (_model.aiCommentContent != null &&
                                    _model.aiCommentContent != ''))
                              FFButtonWidget(
                                onPressed: () async {
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Delete?'),
                                                content: Text(
                                                    'Do you really want to DELETE?'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            false),
                                                    child: Text('Cancel'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            true),
                                                    child: Text('Confirm'),
                                                  ),
                                                ],
                                              );
                                            },
                                          ) ??
                                          false;
                                  if (confirmDialogResponse) {
                                    _model.aiCommentContent = null;
                                    _model.isCommentDeleted = true;
                                    safeSetState(() {});
                                  }
                                },
                                text: 'Delete AI Comment',
                                options: FFButtonOptions(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).error,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Roboto',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 2.0,
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              ),
                            FFButtonWidget(
                              onPressed: () async {
                                var _shouldSetState = false;
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  barrierColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: AICommentEditorWidget(
                                          aiCommentContent:
                                              _model.aiCommentContent,
                                          moodScoreByUser:
                                              functions.doubleToInteger(
                                                  _model.sliderValue!),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() =>
                                    _model.aiCommentPageReturnObj = value));

                                _shouldSetState = true;
                                if (_model.aiCommentPageReturnObj != null) {
                                  _model.isCommentDeleted = false;
                                  _model.aiCommentContent =
                                      valueOrDefault<String>(
                                    _model.aiCommentPageReturnObj
                                        ?.aiCommentContent,
                                    'aicommentcontent',
                                  );
                                  _model.aiCommentBy = _model
                                      .aiCommentPageReturnObj?.aiCommentBy;
                                  safeSetState(() {});
                                } else {
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }

                                if (_shouldSetState) safeSetState(() {});
                              },
                              text: 'Get AI Comment',
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context).info,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 2.0,
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      visualDensity: VisualDensity.compact,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                    ),
                                    unselectedWidgetColor:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  child: Checkbox(
                                    value: _model.togglePublicValue ??=
                                        widget!.diariesDoc != null
                                            ? widget!.diariesDoc!.isPublic
                                            : false,
                                    onChanged: (newValue) async {
                                      safeSetState(() =>
                                          _model.togglePublicValue = newValue!);
                                    },
                                    side: BorderSide(
                                      width: 2,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    checkColor:
                                        FlutterFlowTheme.of(context).info,
                                  ),
                                ),
                                Text(
                                  'Share to Public?',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ]
                              .divide(SizedBox(height: 16.0))
                              .around(SizedBox(height: 16.0)),
                        ),
                      ),
                    ),
                  ),
                  if (widget!.isEditMode)
                    FFButtonWidget(
                      onPressed: () async {
                        var confirmDialogResponse = await showDialog<bool>(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Delete?'),
                                  content:
                                      Text('Do you really want to DELETE?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, false),
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, true),
                                      child: Text('Confirm'),
                                    ),
                                  ],
                                );
                              },
                            ) ??
                            false;
                        if (confirmDialogResponse) {
                          await widget!.diariesDoc!.reference.delete();

                          context.pushNamed('HomeFeed');
                        }
                      },
                      text: 'Delete Diary',
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 56.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).error,
                        textStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  FFButtonWidget(
                    onPressed: () async {
                      if (widget!.diariesDoc != null) {
                        if (_model.isCommentDeleted) {
                          // Delete tmp_ai_comment

                          await widget!.diariesDoc!.reference.update({
                            ...createDiariesRecordData(
                              user: currentUserReference,
                              title: _model.titleTextController.text,
                              content: FFAppState().editorText,
                              createdTime: widget!.diariesDoc?.createdTime,
                              modifiedTime: getCurrentTimestamp,
                              isPublic: _model.togglePublicValue,
                              moodScoreByUser: functions
                                  .doubleToInteger(_model.sliderValue!),
                              moodKeywordsDescription:
                                  _model.moodDescriptionTextController.text,
                            ),
                            ...mapToFirestore(
                              {
                                'tmp_ai_comment': FieldValue.delete(),
                                'mood_keywords': _model.moodKeywordsSelected,
                                'ai_comment_by': FieldValue.delete(),
                              },
                            ),
                          });
                        } else {
                          // Non-Delete tmp_ai_comment

                          await widget!.diariesDoc!.reference.update({
                            ...createDiariesRecordData(
                              user: currentUserReference,
                              title: _model.titleTextController.text,
                              content: FFAppState().editorText,
                              createdTime: widget!.diariesDoc?.createdTime,
                              modifiedTime: getCurrentTimestamp,
                              isPublic: _model.togglePublicValue,
                              tmpAiComment: _model.aiCommentContent,
                              moodScoreByUser: functions
                                  .doubleToInteger(_model.sliderValue!),
                              moodKeywordsDescription:
                                  _model.moodDescriptionTextController.text,
                              aiCommentBy: _model.aiCommentBy,
                            ),
                            ...mapToFirestore(
                              {
                                'mood_keywords': _model.moodKeywordsSelected,
                              },
                            ),
                          });
                        }

                        _model.tmpDiariesDocRefForCreateNewChat =
                            widget!.diariesDoc?.reference;
                        safeSetState(() {});
                      } else {
                        var diariesRecordReference1 =
                            DiariesRecord.collection.doc();
                        await diariesRecordReference1
                            .set(createDiariesRecordData());
                        _model.newDiariesDoc1 =
                            DiariesRecord.getDocumentFromData(
                                createDiariesRecordData(),
                                diariesRecordReference1);
                        if (_model.isCommentDeleted) {
                          // Delete tmp_ai_comment

                          await _model.newDiariesDoc1!.reference.update({
                            ...createDiariesRecordData(
                              user: currentUserReference,
                              title: _model.titleTextController.text,
                              content: FFAppState().editorText,
                              createdTime: widget!.dateFocused,
                              modifiedTime: getCurrentTimestamp,
                              isPublic: _model.togglePublicValue,
                              moodScoreByUser: functions
                                  .doubleToInteger(_model.sliderValue!),
                              moodKeywordsDescription:
                                  _model.moodDescriptionTextController.text,
                            ),
                            ...mapToFirestore(
                              {
                                'tmp_ai_comment': FieldValue.delete(),
                                'mood_keywords': _model.moodKeywordsSelected,
                                'ai_comment_by': FieldValue.delete(),
                              },
                            ),
                          });
                        } else {
                          // Non-Delete tmp_ai_comment

                          await _model.newDiariesDoc1!.reference.update({
                            ...createDiariesRecordData(
                              user: currentUserReference,
                              title: _model.titleTextController.text,
                              content: FFAppState().editorText,
                              createdTime: widget!.dateFocused,
                              modifiedTime: getCurrentTimestamp,
                              isPublic: _model.togglePublicValue,
                              tmpAiComment: _model.aiCommentContent,
                              moodScoreByUser: functions
                                  .doubleToInteger(_model.sliderValue!),
                              moodKeywordsDescription:
                                  _model.moodDescriptionTextController.text,
                              aiCommentBy: _model.aiCommentBy,
                            ),
                            ...mapToFirestore(
                              {
                                'mood_keywords': _model.moodKeywordsSelected,
                              },
                            ),
                          });
                        }

                        _model.tmpDiariesDocRefForCreateNewChat =
                            _model.newDiariesDoc1?.reference;
                        safeSetState(() {});
                      }

                      _model.tmpDiariesDoc1 =
                          await DiariesRecord.getDocumentOnce(
                              _model.tmpDiariesDocRefForCreateNewChat!);
                      // diarySummaryOutput
                      _model.diarySummaryOutput1 =
                          await OpenAIAPIGroup.createChatCompletionCall.call(
                        messagesJson: functions
                            .tmpGetDiarySummarize(_model.tmpDiariesDoc1!),
                      );

                      await _model.tmpDiariesDocRefForCreateNewChat!
                          .update(createDiariesRecordData(
                        diaryContentSummarized: valueOrDefault<String>(
                          OpenAIAPIGroup.createChatCompletionCall
                              .gptResponseContent(
                            (_model.diarySummaryOutput1?.jsonBody ?? ''),
                          ),
                          'diarySummaryOutput',
                        ),
                      ));

                      context.goNamed('HomeFeed');

                      safeSetState(() {});
                    },
                    text: 'Save Diary',
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 56.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).info,
                                letterSpacing: 0.0,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      var _shouldSetState = false;
                      if (!(_model.aiCommentBy != null)) {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('AI Comment를 먼저 생성해주세요!'),
                              content:
                                  Text('AI로부터 받은 Comment가 있어야 채팅을 시작할 수 있습니다!'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                        if (_shouldSetState) safeSetState(() {});
                        return;
                      }
                      if (widget!.diariesDoc != null) {
                        if (_model.isCommentDeleted) {
                          // Delete tmp_ai_comment

                          await widget!.diariesDoc!.reference.update({
                            ...createDiariesRecordData(
                              user: currentUserReference,
                              title: _model.titleTextController.text,
                              content: FFAppState().editorText,
                              createdTime: widget!.diariesDoc?.createdTime,
                              modifiedTime: getCurrentTimestamp,
                              isPublic: _model.togglePublicValue,
                              moodScoreByUser: functions
                                  .doubleToInteger(_model.sliderValue!),
                              moodKeywordsDescription:
                                  _model.moodDescriptionTextController.text,
                            ),
                            ...mapToFirestore(
                              {
                                'tmp_ai_comment': FieldValue.delete(),
                                'mood_keywords': _model.moodKeywordsSelected,
                                'ai_comment_by': FieldValue.delete(),
                              },
                            ),
                          });
                        } else {
                          // Non-Delete tmp_ai_comment

                          await widget!.diariesDoc!.reference.update({
                            ...createDiariesRecordData(
                              user: currentUserReference,
                              title: _model.titleTextController.text,
                              content: FFAppState().editorText,
                              createdTime: widget!.diariesDoc?.createdTime,
                              modifiedTime: getCurrentTimestamp,
                              isPublic: _model.togglePublicValue,
                              tmpAiComment: _model.aiCommentContent,
                              moodScoreByUser: functions
                                  .doubleToInteger(_model.sliderValue!),
                              moodKeywordsDescription:
                                  _model.moodDescriptionTextController.text,
                              aiCommentBy: _model.aiCommentBy,
                            ),
                            ...mapToFirestore(
                              {
                                'mood_keywords': _model.moodKeywordsSelected,
                              },
                            ),
                          });
                        }

                        _model.tmpDiariesDocRefForCreateNewChat =
                            widget!.diariesDoc?.reference;
                        safeSetState(() {});
                      } else {
                        var diariesRecordReference1 =
                            DiariesRecord.collection.doc();
                        await diariesRecordReference1
                            .set(createDiariesRecordData());
                        _model.newDiariesDoc2 =
                            DiariesRecord.getDocumentFromData(
                                createDiariesRecordData(),
                                diariesRecordReference1);
                        _shouldSetState = true;
                        if (_model.isCommentDeleted) {
                          // Delete tmp_ai_comment

                          await _model.newDiariesDoc2!.reference.update({
                            ...createDiariesRecordData(
                              user: currentUserReference,
                              title: _model.titleTextController.text,
                              content: FFAppState().editorText,
                              createdTime: widget!.dateFocused,
                              modifiedTime: getCurrentTimestamp,
                              isPublic: _model.togglePublicValue,
                              moodScoreByUser: functions
                                  .doubleToInteger(_model.sliderValue!),
                              moodKeywordsDescription:
                                  _model.moodDescriptionTextController.text,
                            ),
                            ...mapToFirestore(
                              {
                                'tmp_ai_comment': FieldValue.delete(),
                                'mood_keywords': _model.moodKeywordsSelected,
                                'ai_comment_by': FieldValue.delete(),
                              },
                            ),
                          });
                        } else {
                          // Non-Delete tmp_ai_comment

                          await _model.newDiariesDoc2!.reference.update({
                            ...createDiariesRecordData(
                              user: currentUserReference,
                              title: _model.titleTextController.text,
                              content: FFAppState().editorText,
                              createdTime: widget!.dateFocused,
                              modifiedTime: getCurrentTimestamp,
                              isPublic: _model.togglePublicValue,
                              tmpAiComment: _model.aiCommentContent,
                              moodScoreByUser: functions
                                  .doubleToInteger(_model.sliderValue!),
                              moodKeywordsDescription:
                                  _model.moodDescriptionTextController.text,
                              aiCommentBy: _model.aiCommentBy,
                            ),
                            ...mapToFirestore(
                              {
                                'mood_keywords': _model.moodKeywordsSelected,
                              },
                            ),
                          });
                        }

                        _model.tmpDiariesDocRefForCreateNewChat =
                            _model.newDiariesDoc2?.reference;
                        safeSetState(() {});
                      }

                      _model.tmpDiariesDoc2 =
                          await DiariesRecord.getDocumentOnce(
                              _model.tmpDiariesDocRefForCreateNewChat!);
                      _shouldSetState = true;
                      // diarySummaryOutput
                      _model.diarySummaryOutput2 =
                          await OpenAIAPIGroup.createChatCompletionCall.call(
                        messagesJson: functions
                            .tmpGetDiarySummarize(_model.tmpDiariesDoc2!),
                      );

                      _shouldSetState = true;
                      // New Chat

                      var chatsRecordReference = ChatsRecord.collection.doc();
                      await chatsRecordReference.set({
                        ...createChatsRecordData(
                          uid: currentUserReference,
                          timestamp: getCurrentTimestamp,
                          title: random_data.randomString(
                            8,
                            8,
                            true,
                            true,
                            false,
                          ),
                          character: _model.aiCommentBy,
                        ),
                        ...mapToFirestore(
                          {
                            'linked_diaries': [
                              _model.tmpDiariesDocRefForCreateNewChat
                            ],
                          },
                        ),
                      });
                      _model.newChatDoc = ChatsRecord.getDocumentFromData({
                        ...createChatsRecordData(
                          uid: currentUserReference,
                          timestamp: getCurrentTimestamp,
                          title: random_data.randomString(
                            8,
                            8,
                            true,
                            true,
                            false,
                          ),
                          character: _model.aiCommentBy,
                        ),
                        ...mapToFirestore(
                          {
                            'linked_diaries': [
                              _model.tmpDiariesDocRefForCreateNewChat
                            ],
                          },
                        ),
                      }, chatsRecordReference);
                      _shouldSetState = true;
                      // New Message from Summary

                      await MessagesRecord.createDoc(
                              _model.newChatDoc!.reference)
                          .set(createMessagesRecordData(
                        role: Role.developer,
                        content: valueOrDefault<String>(
                          OpenAIAPIGroup.createChatCompletionCall
                              .gptResponseContent(
                            (_model.diarySummaryOutput2?.jsonBody ?? ''),
                          ),
                          'diarySummaryOutput',
                        ),
                        created: getCurrentTimestamp,
                      ));
                      _model.userDoc = await UsersRecord.getDocumentOnce(
                          currentUserReference!);
                      _shouldSetState = true;
                      _model.diaryAICommentBy =
                          await CharactersRecord.getDocumentOnce(
                              _model.aiCommentBy!);
                      _shouldSetState = true;
                      // Output chatFromDiary
                      _model.chatFromDiary =
                          await OpenAIAPIGroup.createChatCompletionCall.call(
                        messagesJson: functions.tmpGetAIChat(
                            OpenAIAPIGroup.createChatCompletionCall
                                .gptResponseContent(
                              (_model.diarySummaryOutput2?.jsonBody ?? ''),
                            ),
                            _model.userDoc!,
                            _model.diaryAICommentBy!.officialName,
                            CharacterPersonaSettingStruct()),
                      );

                      _shouldSetState = true;
                      // New Message from chatFromDiary

                      await MessagesRecord.createDoc(
                              _model.newChatDoc!.reference)
                          .set(createMessagesRecordData(
                        role: Role.assistant,
                        content: valueOrDefault<String>(
                          OpenAIAPIGroup.createChatCompletionCall
                              .gptResponseContent(
                            (_model.chatFromDiary?.jsonBody ?? ''),
                          ),
                          'chatFromDiaryOutput',
                        ),
                        created: getCurrentTimestamp,
                      ));
                      // Add chatRef to Diary

                      await _model.tmpDiariesDocRefForCreateNewChat!.update({
                        ...createDiariesRecordData(
                          diaryContentSummarized: valueOrDefault<String>(
                            OpenAIAPIGroup.createChatCompletionCall
                                .gptResponseContent(
                              (_model.diarySummaryOutput2?.jsonBody ?? ''),
                            ),
                            'diarySummaryOutput',
                          ),
                        ),
                        ...mapToFirestore(
                          {
                            'linked_chats': FieldValue.arrayUnion(
                                [_model.newChatDoc?.reference]),
                          },
                        ),
                      });

                      context.goNamed(
                        'ChatPage',
                        queryParameters: {
                          'chatRefParam': serializeParam(
                            _model.newChatDoc?.reference,
                            ParamType.DocumentReference,
                          ),
                        }.withoutNulls,
                      );

                      if (_shouldSetState) safeSetState(() {});
                    },
                    text: 'Save Diary and Chat with AI',
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 56.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).info,
                                letterSpacing: 0.0,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      final linkedChatRefList = _model.linkedChatsRef.toList();

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: linkedChatRefList.length,
                        itemBuilder: (context, linkedChatRefListIndex) {
                          final linkedChatRefListItem =
                              linkedChatRefList[linkedChatRefListIndex];
                          return StreamBuilder<ChatsRecord>(
                            stream:
                                ChatsRecord.getDocument(linkedChatRefListItem),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: SpinKitWanderingCubes(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }

                              final diaryCardChatChatsRecord = snapshot.data!;

                              return DiaryCardChatWidget(
                                key: Key(
                                    'Keya8c_${linkedChatRefListIndex}_of_${linkedChatRefList.length}'),
                                chatDoc: diaryCardChatChatsRecord,
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ].divide(SizedBox(height: 20.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
