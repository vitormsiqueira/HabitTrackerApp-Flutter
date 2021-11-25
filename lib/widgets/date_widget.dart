import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myhabittracker/theme/app_theme.dart';
import 'package:myhabittracker/theme/colors.dart';

/// Used by [DateWidget] for tap detection.
typedef DateSelectionCallback = void Function(DateTime selectedDate);

/// Used by [TimelineDate] for tap detection.
typedef DateChangeListener = void Function(DateTime selectedDate);

class DateWidget extends StatefulWidget {
  final double? width;
  final DateTime date;
  final TextStyle? dayTextStyle, weekTextStyle;
  final String emojiPath;
  final Color selectionColor;
  final Color borderSelectionColor;
  final DateSelectionCallback? onDateSelected;

  DateWidget({
    required this.date,
    this.width,
    required this.dayTextStyle,
    required this.weekTextStyle,
    required this.emojiPath,
    required this.selectionColor,
    this.borderSelectionColor = AppColors.gray,
    this.onDateSelected,
  });

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  Color _colorContainer = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: widget.width,
        margin: const EdgeInsets.all(7.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          color: _colorContainer,
          border: Border.all(
            color: widget.borderSelectionColor,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                widget.date.day.toString(), // Date
                style: widget.dayTextStyle,
              ),
              Text(
                DateFormat('E').format(widget.date).toUpperCase(), // WeekDay
                style: widget.weekTextStyle,
              ),
              Image.asset(
                widget.emojiPath,
                width: 22,
              )
            ],
          ),
        ),
      ),
      onTap: () {
        setState(() {
          _colorContainer = _colorContainer == AppColors.cyanDark
              ? AppColors.white
              : AppColors.cyanDark;
        });
      },
    );
  }
}
