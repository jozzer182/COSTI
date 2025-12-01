import 'package:flutter/material.dart';

class SimpleLabel extends StatelessWidget {
  final String title;
  final String content;
  const SimpleLabel({
    required this.title,
    required this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SelectableText.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "$title: ",
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          TextSpan(
            text: content,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}