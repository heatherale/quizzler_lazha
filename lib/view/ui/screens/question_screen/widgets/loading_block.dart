import 'package:flutter/material.dart';
import 'package:quizzler/view/shared/theme_custom.dart';

class LoadingBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircularProgressIndicator(backgroundColor: themeCustom.primaryColor,),
          SizedBox(height: 10.0,),
          Text(
            'Loading course, please wait',
            textAlign: TextAlign.center,
            style: CustomTextStyles.loadingBlockStyle,
          ),
        ],
      ),
    );
  }
}
