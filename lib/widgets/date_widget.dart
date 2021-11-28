import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:myhabittracker/theme/app_theme.dart';
import 'package:myhabittracker/theme/colors.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:myhabittracker/utils/emoji_moods.dart';
import 'package:provider/provider.dart';

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

  List<String> emojiMood = [
    'lib/assets/images/exausto.png',
    'lib/assets/images/chateado.png',
    'lib/assets/images/ok.png',
    'lib/assets/images/bem.png',
    'lib/assets/images/great.png'
  ];

  int selectedMood = 5;

  String inputText = "";

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
                  ? GestureDetector(
                      child: Image.asset(
                        widget.emojiPath.toString(),
                        width: 25,
                      ),
                      onTap: () => openMood(),
                    )
                  : SizedBox(
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
                        shape: const CircleBorder(),
                        elevation: 0.0,
                        padding: const EdgeInsets.all(0),
                        fillColor:
                            selected ? AppColors.cyanDarker : AppColors.white,
                        // onPressed: () => _showSingleChoiceDialog(context),
                        onPressed: () => openMood(),
                      ),
                    ),
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
                height: 70,
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
                            // print('INDEX ---------------> ' + index.toString());
                            isSelected[i] = i == index;
                            // print('isSelected[i] ---> ' +     isSelected[i].toString());
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
                    cancelButton(context),
                    confirmButton(context, selectedMood),
                  ],
                )
              ],
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              )),
            );
          },
        ),
      ).then((valueFromDialog) {
        // use the value as you wish
        setState(() {
          if (valueFromDialog != null) {
            widget.emojiPath = emojiMood[valueFromDialog];
          }
        });
      });
}

// set up the button
Widget confirmButton(BuildContext context, int _selectedMood) {
  return Padding(
    padding: const EdgeInsets.only(right: 12.0),
    child: TextButton(
      child: Text(
        "Confirmar",
        style: GoogleFonts.montserrat(
          color: AppColors.cyanDark,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onPressed: () {
        Navigator.pop(context, _selectedMood);
      },
    ),
  );
}

// set up the button
Widget cancelButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 12.0),
    child: TextButton(
      child: Text(
        "Cancelar",
        style: GoogleFonts.montserrat(
          color: AppColors.graySilver,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
  );
}

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
