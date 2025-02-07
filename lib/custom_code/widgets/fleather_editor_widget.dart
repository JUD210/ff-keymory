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
// [주석 1] Fleather & ParchmentDelta 관련 import
//         - fleather 1.19.0 사용 시, color/theme API가 제한적이므로
//           Theme, Container, DefaultTextStyle 등으로 색상/스타일을 커스텀할 수 있음.
//////////////////////////////////////////////////////////////////////////////////
import 'package:fleather/fleather.dart';
import 'package:parchment_delta/parchment_delta.dart';
import 'dart:convert';

//////////////////////////////////////////////////////////////////////////////////
// [주석 2] 배경색/글자색/체크박스 색상 등 상수 정의
//         - 원하는 컬러코드(#343541, #d2d6db 등)를 16진수로 변환해 사용
//////////////////////////////////////////////////////////////////////////////////
const kBackgroundColor = Color(0xFF343541); // #343541
const kTextColor = Color(0xFFD2D6DB); // #d2d6db
const kCheckBoxFill = kTextColor; // 체크박스 내부(배경)
const kCheckBoxCheck = kBackgroundColor; // 체크표시(✔)

//////////////////////////////////////////////////////////////////////////////////
// [주석 3] FleatherEditorWidget
//         - FlutterFlow에서 사용하는 Custom Widget
//         - width, height, initialText 파라미터를 받아, Delta JSON을 다룰 수 있는
//           리치 텍스트 에디터를 구성한다.
//////////////////////////////////////////////////////////////////////////////////
class FleatherEditorWidget extends StatefulWidget {
  const FleatherEditorWidget({
    Key? key,
    required this.width,
    required this.height,
    this.initialText = "", // Delta JSON 문자열 or Plain text
  }) : super(key: key);

  // [주석 3-1] 위젯 크기 (플러터플로우 UI에서 지정)
  final double width;
  final double height;

  // [주석 3-2] 에디터가 처음에 보여줄 문서 데이터 (보통 Delta JSON)
  //            만약 plain text가 들어오면 아래 initState()에서 예외 처리
  final String initialText;

  @override
  State<FleatherEditorWidget> createState() => _FleatherEditorWidgetState();
}

//////////////////////////////////////////////////////////////////////////////////
// [주석 4] _FleatherEditorWidgetState
//         - FleatherController와 FocusNode 관리
//         - 문서 변경 시, Delta JSON을 AppState(editorText)에 저장해
//           Firestore에 저장 가능하도록 만든다.
//////////////////////////////////////////////////////////////////////////////////
class _FleatherEditorWidgetState extends State<FleatherEditorWidget> {
  // FleatherController: 에디터 문서/스타일 제어
  FleatherController? _controller;
  // FocusNode: 에디터 포커스 관리
  late FocusNode _focusNode;

  // [주석 4-1] initState(): 위젯 최초 생성 시
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    // [1] Delta JSON인지 Plain text인지 구분
    //    1) jsonDecode 시도 -> 성공하면 Delta JSON
    //    2) 실패하면 그냥 plain text
    ParchmentDocument doc;
    try {
      final decoded = jsonDecode(widget.initialText);
      doc = ParchmentDocument.fromJson(decoded);
    } catch (e) {
      // 파싱 실패 시 => plain text
      // Fleather 문서는 반드시 '\n'으로 끝나야 하므로 추가
      FFAppState()
          .tmpPrintMsgList
          .add('JSON Decode Error: $e'); // ← 여기서 콘솔에 에러 표시
      final text = _ensureEndsWithNewline(widget.initialText);
      doc = ParchmentDocument.fromDelta(Delta()..insert(text));
    }

    // [2] FleatherController에 문서 세팅
    _controller = FleatherController(document: doc);

    // [3] 문서가 바뀔 때마다 -> Delta JSON 형태로 AppState에 저장
    _controller!.document.changes.listen((_) {
      // 현재 문서를 Delta로 변환
      final delta = _controller!.document.toDelta();
      // Delta -> JSON string
      final jsonString = jsonEncode(delta);

      // FlutterFlow AppState (editorText) 에 저장
      FFAppState().editorText = jsonString;
    });
  }

  // [주석 4-2] _ensureEndsWithNewline
  //           Fleather(Parchment) 문서는 "\n"으로 끝나야 정상 동작
  String _ensureEndsWithNewline(String str) {
    if (str.isEmpty) {
      return "\n";
    }
    if (!str.endsWith('\n')) {
      return '$str\n';
    }
    return str;
  }

  // [주석 4-3] dispose(): FocusNode, Controller 정리
  @override
  void dispose() {
    _focusNode.dispose();
    _controller?.dispose();
    super.dispose();
  }

  // [주석 5] build(context): 실제 UI
  @override
  Widget build(BuildContext context) {
    if (_controller == null) {
      return const Center(child: CircularProgressIndicator());
    }

    // [주석 5-1] 체크박스, 텍스트, 배경색을 강제 지정하기 위해 Theme 위젯으로 감싼다.
    return Theme(
      data: Theme.of(context).copyWith(
        // [A] 체크박스 배경 / 체크 색상
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all(kCheckBoxFill),
          checkColor: MaterialStateProperty.all(kCheckBoxCheck),
        ),
      ),
      child: Container(
        // [B] 에디터 전체 배경
        width: widget.width,
        height: widget.height,
        color: kBackgroundColor,
        child: Column(
          children: [
            //////////////////////////////////////////////////////////////////////////
            // [주석 5-2] FleatherToolbar (툴바)
            //   - fleather 1.19.0엔 color 파라미터가 없으므로
            //     Container로 감싸서 배경색 지정
            //////////////////////////////////////////////////////////////////////////
            Container(
              color: kBackgroundColor,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: FleatherToolbar.basic(
                controller: _controller!,
              ),
            ),
            //////////////////////////////////////////////////////////////////////////
            // [주석 5-3] FleatherEditor (본문)
            //   - DefaultTextStyle.merge로 텍스트 색을 kTextColor(#d2d6db) 지정
            //////////////////////////////////////////////////////////////////////////
            Expanded(
              child: DefaultTextStyle.merge(
                style: const TextStyle(color: kTextColor),
                child: FleatherEditor(
                  controller: _controller!,
                  focusNode: _focusNode,
                  padding: const EdgeInsets.all(16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
