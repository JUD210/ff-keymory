import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  int _whichModel = 0;
  int get whichModel => _whichModel;
  set whichModel(int value) {
    _whichModel = value;
  }

  List<HintPromptStruct> _hintPromptList = [
    HintPromptStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Grab a Coffee\",\"desc\":\"How about a quiet coffee date and some good conversation?\"}')),
    HintPromptStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Go for a Walk\",\"desc\":\"The weather\'s so nice. How about a walk in the park?\"}')),
    HintPromptStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Have Dinner Together\",\"desc\":\"There\'s a great restaurant I found. Want to check it out?\"}')),
    HintPromptStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Watch a Movie Together\",\"desc\":\"I found an interesting movie. Want to watch it together?\"}'))
  ];
  List<HintPromptStruct> get hintPromptList => _hintPromptList;
  set hintPromptList(List<HintPromptStruct> value) {
    _hintPromptList = value;
  }

  void addToHintPromptList(HintPromptStruct value) {
    hintPromptList.add(value);
  }

  void removeFromHintPromptList(HintPromptStruct value) {
    hintPromptList.remove(value);
  }

  void removeAtIndexFromHintPromptList(int index) {
    hintPromptList.removeAt(index);
  }

  void updateHintPromptListAtIndex(
    int index,
    HintPromptStruct Function(HintPromptStruct) updateFn,
  ) {
    hintPromptList[index] = updateFn(_hintPromptList[index]);
  }

  void insertAtIndexInHintPromptList(int index, HintPromptStruct value) {
    hintPromptList.insert(index, value);
  }

  String _editorText = '';
  String get editorText => _editorText;
  set editorText(String value) {
    _editorText = value;
  }

  List<String> _tmpPrintMsgList = [];
  List<String> get tmpPrintMsgList => _tmpPrintMsgList;
  set tmpPrintMsgList(List<String> value) {
    _tmpPrintMsgList = value;
  }

  void addToTmpPrintMsgList(String value) {
    tmpPrintMsgList.add(value);
  }

  void removeFromTmpPrintMsgList(String value) {
    tmpPrintMsgList.remove(value);
  }

  void removeAtIndexFromTmpPrintMsgList(int index) {
    tmpPrintMsgList.removeAt(index);
  }

  void updateTmpPrintMsgListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    tmpPrintMsgList[index] = updateFn(_tmpPrintMsgList[index]);
  }

  void insertAtIndexInTmpPrintMsgList(int index, String value) {
    tmpPrintMsgList.insert(index, value);
  }
}
