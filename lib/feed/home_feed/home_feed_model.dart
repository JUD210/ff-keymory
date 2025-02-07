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
import 'home_feed_widget.dart' show HomeFeedWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeFeedModel extends FlutterFlowModel<HomeFeedWidget> {
  ///  Local state fields for this page.

  DateTime? dateToShow;

  ///  State fields for stateful widgets in this page.

  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
