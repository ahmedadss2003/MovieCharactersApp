  import 'package:flutter/material.dart';



class BuildTextWithUnderline extends StatelessWidget {
  const BuildTextWithUnderline({
    super.key, required this.text,
  });
  final String text ;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.red, width: 2.0),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}