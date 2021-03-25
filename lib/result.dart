import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultText {
    String resultPhrase;

    resultScore >= 20
        ? resultPhrase = "You are awesome"
        : resultPhrase = "You are bad";
    return resultPhrase;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultText,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          TextButton(onPressed: resetHandler, child: Text("Restart Quiz"))
        ],
      ),
    );
  }
}
