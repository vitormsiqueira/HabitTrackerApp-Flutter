import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myhabittracker/theme/app_theme.dart';

class MyBottomNavIcon extends StatelessWidget {
  final String iconPath;
  const MyBottomNavIcon({Key? key, required this.iconPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: () {},
      child: Container(
        height: 50,
        width: 50,
        padding: const EdgeInsets.all(14.0),
        child: SvgPicture.asset(
          iconPath,
          color: AppTheme.colors.graySilver,
          height: 20,
        ),
      ),
    );
  }
}
