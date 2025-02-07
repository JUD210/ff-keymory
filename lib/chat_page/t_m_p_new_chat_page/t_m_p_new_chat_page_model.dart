import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/chat_page/t_m_p_model_chooser/t_m_p_model_chooser_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 't_m_p_new_chat_page_widget.dart' show TMPNewChatPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TMPNewChatPageModel extends FlutterFlowModel<TMPNewChatPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TMPModelChooser component.
  late TMPModelChooserModel tMPModelChooserModel;
  // State field(s) for Input widget.
  FocusNode? inputFocusNode;
  TextEditingController? inputTextController;
  String? Function(BuildContext, String?)? inputTextControllerValidator;
  // Stores action output result for [Backend Call - API (listAssistants)] action in IconButton widget.
  ApiCallResponse? assistantList;
  // Stores action output result for [Backend Call - API (getAssistant)] action in IconButton widget.
  ApiCallResponse? assistantGot;

  @override
  void initState(BuildContext context) {
    tMPModelChooserModel = createModel(context, () => TMPModelChooserModel());
  }

  @override
  void dispose() {
    tMPModelChooserModel.dispose();
    inputFocusNode?.dispose();
    inputTextController?.dispose();
  }
}
