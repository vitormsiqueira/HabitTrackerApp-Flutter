import 'package:flutter/material.dart';
import 'package:myhabittracker/theme/colors.dart';

class MyLinearProgressIndicator extends StatelessWidget {
  final double indicator_value;
  const MyLinearProgressIndicator({Key? key, required this.indicator_value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          left: 20.0, right: 20.0, bottom: 15.0, top: 10.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        child: LinearProgressIndicator(
          backgroundColor: AppColors.gray,
          valueColor: const AlwaysStoppedAnimation<Color>(
            AppColors.cyan,
          ),
          value: indicator_value,
        ),
      ),
      height: 31.0,
    );
  }
}
