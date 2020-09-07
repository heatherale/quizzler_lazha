import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzler/provider/QuestionProvider.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(Provider.of<QuestionProvider>(context, listen: false).testResult.toString()),
    );
  }
}
