import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/feed/feed_card_diary/feed_card_diary_widget.dart';
import '/feed/no_card/no_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_feed_model.dart';
export 'home_feed_model.dart';

class HomeFeedWidget extends StatefulWidget {
  const HomeFeedWidget({super.key});

  @override
  State<HomeFeedWidget> createState() => _HomeFeedWidgetState();
}

class _HomeFeedWidgetState extends State<HomeFeedWidget> {
  late HomeFeedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeFeedModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!((currentUserDisplayName != null && currentUserDisplayName != '') &&
          (valueOrDefault(currentUserDocument?.gender, '') != null &&
              valueOrDefault(currentUserDocument?.gender, '') != ''))) {}
      _model.dateToShow = getCurrentTimestamp;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
            child: FloatingActionButton(
              onPressed: () async {
                context.pushNamed(
                  'CreateEditDiary',
                  queryParameters: {
                    'isEditMode': serializeParam(
                      false,
                      ParamType.bool,
                    ),
                    'dateFocused': serializeParam(
                      _model.dateToShow,
                      ParamType.DateTime,
                    ),
                  }.withoutNulls,
                );
              },
              backgroundColor: FlutterFlowTheme.of(context).primary,
              elevation: 8.0,
              child: Icon(
                Icons.add_rounded,
                color: FlutterFlowTheme.of(context).info,
                size: 24.0,
              ),
            ),
          ),
        ),
        drawer: Drawer(
          elevation: 16.0,
          child: Text(
            '개발중입니다',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Roboto',
                  letterSpacing: 0.0,
                ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 8.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.menu,
                        color: FlutterFlowTheme.of(context).info,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        scaffoldKey.currentState!.openDrawer();
                      },
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context).primary,
                              icon: Icon(
                                Icons.arrow_back_ios_sharp,
                                color: FlutterFlowTheme.of(context).info,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                _model.dateToShow =
                                    functions.modifyDateByCommand(
                                        _model.dateToShow!,
                                        DateCommand.decreaseDay);
                                safeSetState(() {});
                              },
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                final _datePickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: getCurrentTimestamp,
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2050),
                                  builder: (context, child) {
                                    return wrapInMaterialDatePickerTheme(
                                      context,
                                      child!,
                                      headerBackgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                      headerForegroundColor:
                                          FlutterFlowTheme.of(context).info,
                                      headerTextStyle:
                                          FlutterFlowTheme.of(context)
                                              .headlineLarge
                                              .override(
                                                fontFamily: 'Roboto',
                                                fontSize: 32.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                      pickerBackgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      pickerForegroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      selectedDateTimeBackgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                      selectedDateTimeForegroundColor:
                                          FlutterFlowTheme.of(context).info,
                                      actionButtonForegroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      iconSize: 24.0,
                                    );
                                  },
                                );

                                if (_datePickedDate != null) {
                                  safeSetState(() {
                                    _model.datePicked = DateTime(
                                      _datePickedDate.year,
                                      _datePickedDate.month,
                                      _datePickedDate.day,
                                    );
                                  });
                                }
                                if (_model.datePicked != null) {
                                  _model.dateToShow = _model.datePicked;
                                  safeSetState(() {});
                                }
                              },
                              text: dateTimeFormat(
                                "y년 M월 d일",
                                _model.dateToShow,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context).primary,
                              icon: Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: FlutterFlowTheme.of(context).info,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                _model.dateToShow =
                                    functions.modifyDateByCommand(
                                        _model.dateToShow!,
                                        DateCommand.increaseDay);
                                safeSetState(() {});
                              },
                            ),
                          ],
                        ),
                        Opacity(
                          opacity: 0.4,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.dateToShow = functions.modifyDateByCommand(
                                  _model.dateToShow!, DateCommand.gotoToday);
                              safeSetState(() {});
                            },
                            child: Text(
                              'Today',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 8.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.face,
                        color: FlutterFlowTheme.of(context).info,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        context.pushNamed('Profile');
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: StreamBuilder<List<DiariesRecord>>(
                    stream: queryDiariesRecord(
                      queryBuilder: (diariesRecord) => diariesRecord
                          .orderBy('created_time', descending: true),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: SpinKitWanderingCubes(
                              color: FlutterFlowTheme.of(context).primary,
                              size: 50.0,
                            ),
                          ),
                        );
                      }
                      List<DiariesRecord> feedListViewDiariesRecordList =
                          snapshot.data!;
                      if (feedListViewDiariesRecordList.isEmpty) {
                        return Center(
                          child: NoCardWidget(),
                        );
                      }

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: feedListViewDiariesRecordList.length,
                        itemBuilder: (context, feedListViewIndex) {
                          final feedListViewDiariesRecord =
                              feedListViewDiariesRecordList[feedListViewIndex];
                          return Visibility(
                            visible: (feedListViewDiariesRecord.createdTime! >
                                    functions.modifyDateByCommand(
                                        _model.dateToShow!,
                                        DateCommand.getLastTimeOfPrevDay)) &&
                                (feedListViewDiariesRecord.createdTime! <
                                    functions.modifyDateByCommand(
                                        _model.dateToShow!,
                                        DateCommand.getFirstTimeOfNextDay)) &&
                                (feedListViewDiariesRecord.user ==
                                    currentUserReference),
                            child: FeedCardDiaryWidget(
                              key: Key(
                                  'Keygig_${feedListViewIndex}_of_${feedListViewDiariesRecordList.length}'),
                              diariesDoc: feedListViewDiariesRecord,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
