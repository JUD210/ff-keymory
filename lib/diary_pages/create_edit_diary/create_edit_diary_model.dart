import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/diary_pages/a_i_comment_editor/a_i_comment_editor_widget.dart';
import '/feed/diary_card_chat/diary_card_chat_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'create_edit_diary_widget.dart' show CreateEditDiaryWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateEditDiaryModel extends FlutterFlowModel<CreateEditDiaryWidget> {
  ///  Local state fields for this page.

  String? aiCommentContent;

  bool isCommentDeleted = false;

  DateTime? diaryDateTime;

  List<String> moodKeywordsSelected = [];
  void addToMoodKeywordsSelected(String item) => moodKeywordsSelected.add(item);
  void removeFromMoodKeywordsSelected(String item) =>
      moodKeywordsSelected.remove(item);
  void removeAtIndexFromMoodKeywordsSelected(int index) =>
      moodKeywordsSelected.removeAt(index);
  void insertAtIndexInMoodKeywordsSelected(int index, String item) =>
      moodKeywordsSelected.insert(index, item);
  void updateMoodKeywordsSelectedAtIndex(
          int index, Function(String) updateFn) =>
      moodKeywordsSelected[index] = updateFn(moodKeywordsSelected[index]);

  DocumentReference? aiCommentBy;

  DocumentReference? tmpDiariesDocRefForCreateNewChat;

  List<DocumentReference> linkedChatsRef = [];
  void addToLinkedChatsRef(DocumentReference item) => linkedChatsRef.add(item);
  void removeFromLinkedChatsRef(DocumentReference item) =>
      linkedChatsRef.remove(item);
  void removeAtIndexFromLinkedChatsRef(int index) =>
      linkedChatsRef.removeAt(index);
  void insertAtIndexInLinkedChatsRef(int index, DocumentReference item) =>
      linkedChatsRef.insert(index, item);
  void updateLinkedChatsRefAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      linkedChatsRef[index] = updateFn(linkedChatsRef[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for Slider widget.
  double? sliderValue;
  // State field(s) for MoodKeywordsRate5 widget.
  FormFieldController<List<String>>? moodKeywordsRate5ValueController;
  List<String>? get moodKeywordsRate5Values =>
      moodKeywordsRate5ValueController?.value;
  set moodKeywordsRate5Values(List<String>? val) =>
      moodKeywordsRate5ValueController?.value = val;
  // State field(s) for MoodKeywordsRate4 widget.
  FormFieldController<List<String>>? moodKeywordsRate4ValueController;
  List<String>? get moodKeywordsRate4Values =>
      moodKeywordsRate4ValueController?.value;
  set moodKeywordsRate4Values(List<String>? val) =>
      moodKeywordsRate4ValueController?.value = val;
  // State field(s) for MoodKeywordsRate3 widget.
  FormFieldController<List<String>>? moodKeywordsRate3ValueController;
  List<String>? get moodKeywordsRate3Values =>
      moodKeywordsRate3ValueController?.value;
  set moodKeywordsRate3Values(List<String>? val) =>
      moodKeywordsRate3ValueController?.value = val;
  // State field(s) for MoodKeywordsRate2 widget.
  FormFieldController<List<String>>? moodKeywordsRate2ValueController;
  List<String>? get moodKeywordsRate2Values =>
      moodKeywordsRate2ValueController?.value;
  set moodKeywordsRate2Values(List<String>? val) =>
      moodKeywordsRate2ValueController?.value = val;
  // State field(s) for MoodKeywordsRate1 widget.
  FormFieldController<List<String>>? moodKeywordsRate1ValueController;
  List<String>? get moodKeywordsRate1Values =>
      moodKeywordsRate1ValueController?.value;
  set moodKeywordsRate1Values(List<String>? val) =>
      moodKeywordsRate1ValueController?.value = val;
  // State field(s) for MoodKeywordsSelectedViewer widget.
  FormFieldController<List<String>>? moodKeywordsSelectedViewerValueController;
  List<String>? get moodKeywordsSelectedViewerValues =>
      moodKeywordsSelectedViewerValueController?.value;
  set moodKeywordsSelectedViewerValues(List<String>? val) =>
      moodKeywordsSelectedViewerValueController?.value = val;
  // State field(s) for MoodDescription widget.
  FocusNode? moodDescriptionFocusNode;
  TextEditingController? moodDescriptionTextController;
  String? Function(BuildContext, String?)?
      moodDescriptionTextControllerValidator;
  // State field(s) for Title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  // Stores action output result for [Bottom Sheet - AICommentEditor] action in GetAIComment widget.
  AiCommentPageReturnObjectStruct? aiCommentPageReturnObj;
  // State field(s) for TogglePublic widget.
  bool? togglePublicValue;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DiariesRecord? newDiariesDoc1;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  DiariesRecord? tmpDiariesDoc1;
  // Stores action output result for [Backend Call - API (createChatCompletion)] action in Button widget.
  ApiCallResponse? diarySummaryOutput1;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DiariesRecord? newDiariesDoc2;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  DiariesRecord? tmpDiariesDoc2;
  // Stores action output result for [Backend Call - API (createChatCompletion)] action in Button widget.
  ApiCallResponse? diarySummaryOutput2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? newChatDoc;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? userDoc;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CharactersRecord? diaryAICommentBy;
  // Stores action output result for [Backend Call - API (createChatCompletion)] action in Button widget.
  ApiCallResponse? chatFromDiary;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    moodDescriptionFocusNode?.dispose();
    moodDescriptionTextController?.dispose();

    titleFocusNode?.dispose();
    titleTextController?.dispose();
  }
}
