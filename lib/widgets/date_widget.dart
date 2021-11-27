import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  // bool emojiSelected = false;

  // Gera a lista que vai controlar as seleções
  List<bool> isSelected = [];

  List<String> moodName = [];

  int selectedMood = 5;

  @override
  void initState() {
    // this is for 3 buttons, add "false" same as the number of buttons here
    isSelected = [false, false, false, false, false];

    moodName = ['Exausto', 'Triste', 'Ok', 'Feliz', 'Ótimo', ''];

    super.initState();
  }

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
              title: Text(
                "Como está se sentindo hoje?",
                style: GoogleFonts.montserrat(
                  color: AppColors.grayDarker,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              content: Container(
                alignment: Alignment.center,
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      moodName[selectedMood],
                      style: const TextStyle(
                        color: AppColors.cyanDark,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ToggleButtons(
                      children: [
                        EmojiMood(
                          emojiPath: 'lib/assets/images/exausto.png',
                          isSelected: isSelected[0],
                        ),
                        EmojiMood(
                          emojiPath: 'lib/assets/images/chateado.png',
                          isSelected: isSelected[1],
                        ),
                        EmojiMood(
                          emojiPath: 'lib/assets/images/ok.png',
                          isSelected: isSelected[2],
                        ),
                        EmojiMood(
                          emojiPath: 'lib/assets/images/bem.png',
                          isSelected: isSelected[3],
                        ),
                        EmojiMood(
                          emojiPath: 'lib/assets/images/great.png',
                          isSelected: isSelected[4],
                        ),
                      ],
                      onPressed: (int index) {
                        setState(() {
                          for (int i = 0; i < isSelected.length; i++) {
                            isSelected[i] = i == index;
                            selectedMood = index;
                          }
                        });
                      },
                      isSelected: isSelected,
                      renderBorder: false,
                      fillColor: Colors.transparent,
                      splashColor: Colors.transparent,
                    ),
                  ],
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    cancelButton,
                    confirmButton,
                  ],
                )
              ],
            );
          },
        ),
      );
}

// set up the button
Widget confirmButton = TextButton(
  child: Text(
    "Confirmar",
    style: GoogleFonts.montserrat(
      color: AppColors.cyanDark,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  ),
  onPressed: () {},
);

// set up the button
Widget cancelButton = TextButton(
  child: Text(
    "Cancelar",
    style: GoogleFonts.montserrat(
      color: AppColors.graySilver,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  ),
  onPressed: () {},
);

class EmojiMood extends StatefulWidget {
  const EmojiMood({
    Key? key,
    required this.emojiPath,
    required this.isSelected,
  }) : super(key: key);

  final String emojiPath;
  final bool isSelected;

  @override
  State<EmojiMood> createState() => _EmojiMoodState();
}

class _EmojiMoodState extends State<EmojiMood> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.isSelected ? AppColors.cyanDark : Colors.transparent,
          width: 2.5,
        ),
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        widget.emojiPath,
        width: 25,
      ),
    );
  }
}
