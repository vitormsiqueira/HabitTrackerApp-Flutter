import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhabittracker/theme/colors.dart';

class HabitListHeader extends StatelessWidget {
  final int habit_count;
  const HabitListHeader({Key? key, required this.habit_count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text(
                    'Meus Hábitos',
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      color: AppColors.grayDarker,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    habit_count.toString(),
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      color: AppColors.gray,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: TextButton(
                child: Text(
                  'Ver todos',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    color: AppColors.cyanDarker,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
