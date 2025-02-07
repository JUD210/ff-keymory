import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/chat_page/t_m_p_model_chooser/t_m_p_model_chooser_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 't_m_p_new_chat_page_model.dart';
export 't_m_p_new_chat_page_model.dart';

class TMPNewChatPageWidget extends StatefulWidget {
  const TMPNewChatPageWidget({super.key});

  @override
  State<TMPNewChatPageWidget> createState() => _TMPNewChatPageWidgetState();
}

class _TMPNewChatPageWidgetState extends State<TMPNewChatPageWidget> {
  late TMPNewChatPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TMPNewChatPageModel());

    _model.inputTextController ??= TextEditingController();
    _model.inputFocusNode ??= FocusNode();

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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).primary,
                icon: FaIcon(
                  FontAwesomeIcons.alignJustify,
                  color: FlutterFlowTheme.of(context).info,
                  size: 24.0,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
              Text(
                'New Chat',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Roboto',
                      color: Colors.white,
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                    ),
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 8.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).primary,
                icon: FaIcon(
                  FontAwesomeIcons.plus,
                  color: FlutterFlowTheme.of(context).info,
                  size: 24.0,
                ),
                onPressed: () async {
                  var _shouldSetState = false;
                  _model.assistantList =
                      await OpenAIAPIGroup.listAssistantsCall.call();

                  _shouldSetState = true;
                  if ((_model.assistantList?.succeeded ?? true)) {
                    _model.assistantGot =
                        await OpenAIAPIGroup.getAssistantCall.call(
                      assistantId: 'asst_wPsD5ln34oAGBVfNT7giLfir',
                    );

                    _shouldSetState = true;
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('test'),
                          content: Text(
                              (_model.assistantGot?.jsonBody ?? '').toString()),
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
                  } else {
                    if (_shouldSetState) safeSetState(() {});
                    return;
                  }

                  if (_shouldSetState) safeSetState(() {});
                },
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: wrapWithModel(
                        model: _model.tMPModelChooserModel,
                        updateCallback: () => safeSetState(() {}),
                        child: TMPModelChooserWidget(),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Builder(
                          builder: (context) {
                            final hintList =
                                FFAppState().hintPromptList.toList();

                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: List.generate(hintList.length,
                                      (hintListIndex) {
                                final hintListItem = hintList[hintListIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            hintListItem.title,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Text(
                                            hintListItem.desc,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 11.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              })
                                  .divide(SizedBox(height: 12.0))
                                  .addToEnd(SizedBox(height: 12.0)),
                            );
                          },
                        ),
                        Container(
                          width: double.infinity,
                          height: 100.0,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Divider(
                                thickness: 2.0,
                                color: Color(0x80E0E3E7),
                              ),
                              Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 0.0, 0.0),
                                          child: Container(
                                            width: 200.0,
                                            child: TextFormField(
                                              controller:
                                                  _model.inputTextController,
                                              focusNode: _model.inputFocusNode,
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: false,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintText:
                                                    'Ask Somi out on a date...',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color:
                                                              Color(0x809493A6),
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                focusedErrorBorder:
                                                    InputBorder.none,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        letterSpacing: 0.0,
                                                      ),
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              validator: _model
                                                  .inputTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderRadius: 8.0,
                                          buttonSize: 50.0,
                                          icon: Icon(
                                            Icons.send_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            size: 30.0,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ].addToStart(SizedBox(height: 12.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
