import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhabittracker/theme/colors.dart';

class IndicatorTextValue extends StatelessWidget {
  final double indicator_value;
  const IndicatorTextValue({Key? key, required this.indicator_value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 15, left: 20.0, right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Você está quase lá, continue!',
            style: GoogleFonts.montserrat(
              fontSize: 12,
              color: AppColors.grayDarker,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            (indicator_value * 100).toInt().toString() + '%',
            style: GoogleFonts.montserrat(
              fontSize: 12,
              color: AppColors.gray,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
