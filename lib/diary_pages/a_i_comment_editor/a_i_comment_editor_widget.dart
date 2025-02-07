import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'a_i_comment_editor_model.dart';
export 'a_i_comment_editor_model.dart';

class AICommentEditorWidget extends StatefulWidget {
  const AICommentEditorWidget({
    super.key,
    this.aiCommentContent,
    required this.moodScoreByUser,
  });

  final String? aiCommentContent;
  final int? moodScoreByUser;

  @override
  State<AICommentEditorWidget> createState() => _AICommentEditorWidgetState();
}

class _AICommentEditorWidgetState extends State<AICommentEditorWidget> {
  late AICommentEditorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AICommentEditorModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.aiCommentContentResult = widget!.aiCommentContent;
      safeSetState(() {});
    });

    _model.commentTextFieldTextController ??= TextEditingController(
        text: _model.aiCommentContentResult != null &&
                _model.aiCommentContentResult != ''
            ? _model.aiCommentContentResult
            : '답변 생성 대기중...');
    _model.commentTextFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Material(
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
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(-1.0, -1.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.safePop();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'AI Comment',
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('To Do Later'),
                              content: Text('AI 관련 세팅을 하기 위한 아이콘'),
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
                      },
                      child: Icon(
                        Icons.psychology,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                child: TextFormField(
                  controller: _model.commentTextFieldTextController,
                  focusNode: _model.commentTextFieldFocusNode,
                  autofocus: false,
                  readOnly: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: true,
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Roboto',
                              letterSpacing: 0.0,
                            ),
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Roboto',
                              letterSpacing: 0.0,
                            ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
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
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).alternate,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Roboto',
                        color: FlutterFlowTheme.of(context).tertiary,
                        letterSpacing: 0.0,
                      ),
                  maxLines: 5,
                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                  validator: _model.commentTextFieldTextControllerValidator
                      .asValidator(context),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 70.0,
                    decoration: BoxDecoration(),
                    child: Text(
                      '캐릭터',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Roboto',
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Expanded(
                    child: FlutterFlowChoiceChips(
                      options: [ChipData('소미'), ChipData('세나'), ChipData('효기')],
                      onChanged: (val) async {
                        safeSetState(() =>
                            _model.choiceChipsCharValue = val?.firstOrNull);
                        _model.aiCommentBy = await queryCharactersRecordOnce(
                          queryBuilder: (charactersRecord) =>
                              charactersRecord.where(
                            'official_name',
                            isEqualTo: _model.choiceChipsCharValue,
                          ),
                          singleRecord: true,
                        ).then((s) => s.firstOrNull);

                        safeSetState(() {});
                      },
                      selectedChipStyle: ChipStyle(
                        backgroundColor: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                ),
                        iconColor: FlutterFlowTheme.of(context).info,
                        iconSize: 16.0,
                        elevation: 1.0,
                        borderColor: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      unselectedChipStyle: ChipStyle(
                        backgroundColor: Color(0x00000000),
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                        iconColor: FlutterFlowTheme.of(context).secondaryText,
                        iconSize: 16.0,
                        elevation: 1.0,
                        borderColor: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      chipSpacing: 8.0,
                      rowSpacing: 8.0,
                      multiselect: false,
                      initialized: _model.choiceChipsCharValue != null,
                      alignment: WrapAlignment.start,
                      controller: _model.choiceChipsCharValueController ??=
                          FormFieldController<List<String>>(
                        ['소미'],
                      ),
                      wrapped: true,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 70.0,
                    decoration: BoxDecoration(),
                    child: Text(
                      '답변 양식',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Roboto',
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Expanded(
                    child: FlutterFlowChoiceChips(
                      options: [
                        ChipData('치유형'),
                        ChipData('조언형'),
                        ChipData('정보형')
                      ],
                      onChanged: (val) => safeSetState(() =>
                          _model.choiceChipsReplyTypeValue = val?.firstOrNull),
                      selectedChipStyle: ChipStyle(
                        backgroundColor: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                ),
                        iconColor: FlutterFlowTheme.of(context).info,
                        iconSize: 16.0,
                        elevation: 1.0,
                        borderColor: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      unselectedChipStyle: ChipStyle(
                        backgroundColor: Color(0x00000000),
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                        iconColor: FlutterFlowTheme.of(context).secondaryText,
                        iconSize: 16.0,
                        elevation: 1.0,
                        borderColor: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      chipSpacing: 8.0,
                      rowSpacing: 8.0,
                      multiselect: false,
                      initialized: _model.choiceChipsReplyTypeValue != null,
                      alignment: WrapAlignment.start,
                      controller: _model.choiceChipsReplyTypeValueController ??=
                          FormFieldController<List<String>>(
                        ['치유형'],
                      ),
                      wrapped: true,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 70.0,
                    decoration: BoxDecoration(),
                    child: Text(
                      '답변 길이',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Roboto',
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Expanded(
                    child: FlutterFlowChoiceChips(
                      options: [
                        ChipData('짧게'),
                        ChipData('보통'),
                        ChipData('자세히')
                      ],
                      onChanged: (val) => safeSetState(() => _model
                          .choiceChipsReplyLengthValue = val?.firstOrNull),
                      selectedChipStyle: ChipStyle(
                        backgroundColor: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                ),
                        iconColor: FlutterFlowTheme.of(context).info,
                        iconSize: 16.0,
                        elevation: 1.0,
                        borderColor: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      unselectedChipStyle: ChipStyle(
                        backgroundColor: Color(0x00000000),
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                        iconColor: FlutterFlowTheme.of(context).secondaryText,
                        iconSize: 16.0,
                        elevation: 1.0,
                        borderColor: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      chipSpacing: 8.0,
                      rowSpacing: 8.0,
                      multiselect: false,
                      initialized: _model.choiceChipsReplyLengthValue != null,
                      alignment: WrapAlignment.start,
                      controller:
                          _model.choiceChipsReplyLengthValueController ??=
                              FormFieldController<List<String>>(
                        ['짧게'],
                      ),
                      wrapped: true,
                    ),
                  ),
                ],
              ),
              FFButtonWidget(
                onPressed: () async {
                  _model.gptCommentBody =
                      await OpenAIAPIGroup.createDiaryCommentCall.call(
                    messagesJson: functions.tmpGetAIComment(
                        widget!.moodScoreByUser!,
                        _model.choiceChipsCharValue!,
                        FFAppState().editorText,
                        _model.choiceChipsReplyLengthValue,
                        _model.choiceChipsReplyTypeValue),
                  );

                  _model.aiCommentContentResult =
                      OpenAIAPIGroup.createDiaryCommentCall.gptResponseContent(
                    (_model.gptCommentBody?.jsonBody ?? ''),
                  );
                  safeSetState(() {});
                  safeSetState(() {
                    _model.commentTextFieldTextController?.text =
                        _model.aiCommentContentResult!;
                  });

                  safeSetState(() {});
                },
                text: '답변 받기',
                options: FFButtonOptions(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 56.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  textStyle: FlutterFlowTheme.of(context).titleMedium.override(
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
                  Navigator.pop(
                      context,
                      AiCommentPageReturnObjectStruct(
                        aiCommentContent: _model.aiCommentContentResult,
                        aiCommentBy: _model.aiCommentBy?.reference,
                      ));
                },
                text: '저장하기',
                options: FFButtonOptions(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 56.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  textStyle: FlutterFlowTheme.of(context).titleMedium.override(
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
            ].divide(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
