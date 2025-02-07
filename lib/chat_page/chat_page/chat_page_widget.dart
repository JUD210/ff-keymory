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
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_page_model.dart';
export 'chat_page_model.dart';

class ChatPageWidget extends StatefulWidget {
  const ChatPageWidget({
    super.key,
    this.chatRefParam,
  });

  final DocumentReference? chatRefParam;

  @override
  State<ChatPageWidget> createState() => _ChatPageWidgetState();
}

class _ChatPageWidgetState extends State<ChatPageWidget> {
  late ChatPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.chatRefParam != null) {
        _model.chatRef = widget!.chatRefParam;
      }
      if (_model.chatRef != null) {
        // Read ChatDoc
        _model.oPLChatDoc = await ChatsRecord.getDocumentOnce(_model.chatRef!);
        // Read CharacterDoc
        _model.oPLCharacterDoc = await CharactersRecord.getDocumentOnce(
            _model.oPLChatDoc!.character!);
        // Query MessageDocList
        _model.oPLMessageDocList = await queryMessagesRecordOnce(
          parent: _model.chatRef,
          queryBuilder: (messagesRecord) =>
              messagesRecord.orderBy('created', descending: true),
        );
        _model.isNewMessage = false;
        _model.selectedCharacterRef = _model.oPLChatDoc?.character;
        _model.selectedCharacterName = _model.oPLCharacterDoc?.officialName;
        _model.messages =
            _model.oPLMessageDocList!.toList().cast<MessagesRecord>();
        _model.chatDate = _model.oPLChatDoc?.timestamp;
        _model.chatTitle = _model.oPLChatDoc?.title;
        _model.linkedDiariesRef =
            _model.oPLChatDoc!.linkedDiaries.toList().cast<DocumentReference>();
        safeSetState(() {});
        safeSetState(() {
          _model.textController2?.text = _model.chatTitle!;
        });
      } else {
        _model.isNewMessage = true;
        _model.chatDate = getCurrentTimestamp;
        safeSetState(() {});
      }
    });

    _model.inputTextController ??= TextEditingController();
    _model.inputFocusNode ??= FocusNode();

    _model.textController2 ??= TextEditingController(text: _model.chatTitle);
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(
      () async {
        await _model.chatRef!.update(createChatsRecordData(
          title: _model.textController2.text,
        ));
      },
    );
    _model.chatHistorySearchBarTextController ??= TextEditingController();
    _model.chatHistorySearchBarFocusNode ??= FocusNode();

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
        drawer: Drawer(
          elevation: 16.0,
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primary,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Chat History',
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Roboto',
                            fontSize: 24.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.arrow_left_sharp,
                            color: FlutterFlowTheme.of(context).info,
                            size: 20.0,
                          ),
                          onPressed: () async {
                            if (scaffoldKey.currentState!.isDrawerOpen ||
                                scaffoldKey.currentState!.isEndDrawerOpen) {
                              Navigator.pop(context);
                            }
                          },
                        ),
                        Expanded(
                          child: Container(
                            width: 200.0,
                            child: TextFormField(
                              controller:
                                  _model.chatHistorySearchBarTextController,
                              focusNode: _model.chatHistorySearchBarFocusNode,
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      letterSpacing: 0.0,
                                    ),
                                hintText: 'search...',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                  ),
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model
                                  .chatHistorySearchBarTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.search,
                                color: FlutterFlowTheme.of(context).info,
                                size: 24.0,
                              ),
                              onPressed: () {
                                print('SearchChat pressed ...');
                              },
                            ),
                            FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.add_comment,
                                color: FlutterFlowTheme.of(context).info,
                                size: 24.0,
                              ),
                              onPressed: () {
                                print('NewChat pressed ...');
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(),
                      child: StreamBuilder<List<ChatsRecord>>(
                        stream: queryChatsRecord(
                          queryBuilder: (chatsRecord) => chatsRecord
                              .orderBy('timestamp', descending: true),
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
                          List<ChatsRecord> chatHistoryListViewChatsRecordList =
                              snapshot.data!;

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount:
                                chatHistoryListViewChatsRecordList.length,
                            itemBuilder: (context, chatHistoryListViewIndex) {
                              final chatHistoryListViewChatsRecord =
                                  chatHistoryListViewChatsRecordList[
                                      chatHistoryListViewIndex];
                              return Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          // close chat history drawer
                                          if (scaffoldKey
                                                  .currentState!.isDrawerOpen ||
                                              scaffoldKey.currentState!
                                                  .isEndDrawerOpen) {
                                            Navigator.pop(context);
                                          }

                                          // Output selectedChat
                                          _model.selectedChat =
                                              await ChatsRecord.getDocumentOnce(
                                                  chatHistoryListViewChatsRecord
                                                      .reference);
                                          // Output chatCharacter
                                          _model.chatCharacter =
                                              await CharactersRecord
                                                  .getDocumentOnce(
                                                      chatHistoryListViewChatsRecord
                                                          .character!);
                                          // Output loadedChatMessages
                                          _model.loadedChatMessages =
                                              await queryMessagesRecordOnce(
                                            parent:
                                                _model.selectedChat?.reference,
                                            queryBuilder: (messagesRecord) =>
                                                messagesRecord.orderBy(
                                                    'created',
                                                    descending: true),
                                          );
                                          _model.chatRef =
                                              _model.selectedChat?.reference;
                                          _model.selectedCharacterRef =
                                              chatHistoryListViewChatsRecord
                                                  .character;
                                          _model.isNewMessage = false;
                                          _model.messages = _model
                                              .loadedChatMessages!
                                              .toList()
                                              .cast<MessagesRecord>();
                                          _model.chatTitle =
                                              _model.selectedChat?.title;
                                          _model.chatDate =
                                              _model.selectedChat?.timestamp;
                                          _model.selectedCharacterName = _model
                                              .chatCharacter?.officialName;
                                          _model.linkedDiariesRef =
                                              chatHistoryListViewChatsRecord
                                                  .linkedDiaries
                                                  .toList()
                                                  .cast<DocumentReference>();
                                          safeSetState(() {});
                                          safeSetState(() {
                                            _model.textController2?.text =
                                                _model.chatTitle!;
                                          });

                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              StreamBuilder<CharactersRecord>(
                                                stream: CharactersRecord
                                                    .getDocument(
                                                        chatHistoryListViewChatsRecord
                                                            .character!),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            SpinKitWanderingCubes(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 50.0,
                                                        ),
                                                      ),
                                                    );
                                                  }

                                                  final columnCharactersRecord =
                                                      snapshot.data!;

                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(2.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      40.0),
                                                          child: Image.network(
                                                            valueOrDefault<
                                                                String>(
                                                              columnCharactersRecord
                                                                  .profileImage,
                                                              'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                                                            ),
                                                            width: 44.0,
                                                            height: 44.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        columnCharactersRecord
                                                            .officialName,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          chatHistoryListViewChatsRecord
                                                              .title,
                                                          'title',
                                                        ),
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                      StreamBuilder<
                                                          List<MessagesRecord>>(
                                                        stream:
                                                            queryMessagesRecord(
                                                          parent:
                                                              chatHistoryListViewChatsRecord
                                                                  .reference,
                                                          queryBuilder:
                                                              (messagesRecord) =>
                                                                  messagesRecord.orderBy(
                                                                      'created',
                                                                      descending:
                                                                          true),
                                                          singleRecord: true,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    SpinKitWanderingCubes(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 50.0,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<MessagesRecord>
                                                              chatMessageLastMessagesRecordList =
                                                              snapshot.data!;
                                                          // Return an empty Container when the item does not exist.
                                                          if (snapshot
                                                              .data!.isEmpty) {
                                                            return Container();
                                                          }
                                                          final chatMessageLastMessagesRecord =
                                                              chatMessageLastMessagesRecordList
                                                                      .isNotEmpty
                                                                  ? chatMessageLastMessagesRecordList
                                                                      .first
                                                                  : null;

                                                          return Text(
                                                            valueOrDefault<
                                                                String>(
                                                              chatMessageLastMessagesRecord
                                                                  ?.content,
                                                              'last message',
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            maxLines: 3,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          );
                                                        },
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                chatHistoryListViewChatsRecord
                                                                    .timestamp
                                                                    ?.toString(),
                                                                'Time Stamp',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) =>
                                          FlutterFlowIconButton(
                                        borderRadius: 8.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          Icons.more_vert,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          await showAlignedDialog(
                                            context: context,
                                            isGlobal: false,
                                            avoidOverflow: true,
                                            targetAnchor: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            followerAnchor:
                                                AlignmentDirectional(0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                            builder: (dialogContext) {
                                              return Material(
                                                color: Colors.transparent,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: Container(
                                                    height: 50.0,
                                                    width: 100.0,
                                                    child:
                                                        ChatHistoryEditMenuWidget(
                                                      chatDocRef:
                                                          chatHistoryListViewChatsRecord
                                                              .reference,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
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
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Container(
            width: double.infinity,
            child: Stack(
              alignment: AlignmentDirectional(0.0, 0.0),
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).primary,
                    icon: FaIcon(
                      FontAwesomeIcons.alignJustify,
                      color: FlutterFlowTheme.of(context).info,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      scaffoldKey.currentState!.openDrawer();
                    },
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.7,
                      height: 30.0,
                      decoration: BoxDecoration(),
                      child: Visibility(
                        visible:
                            _model.chatTitle != null && _model.chatTitle != '',
                        child: Container(
                          width: 200.0,
                          child: TextFormField(
                            controller: _model.textController2,
                            focusNode: _model.textFieldFocusNode,
                            autofocus: false,
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
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  fontSize: 17.0,
                                  letterSpacing: 0.0,
                                ),
                            textAlign: TextAlign.center,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.textController2Validator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                    if (_model.chatDate != null)
                      Text(
                        dateTimeFormat(
                          "y년 M월 d일",
                          _model.chatDate,
                          locale: FFLocalizations.of(context).languageCode,
                        ),
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Noto Sans',
                              color: Color(0x55E0E3E7),
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).primary,
                    icon: FaIcon(
                      FontAwesomeIcons.edit,
                      color: FlutterFlowTheme.of(context).info,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      _model.queryCollectionFromPageState =
                          await queryMessagesRecordOnce(
                        parent: _model.chatRef,
                        singleRecord: true,
                      ).then((s) => s.firstOrNull);
                      // getChatSummarize
                      _model.chatSummerizeResponse =
                          await OpenAIAPIGroup.createChatCompletionCall.call(
                        messagesJson: functions
                            .tmpGetAIChatSummarize(_model.messages.toList()),
                      );

                      if ((_model.chatSummerizeResponse?.succeeded ?? true)) {
                        await DiariesRecord.collection.doc().set({
                          ...createDiariesRecordData(
                            user: currentUserReference,
                            title: '제목 없음',
                            content: OpenAIAPIGroup.createChatCompletionCall
                                .gptResponseContent(
                              (_model.chatSummerizeResponse?.jsonBody ?? ''),
                            ),
                            createdTime: getCurrentTimestamp,
                            modifiedTime: getCurrentTimestamp,
                            isPublic: false,
                            tmpAiComment: '',
                            moodScoreByUser: 50,
                            moodKeywordsDescription: '',
                            aiCommentBy: _model.selectedCharacterRef,
                          ),
                          ...mapToFirestore(
                            {
                              'mood_keywords': ['신나는'],
                            },
                          ),
                        });
                      }

                      safeSetState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            decoration: BoxDecoration(),
            child: Container(
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if ((_model.chatRef == null) ||
                      (_model.selectedCharacterRef == null))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController ??=
                            FormFieldController<String>(
                          _model.dropDownValue ??= valueOrDefault<String>(
                            _model.selectedCharacterName,
                            'Select...',
                          ),
                        ),
                        options: ['소미', '세나', '효기'],
                        onChanged: (val) async {
                          safeSetState(() => _model.dropDownValue = val);
                          _model.selectedCharacterName = _model.dropDownValue;
                          safeSetState(() {});
                          _model.selectedCharacterDoc =
                              await queryCharactersRecordOnce(
                            queryBuilder: (charactersRecord) =>
                                charactersRecord.where(
                              'official_name',
                              isEqualTo: _model.selectedCharacterName,
                            ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);
                          _model.selectedCharacterRef =
                              _model.selectedCharacterDoc?.reference;
                          safeSetState(() {});

                          safeSetState(() {});
                        },
                        width: 310.0,
                        height: 52.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Roboto',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                        hintText: '대화할 캐릭터를 선택해주세요.',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 2.0,
                        borderColor: Colors.transparent,
                        borderWidth: 0.0,
                        borderRadius: 8.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        hidesUnderline: true,
                        isOverButton: false,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                    ),
                  Builder(
                    builder: (context) {
                      final linkedDiaryRefList =
                          _model.linkedDiariesRef.toList();

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: linkedDiaryRefList.length,
                        itemBuilder: (context, linkedDiaryRefListIndex) {
                          final linkedDiaryRefListItem =
                              linkedDiaryRefList[linkedDiaryRefListIndex];
                          return StreamBuilder<DiariesRecord>(
                            stream: DiariesRecord.getDocument(
                                linkedDiaryRefListItem),
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

                              final chatCardDiaryDiariesRecord = snapshot.data!;

                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'CreateEditDiary',
                                    queryParameters: {
                                      'diariesDoc': serializeParam(
                                        chatCardDiaryDiariesRecord,
                                        ParamType.Document,
                                      ),
                                      'isEditMode': serializeParam(
                                        true,
                                        ParamType.bool,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'diariesDoc': chatCardDiaryDiariesRecord,
                                    },
                                  );
                                },
                                child: ChatCardDiaryWidget(
                                  key: Key(
                                      'Key0c6_${linkedDiaryRefListIndex}_of_${linkedDiaryRefList.length}'),
                                  diariesDoc: chatCardDiaryDiariesRecord,
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Builder(
                        builder: (context) {
                          final messageItem = _model.messages.toList();

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            reverse: true,
                            scrollDirection: Axis.vertical,
                            itemCount: messageItem.length,
                            itemBuilder: (context, messageItemIndex) {
                              final messageItemItem =
                                  messageItem[messageItemIndex];
                              return Visibility(
                                visible: messageItemItem.role != Role.developer,
                                child: Builder(
                                  builder: (context) {
                                    if (valueOrDefault<bool>(
                                      messageItemItem.role == Role.user,
                                      true,
                                    )) {
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 6.0, 12.0, 6.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Expanded(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    messageItemItem.content,
                                                    'sample message',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'NanumBarunGothic',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.5,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: AuthUserStreamWidget(
                                                builder: (context) => ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      currentUserPhoto,
                                                      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                                                    ),
                                                    width: 50.0,
                                                    height: 50.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 6.0, 12.0, 6.0),
                                        child: StreamBuilder<ChatsRecord>(
                                          stream: ChatsRecord.getDocument(
                                              _model.chatRef!),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child: SpinKitWanderingCubes(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 50.0,
                                                  ),
                                                ),
                                              );
                                            }

                                            final rowChatsRecord =
                                                snapshot.data!;

                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: StreamBuilder<
                                                      CharactersRecord>(
                                                    stream: CharactersRecord
                                                        .getDocument(
                                                            rowChatsRecord
                                                                .character!),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                SpinKitWanderingCubes(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 50.0,
                                                            ),
                                                          ),
                                                        );
                                                      }

                                                      final imageCharactersRecord =
                                                          snapshot.data!;

                                                      return ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            imageCharactersRecord
                                                                .profileImage,
                                                            'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                                                          ),
                                                          width: 50.0,
                                                          height: 50.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 15.0,
                                                                0.0, 0.0),
                                                    child: custom_widgets
                                                        .MarkdownWidget(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      data: valueOrDefault<
                                                          String>(
                                                        messageItemItem.content,
                                                        'sample message',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      );
                                    }
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  if (_model.selectedCharacterRef != null)
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
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
                                              textInputAction:
                                                  TextInputAction.send,
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
                                                hintText: '대화를 입력해주세요.',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily: 'Ubuntu',
                                                          color:
                                                              Color(0x809493A6),
                                                          fontSize: 18.0,
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
                                          borderColor: Colors.transparent,
                                          borderRadius: 8.0,
                                          buttonSize: 50.0,
                                          icon: Icon(
                                            Icons.send_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            size: 30.0,
                                          ),
                                          onPressed: () async {
                                            var _shouldSetState = false;
                                            if (!(_model.inputTextController
                                                        .text !=
                                                    null &&
                                                _model.inputTextController
                                                        .text !=
                                                    '')) {
                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            }
                                            if (_model.chatRef != null) {
                                              // DB - Message(User)

                                              var messagesRecordReference1 =
                                                  MessagesRecord.createDoc(
                                                      _model.chatRef!);
                                              await messagesRecordReference1
                                                  .set(createMessagesRecordData(
                                                content: _model
                                                    .inputTextController.text,
                                                role: Role.user,
                                                created: getCurrentTimestamp,
                                              ));
                                              _model.ongoingChatNewMessage =
                                                  MessagesRecord.getDocumentFromData(
                                                      createMessagesRecordData(
                                                        content: _model
                                                            .inputTextController
                                                            .text,
                                                        role: Role.user,
                                                        created:
                                                            getCurrentTimestamp,
                                                      ),
                                                      messagesRecordReference1);
                                              _shouldSetState = true;
                                              safeSetState(() {
                                                _model.inputTextController
                                                    ?.clear();
                                              });
                                              _model.ongoingChatUserMessage =
                                                  await queryMessagesRecordOnce(
                                                parent: _model.chatRef,
                                                queryBuilder:
                                                    (messagesRecord) =>
                                                        messagesRecord.orderBy(
                                                            'created',
                                                            descending: true),
                                              );
                                              _shouldSetState = true;
                                              // UI - Messages
                                              _model.messages = _model
                                                  .ongoingChatUserMessage!
                                                  .toList()
                                                  .cast<MessagesRecord>();
                                              safeSetState(() {});
                                              // API
                                              _model.ongoingChatResponse =
                                                  await OpenAIAPIGroup
                                                      .createChatCompletionCall
                                                      .call(
                                                messagesJson: functions
                                                    .listMessagesToListJSON(
                                                        _model.messages
                                                            .toList()),
                                              );

                                              _shouldSetState = true;
                                              if ((_model.ongoingChatResponse
                                                      ?.succeeded ??
                                                  true)) {
                                                // DB - Message (Assistant)

                                                var messagesRecordReference2 =
                                                    MessagesRecord.createDoc(
                                                        _model.chatRef!);
                                                await messagesRecordReference2
                                                    .set(
                                                        createMessagesRecordData(
                                                  content: OpenAIAPIGroup
                                                      .createChatCompletionCall
                                                      .gptResponseContent(
                                                    (_model.ongoingChatResponse
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                                  role: Role.assistant,
                                                  created: getCurrentTimestamp,
                                                ));
                                                _model.ongoingChatAssistantDoc =
                                                    MessagesRecord.getDocumentFromData(
                                                        createMessagesRecordData(
                                                          content: OpenAIAPIGroup
                                                              .createChatCompletionCall
                                                              .gptResponseContent(
                                                            (_model.ongoingChatResponse
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ),
                                                          role: Role.assistant,
                                                          created:
                                                              getCurrentTimestamp,
                                                        ),
                                                        messagesRecordReference2);
                                                _shouldSetState = true;
                                                // DB - Collection (Messages)
                                                _model.finalOngoingChatAllMessages =
                                                    await queryMessagesRecordOnce(
                                                  parent: _model.chatRef,
                                                  queryBuilder:
                                                      (messagesRecord) =>
                                                          messagesRecord
                                                              .orderBy(
                                                                  'created',
                                                                  descending:
                                                                      true),
                                                );
                                                _shouldSetState = true;
                                                // UI - Messages
                                                _model.messages = _model
                                                    .finalOngoingChatAllMessages!
                                                    .toList()
                                                    .cast<MessagesRecord>();
                                                safeSetState(() {});
                                              }
                                            } else {
                                              // DB - ChatDoc

                                              var chatsRecordReference =
                                                  ChatsRecord.collection.doc();
                                              await chatsRecordReference
                                                  .set(createChatsRecordData(
                                                uid: currentUserReference,
                                                timestamp: getCurrentTimestamp,
                                                title: random_data.randomString(
                                                  8,
                                                  8,
                                                  true,
                                                  true,
                                                  false,
                                                ),
                                                character:
                                                    _model.selectedCharacterRef,
                                              ));
                                              _model.newChatDoc = ChatsRecord
                                                  .getDocumentFromData(
                                                      createChatsRecordData(
                                                        uid:
                                                            currentUserReference,
                                                        timestamp:
                                                            getCurrentTimestamp,
                                                        title: random_data
                                                            .randomString(
                                                          8,
                                                          8,
                                                          true,
                                                          true,
                                                          false,
                                                        ),
                                                        character: _model
                                                            .selectedCharacterRef,
                                                      ),
                                                      chatsRecordReference);
                                              _shouldSetState = true;
                                              // State - ChatDoc
                                              _model.chatRef =
                                                  _model.newChatDoc?.reference;
                                              // DB - Message(User)

                                              var messagesRecordReference3 =
                                                  MessagesRecord.createDoc(
                                                      _model.chatRef!);
                                              await messagesRecordReference3
                                                  .set(createMessagesRecordData(
                                                content: _model
                                                    .inputTextController.text,
                                                role: Role.user,
                                                created: getCurrentTimestamp,
                                              ));
                                              _model.newChatNewMessage =
                                                  MessagesRecord.getDocumentFromData(
                                                      createMessagesRecordData(
                                                        content: _model
                                                            .inputTextController
                                                            .text,
                                                        role: Role.user,
                                                        created:
                                                            getCurrentTimestamp,
                                                      ),
                                                      messagesRecordReference3);
                                              _shouldSetState = true;
                                              safeSetState(() {
                                                _model.inputTextController
                                                    ?.clear();
                                              });
                                              // UI - Messages
                                              _model.addToMessages(
                                                  _model.newChatNewMessage!);
                                              safeSetState(() {});
                                              // API
                                              _model.newChatResponse =
                                                  await OpenAIAPIGroup
                                                      .createChatCompletionCall
                                                      .call(
                                                messagesJson: functions
                                                    .listMessagesToListJSON(
                                                        _model.messages
                                                            .toList()),
                                              );

                                              _shouldSetState = true;
                                              if ((_model.newChatResponse
                                                      ?.succeeded ??
                                                  true)) {
                                                // DB - Message (Assistant)

                                                var messagesRecordReference4 =
                                                    MessagesRecord.createDoc(
                                                        _model.chatRef!);
                                                await messagesRecordReference4
                                                    .set(
                                                        createMessagesRecordData(
                                                  content: OpenAIAPIGroup
                                                      .createChatCompletionCall
                                                      .gptResponseContent(
                                                    (_model.newChatResponse
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                                  role: Role.assistant,
                                                  created: getCurrentTimestamp,
                                                ));
                                                _model.newChatAssistantDoc =
                                                    MessagesRecord.getDocumentFromData(
                                                        createMessagesRecordData(
                                                          content: OpenAIAPIGroup
                                                              .createChatCompletionCall
                                                              .gptResponseContent(
                                                            (_model.newChatResponse
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ),
                                                          role: Role.assistant,
                                                          created:
                                                              getCurrentTimestamp,
                                                        ),
                                                        messagesRecordReference4);
                                                _shouldSetState = true;
                                                // DB - Collection (Messages)
                                                _model.finalNewChatAllMessages =
                                                    await queryMessagesRecordOnce(
                                                  parent: _model.chatRef,
                                                  queryBuilder:
                                                      (messagesRecord) =>
                                                          messagesRecord
                                                              .orderBy(
                                                                  'created',
                                                                  descending:
                                                                      true),
                                                );
                                                _shouldSetState = true;
                                                // UI - Messages
                                                _model.messages = _model
                                                    .finalNewChatAllMessages!
                                                    .toList()
                                                    .cast<MessagesRecord>();
                                                safeSetState(() {});
                                              }
                                            }

                                            if (_shouldSetState)
                                              safeSetState(() {});
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
