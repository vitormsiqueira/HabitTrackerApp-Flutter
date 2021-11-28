import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:myhabittracker/theme/colors.dart';
import 'package:myhabittracker/widgets/date_widget.dart';

class TimeLineDate extends StatefulWidget {
  final DateTime startDate;
  final double height;
  final double width;
  final Color selectionColor;

  TimeLineDate(
    this.startDate, {
    Key? key,
    this.height = 105,
    this.width = 50,
    this.selectionColor = AppColors.cyanDark,
  });

  @override
  _TimeLineDateState createState() => _TimeLineDateState();
}

class _TimeLineDateState extends State<TimeLineDate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: ListView.builder(
        reverse: true,
        itemCount: 20,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          DateTime date;
          DateTime _date = widget.startDate.add(Duration(days: index));
          date = DateTime(_date.year, _date.month, _date.day);

          return DateWidget(
            width: widget.width,
            date: DateTime.now(),
            dayTextStyle: GoogleFonts.montserrat(
              fontSize: 18,
              color: AppColors.grayDark,
              fontWeight: FontWeight.w800,
            ),
            daySelectedTextStyle: GoogleFonts.montserrat(
              fontSize: 18,
              color: AppColors.white,
              fontWeight: FontWeight.w800,
            ),
            weekTextStyle: GoogleFonts.montserrat(
              fontSize: 10,
              color: AppColors.graySilver,
              fontWeight: FontWeight.w500,
            ),
            weekSelectedTextStyle: GoogleFonts.montserrat(
              fontSize: 10,
              color: AppColors.white,
              fontWeight: FontWeight.w500,
            ),
            //emojiPath: 'lib/assets/images/great.png',
            selectionColor: AppColors.cyan,
            borderSelectedColor: AppColors.cyanDarker,
          );
        },
      ),
    );
  }
}
