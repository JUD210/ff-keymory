import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_card_diary_model.dart';
export 'chat_card_diary_model.dart';

class ChatCardDiaryWidget extends StatefulWidget {
  const ChatCardDiaryWidget({
    super.key,
    required this.diariesDoc,
  });

  final DiariesRecord? diariesDoc;

  @override
  State<ChatCardDiaryWidget> createState() => _ChatCardDiaryWidgetState();
}

class _ChatCardDiaryWidgetState extends State<ChatCardDiaryWidget> {
  late ChatCardDiaryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatCardDiaryModel());

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
