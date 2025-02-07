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
import 'a_i_comment_editor_widget.dart' show AICommentEditorWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AICommentEditorModel extends FlutterFlowModel<AICommentEditorWidget> {
  ///  Local state fields for this component.

  String? aiCommentContentResult;

  ///  State fields for stateful widgets in this component.

  // State field(s) for CommentTextField widget.
  FocusNode? commentTextFieldFocusNode;
  TextEditingController? commentTextFieldTextController;
  String? Function(BuildContext, String?)?
      commentTextFieldTextControllerValidator;
  // State field(s) for ChoiceChipsChar widget.
  FormFieldController<List<String>>? choiceChipsCharValueController;
  String? get choiceChipsCharValue =>
      choiceChipsCharValueController?.value?.firstOrNull;
  set choiceChipsCharValue(String? val) =>
      choiceChipsCharValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Firestore Query - Query a collection] action in ChoiceChipsChar widget.
  CharactersRecord? aiCommentBy;
  // State field(s) for ChoiceChipsReplyType widget.
  FormFieldController<List<String>>? choiceChipsReplyTypeValueController;
  String? get choiceChipsReplyTypeValue =>
      choiceChipsReplyTypeValueController?.value?.firstOrNull;
  set choiceChipsReplyTypeValue(String? val) =>
      choiceChipsReplyTypeValueController?.value = val != null ? [val] : [];
  // State field(s) for ChoiceChipsReplyLength widget.
  FormFieldController<List<String>>? choiceChipsReplyLengthValueController;
  String? get choiceChipsReplyLengthValue =>
      choiceChipsReplyLengthValueController?.value?.firstOrNull;
  set choiceChipsReplyLengthValue(String? val) =>
      choiceChipsReplyLengthValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - API (createDiaryComment)] action in Button widget.
  ApiCallResponse? gptCommentBody;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    commentTextFieldFocusNode?.dispose();
    commentTextFieldTextController?.dispose();
  }
}
