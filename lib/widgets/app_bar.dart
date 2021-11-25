import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhabittracker/theme/colors.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 75,
      title: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Bom dia,",
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    color: AppColors.grayDark,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '\nVitor Siqueira',
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: AppColors.grayDarker,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Container(
          padding: const EdgeInsets.only(right: 25.0),
          child: Center(
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () {},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: CachedNetworkImage(
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                  imageUrl:
                      "https://avatars.githubusercontent.com/u/42281886?s=96&v=4",
                ),
              ),
            ),
          ),
        )
      ],
      bottom: PreferredSize(
        child: Container(
          color: AppColors.grayDark,
          height: 0.5,
        ),
        preferredSize: const Size.fromHeight(2.0),
      ),
      backgroundColor: AppColors.grayWhite,
    );
  }
}
