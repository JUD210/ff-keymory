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

import 'package:flutter_markdown/flutter_markdown.dart';

class MarkdownWidget extends StatefulWidget {
  const MarkdownWidget({
    Key? key,
    this.width,
    this.height,
    required this.data,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String data;

  @override
  _MarkdownWidgetState createState() => _MarkdownWidgetState();
}

class _MarkdownWidgetState extends State<MarkdownWidget> {
  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      data: widget.data,
      styleSheet: MarkdownStyleSheet(
        p: FlutterFlowTheme.of(context).bodyMedium,
        listBullet: FlutterFlowTheme.of(context).bodyLarge,
        code: FlutterFlowTheme.of(context).bodyMedium.copyWith(
              backgroundColor: Colors.transparent,
              fontFamily: 'NanumBarunGothic',
              fontSize: 14,
            ),
        codeblockPadding: EdgeInsets.all(20),
        codeblockDecoration: BoxDecoration(color: Colors.black38),
      ),
    );
  }
}
