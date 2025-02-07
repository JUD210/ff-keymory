import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 't_m_p_model_chooser_model.dart';
export 't_m_p_model_chooser_model.dart';

class TMPModelChooserWidget extends StatefulWidget {
  const TMPModelChooserWidget({super.key});

  @override
  State<TMPModelChooserWidget> createState() => _TMPModelChooserWidgetState();
}

class _TMPModelChooserWidgetState extends State<TMPModelChooserWidget> {
  late TMPModelChooserModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TMPModelChooserModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 50.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        FFAppState().whichModel = 0;
                        _model.updatePage(() {});
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.35,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: FFAppState().whichModel != 0
                              ? FlutterFlowTheme.of(context).secondary
                              : FlutterFlowTheme.of(context).tertiary,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Gemini 2.0 Flash',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        FFAppState().whichModel = 1;
                        _model.updatePage(() {});
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.28,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: FFAppState().whichModel != 1
                              ? FlutterFlowTheme.of(context).secondary
                              : FlutterFlowTheme.of(context).tertiary,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'GPT 4o mini',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        FFAppState().whichModel = 2;
                        _model.updatePage(() {});
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.26,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: FFAppState().whichModel != 2
                              ? FlutterFlowTheme.of(context).secondary
                              : FlutterFlowTheme.of(context).tertiary,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'GPT 4o',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: RichText(
                  textScaler: MediaQuery.of(context).textScaler,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: () {
                          if (FFAppState().whichModel == 0) {
                            return 'Gemini 2.0 Flash is Google’s latest multimodal AI model.  For long text tasks, it performs similarly to 4o, It’s still in the experimental stage, so for now, it\'s available for free.';
                          } else if (FFAppState().whichModel == 1) {
                            return 'GPT 4o mini costs 880 won per 1 million tokens, which is almost free. Considering the cost, it could be regarded as the most ideal model for implementation in actual service.';
                          } else {
                            return 'It’s expensive. For a casual single-sentence call, it costs 2.2 won per call. With a \$10 budget, you can use it about 6,700 times, which comes out to around 67,000 tokens per \$1.';
                          }
                        }(),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 13.0,
                              letterSpacing: 0.0,
                            ),
                      )
                    ],
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Roboto',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ),
          ].divide(SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}
