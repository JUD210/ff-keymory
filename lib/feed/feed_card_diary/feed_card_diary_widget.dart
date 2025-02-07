import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'feed_card_diary_model.dart';
export 'feed_card_diary_model.dart';

class FeedCardDiaryWidget extends StatefulWidget {
  const FeedCardDiaryWidget({
    super.key,
    required this.diariesDoc,
  });

  final DiariesRecord? diariesDoc;

  @override
  State<FeedCardDiaryWidget> createState() => _FeedCardDiaryWidgetState();
}

class _FeedCardDiaryWidgetState extends State<FeedCardDiaryWidget> {
  late FeedCardDiaryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedCardDiaryModel());

    _model.textController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget!.diariesDoc?.tmpAiComment,
      'tmp_ai_comment',
    ));
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          context.pushNamed(
            'CreateEditDiary',
            queryParameters: {
              'diariesDoc': serializeParam(
                widget!.diariesDoc,
                ParamType.Document,
              ),
              'isEditMode': serializeParam(
                true,
                ParamType.bool,
              ),
            }.withoutNulls,
            extra: <String, dynamic>{
              'diariesDoc': widget!.diariesDoc,
            },
          );
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 2.0,
                color: valueOrDefault<Color>(
                  functions.moodScoreToColor(
                      widget!.diariesDoc!.moodScoreByUser.toDouble()),
                  Color(0xFFFF5E5E),
                ),
                offset: Offset(
                  0.0,
                  -6.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 8.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 210.0,
                              decoration: BoxDecoration(),
                              child: Text(
                                valueOrDefault<String>(
                                  widget!.diariesDoc?.title,
                                  'title',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Color(0xFF101213),
                                      fontSize: 22.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                dateTimeFormat(
                                  "y/M/d hh:mm",
                                  widget!.diariesDoc?.createdTime,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                'y/M/d hh:mm',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 150.0,
                        child: custom_widgets.FleatherViewerWidget(
                          width: double.infinity,
                          height: 150.0,
                          initialDeltaJson: valueOrDefault<String>(
                            widget!.diariesDoc?.content,
                            'content',
                          ),
                        ),
                      ),
                      if (widget!.diariesDoc?.tmpAiComment != null &&
                          widget!.diariesDoc?.tmpAiComment != '')
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            StreamBuilder<CharactersRecord>(
                              stream: CharactersRecord.getDocument(
                                  widget!.diariesDoc!.aiCommentBy!),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitWanderingCubes(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }

                                final imageCharactersRecord = snapshot.data!;

                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      imageCharactersRecord.profileImage,
                                      'https://w7.pngwing.com/pngs/1000/665/png-transparent-computer-icons-profile-s-free-angle-sphere-profile-cliparts-free-thumbnail.png',
                                    ),
                                    width: 50.0,
                                    height: 50.0,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            ),
                            Expanded(
                              child: Container(
                                width: 200.0,
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  autofocus: false,
                                  readOnly: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          letterSpacing: 0.0,
                                        ),
                                    hintText: 'TextField',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
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
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                      ),
                                  maxLines: 3,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
