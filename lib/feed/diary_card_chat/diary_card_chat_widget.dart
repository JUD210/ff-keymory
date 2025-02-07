import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'diary_card_chat_model.dart';
export 'diary_card_chat_model.dart';

class DiaryCardChatWidget extends StatefulWidget {
  const DiaryCardChatWidget({
    super.key,
    required this.chatDoc,
  });

  final ChatsRecord? chatDoc;

  @override
  State<DiaryCardChatWidget> createState() => _DiaryCardChatWidgetState();
}

class _DiaryCardChatWidgetState extends State<DiaryCardChatWidget> {
  late DiaryCardChatModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DiaryCardChatModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          context.pushNamed(
            'ChatPage',
            queryParameters: {
              'chatRefParam': serializeParam(
                widget!.chatDoc?.reference,
                ParamType.DocumentReference,
              ),
            }.withoutNulls,
          );
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 2.0,
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
                            12.0, 8.0, 12.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 200.0,
                              decoration: BoxDecoration(),
                              child: Text(
                                valueOrDefault<String>(
                                  widget!.chatDoc?.title,
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
                                  widget!.chatDoc?.timestamp,
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
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          StreamBuilder<CharactersRecord>(
                            stream: CharactersRecord.getDocument(
                                widget!.chatDoc!.character!),
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
                            child: StreamBuilder<List<MessagesRecord>>(
                              stream: queryMessagesRecord(
                                parent: widget!.chatDoc?.reference,
                                queryBuilder: (messagesRecord) => messagesRecord
                                    .orderBy('created', descending: true),
                                singleRecord: true,
                              ),
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
                                List<MessagesRecord>
                                    textFieldMessagesRecordList =
                                    snapshot.data!;
                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final textFieldMessagesRecord =
                                    textFieldMessagesRecordList.isNotEmpty
                                        ? textFieldMessagesRecordList.first
                                        : null;

                                return Container(
                                  width: 200.0,
                                  child: TextFormField(
                                    controller: _model.textController ??=
                                        TextEditingController(
                                      text: textFieldMessagesRecord?.content,
                                    ),
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
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
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
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                );
                              },
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
