import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myhabittracker/theme/app_theme.dart';
import 'package:myhabittracker/theme/colors.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// Used by [DateWidget] for tap detection.
typedef DateSelectionCallback = void Function(DateTime selectedDate);

/// Used by [TimelineDate] for tap detection.
typedef DateChangeListener = void Function(DateTime selectedDate);

class DateWidget extends StatefulWidget {
  final double? width;
  final DateTime date;
  final TextStyle? dayTextStyle,
      weekTextStyle,
      daySelectedTextStyle,
      weekSelectedTextStyle;
  String? emojiPath;
  final Color selectionColor;
  final Color borderSelectedColor;
  final DateSelectionCallback? onDateSelected;

  DateWidget({
    required this.date,
    this.width,
    required this.dayTextStyle,
    required this.weekTextStyle,
    this.emojiPath,
    required this.selectionColor,
    this.borderSelectedColor = AppColors.gray,
    required this.daySelectedTextStyle,
    required this.weekSelectedTextStyle,
    this.onDateSelected,
  });

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  bool selected = false;
  bool emojiSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: widget.width,
        margin: const EdgeInsets.all(7.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(14.0)),
          color: selected ? widget.selectionColor : Colors.transparent,
          border: Border.all(
            color: selected ? widget.borderSelectedColor : AppColors.gray,
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
                style: selected
                    ? widget.daySelectedTextStyle
                    : widget.dayTextStyle,
              ),
              Text(
                DateFormat('E', "pt_BR")
                    .format(widget.date)
                    .toUpperCase(), // WeekDay
                style: selected
                    ? widget.weekSelectedTextStyle
                    : widget.weekTextStyle,
              ),
              widget.emojiPath != null
                  ? Image.asset(
                      widget.emojiPath.toString(),
                      width: 25,
                    )
                  : Container(
                      height: 23,
                      width: 23,
                      child: RawMaterialButton(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: selected
                                    ? Colors.transparent
                                    : AppColors.gray),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add,
                            size: 21,
                            color: selected ? AppColors.cyan : AppColors.gray,
                          ),
                        ),
                        shape: CircleBorder(),
                        elevation: 0.0,
                        padding: EdgeInsets.all(0),
                        fillColor:
                            selected ? AppColors.cyanDarker : AppColors.white,
                        onPressed: () {
                          openMood();
                        },
                      ),
                    )
            ],
          ),
        ),
      ),
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
    );
  }

  Future openMood() => showDialog(
        context: context,
        builder: (context) => StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text(
                "Como está se sentindo hoje?",
                style: TextStyle(
                  color: AppColors.grayDarker,
                  fontSize: 22,
                ),
                textAlign: TextAlign.center,
              ),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: EmojiMood(
                      emojiSelected: emojiSelected,
                      emojiPath: 'lib/assets/images/exausto.png',
                    ),
                    onTap: () {
                      setState(() {
                        emojiSelected = !emojiSelected;
                      });
                    },
                  ),
                  GestureDetector(
                    child: EmojiMood(
                      emojiSelected: emojiSelected,
                      emojiPath: 'lib/assets/images/chateado.png',
                    ),
                    onTap: () {
                      setState(() {
                        emojiSelected = !emojiSelected;
                      });
                    },
                  ),
                  GestureDetector(
                    child: EmojiMood(
                      emojiSelected: emojiSelected,
                      emojiPath: 'lib/assets/images/ok.png',
                    ),
                    onTap: () {
                      setState(() {
                        emojiSelected = !emojiSelected;
                      });
                    },
                  ),
                  GestureDetector(
                    child: EmojiMood(
                      emojiSelected: emojiSelected,
                      emojiPath: 'lib/assets/images/bem.png',
                    ),
                    onTap: () {
                      setState(() {
                        emojiSelected = !emojiSelected;
                      });
                    },
                  ),
                  GestureDetector(
                    child: EmojiMood(
                      emojiSelected: emojiSelected,
                      emojiPath: 'lib/assets/images/great.png',
                    ),
                    onTap: () {
                      setState(() {
                        emojiSelected = !emojiSelected;
                      });
                    },
                  ),
                ],
              ),
            );
          },
        ),
      );
}

class EmojiMood extends StatelessWidget {
  const EmojiMood({
    Key? key,
    required this.emojiSelected,
    required this.emojiPath,
  }) : super(key: key);

  final String emojiPath;
  final bool emojiSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(
          color: emojiSelected ? AppColors.cyanDark : Colors.transparent,
          width: 3.0,
        ),
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        emojiPath,
        width: 25,
      ),
    );
  }
}
