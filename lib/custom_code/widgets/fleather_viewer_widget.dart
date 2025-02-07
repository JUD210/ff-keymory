// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

//////////////////////////////////////////////////////////////////////////////////
// [주석 1] Fleather & Parchment import
//         - fleather 1.19.0에서는 readOnly 파라미터 미지원이므로
//           IgnorePointer를 사용하여 이벤트를 차단한다.
//////////////////////////////////////////////////////////////////////////////////
import 'package:fleather/fleather.dart';
import 'package:parchment_delta/parchment_delta.dart';
import 'dart:convert';

//////////////////////////////////////////////////////////////////////////////////
// [주석 2] "Viewer" 형태의 Fleather 위젯
//         - Delta JSON을 복원해 스타일 유지. 편집은 불가(툴바 X, 이벤트 차단).
//////////////////////////////////////////////////////////////////////////////////
class FleatherViewerWidget extends StatefulWidget {
  const FleatherViewerWidget({
    Key? key,
    this.width = double.infinity, // 가로 크기(기본: 화면 가득)
    this.height = 150, // 세로 크기(기본: 5줄 정도)
    required this.initialDeltaJson, // Delta JSON 문자열
  }) : super(key: key);

  final double width;
  final double height;
  final String initialDeltaJson;

  @override
  State<FleatherViewerWidget> createState() => _FleatherViewerWidgetState();
}

//////////////////////////////////////////////////////////////////////////////////
// [주석 3] _FleatherViewerWidgetState
//         - Delta JSON을 FleatherController로 로드
//         - IgnorePointer로 입력 이벤트를 차단하여 "보기 전용" 상태로 설정.
//////////////////////////////////////////////////////////////////////////////////
class _FleatherViewerWidgetState extends State<FleatherViewerWidget> {
  FleatherController? _controller;

  @override
  void initState() {
    super.initState();

    // [주석 3-1] Delta JSON 복원
    ParchmentDocument doc;
    try {
      final decoded = jsonDecode(widget.initialDeltaJson); // JSON 파싱
      doc = ParchmentDocument.fromJson(decoded); // Delta 생성
    } catch (e) {
      // JSON 복원 실패 시, plain text로 처리
      FFAppState().tmpPrintMsgList.add('JSON Decode Error: $e');
      final text = _ensureEndsWithNewline(widget.initialDeltaJson);
      doc = ParchmentDocument.fromDelta(Delta()..insert(text));
    }

    _controller = FleatherController(document: doc);
  }

  /// didUpdateWidget:
  ///  - 동일 위젯 트리에서 단순히 파라미터만 바뀐 경우, Flutter가 기존 State를 재사용.
  ///  - 이때 새 widget 속성과 기존 widget 속성을 비교하여 필요한 로직을 수행할 수 있음.
  @override
  void didUpdateWidget(covariant FleatherViewerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    // 1) 이전 JSON과 새로운 JSON이 다르면
    if (oldWidget.initialDeltaJson != widget.initialDeltaJson) {
      // 2) FleatherController를 새로 생성
      _controller?.dispose();
      _controller = _createControllerFromDeltaJson(widget.initialDeltaJson);
      // 3) UI 갱신
      setState(() {});
    }
  }

  /// Delta JSON 문자열을 FleatherController로 만드는 헬퍼 함수
  FleatherController _createControllerFromDeltaJson(String jsonString) {
    ParchmentDocument doc;
    try {
      final decoded = jsonDecode(jsonString);
      doc = ParchmentDocument.fromJson(decoded);
    } catch (e) {
      // 복원 실패 시, 일반 텍스트 처리
      doc = ParchmentDocument.fromDelta(
        Delta()..insert(_ensureEndsWithNewline(jsonString)),
      );
    }
    return FleatherController(document: doc);
  }

  // [주석 3-2] Fleather 문서가 항상 "\n"으로 끝나야 정상 동작
  String _ensureEndsWithNewline(String str) {
    if (str.isEmpty) return "\n";
    if (!str.endsWith('\n')) return '$str\n';
    return str;
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // [주석 3-3] 로딩 상태 처리
    if (_controller == null) {
      return const Center(child: CircularProgressIndicator());
    }

    // [주석 3-4] Delta JSON 기반 "보기 전용" FleatherEditor
    return Container(
      width: widget.width,
      height: widget.height,
      color: Colors.transparent, // 필요하면 다른 배경색 지정
      child: IgnorePointer(
        // 모든 입력 이벤트 차단
        child: FleatherEditor(
          controller: _controller!,
          focusNode: FocusNode(), // 비활성 FocusNode
          padding: const EdgeInsets.all(8), // 내부 여백 설정
        ),
      ),
    );
  }
}
