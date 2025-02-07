import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/chat_page/chat_history_edit_menu/chat_history_edit_menu_widget.dart';
import '/feed/chat_card_diary/chat_card_diary_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'chat_page_widget.dart' show ChatPageWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatPageModel extends FlutterFlowModel<ChatPageWidget> {
  ///  Local state fields for this page.

  List<MessagesRecord> messages = [];
  void addToMessages(MessagesRecord item) => messages.add(item);
  void removeFromMessages(MessagesRecord item) => messages.remove(item);
  void removeAtIndexFromMessages(int index) => messages.removeAt(index);
  void insertAtIndexInMessages(int index, MessagesRecord item) =>
      messages.insert(index, item);
  void updateMessagesAtIndex(int index, Function(MessagesRecord) updateFn) =>
      messages[index] = updateFn(messages[index]);

  DocumentReference? chatRef;

  bool isNewMessage = true;

  DocumentReference? selectedCharacterRef;

  String? selectedCharacterName;

  DateTime? chatDate;

  String? chatTitle = '제목 없음';

  List<DocumentReference> linkedDiariesRef = [];
  void addToLinkedDiariesRef(DocumentReference item) =>
      linkedDiariesRef.add(item);
  void removeFromLinkedDiariesRef(DocumentReference item) =>
      linkedDiariesRef.remove(item);
  void removeAtIndexFromLinkedDiariesRef(int index) =>
      linkedDiariesRef.removeAt(index);
  void insertAtIndexInLinkedDiariesRef(int index, DocumentReference item) =>
      linkedDiariesRef.insert(index, item);
  void updateLinkedDiariesRefAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      linkedDiariesRef[index] = updateFn(linkedDiariesRef[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in ChatPage widget.
  ChatsRecord? oPLChatDoc;
  // Stores action output result for [Backend Call - Read Document] action in ChatPage widget.
  CharactersRecord? oPLCharacterDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in ChatPage widget.
  List<MessagesRecord>? oPLMessageDocList;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  CharactersRecord? selectedCharacterDoc;
  // State field(s) for Input widget.
  FocusNode? inputFocusNode;
  TextEditingController? inputTextController;
  String? Function(BuildContext, String?)? inputTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  MessagesRecord? ongoingChatNewMessage;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<MessagesRecord>? ongoingChatUserMessage;
  // Stores action output result for [Backend Call - API (createChatCompletion)] action in IconButton widget.
  ApiCallResponse? ongoingChatResponse;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  MessagesRecord? ongoingChatAssistantDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<MessagesRecord>? finalOngoingChatAllMessages;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ChatsRecord? newChatDoc;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  MessagesRecord? newChatNewMessage;
  // Stores action output result for [Backend Call - API (createChatCompletion)] action in IconButton widget.
  ApiCallResponse? newChatResponse;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  MessagesRecord? newChatAssistantDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<MessagesRecord>? finalNewChatAllMessages;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  MessagesRecord? queryCollectionFromPageState;
  // Stores action output result for [Backend Call - API (createChatCompletion)] action in IconButton widget.
  ApiCallResponse? chatSummerizeResponse;
  // State field(s) for ChatHistorySearchBar widget.
  FocusNode? chatHistorySearchBarFocusNode;
  TextEditingController? chatHistorySearchBarTextController;
  String? Function(BuildContext, String?)?
      chatHistorySearchBarTextControllerValidator;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  ChatsRecord? selectedChat;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  CharactersRecord? chatCharacter;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<MessagesRecord>? loadedChatMessages;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inputFocusNode?.dispose();
    inputTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();

    chatHistorySearchBarFocusNode?.dispose();
    chatHistorySearchBarTextController?.dispose();
  }
}
