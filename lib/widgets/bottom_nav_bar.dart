import 'package:flutter/material.dart';
import 'package:myhabittracker/theme/colors.dart';
import 'package:myhabittracker/widgets/bottom_nav_icon.dart';
import 'package:myhabittracker/widgets/floating_button.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65, // altura do botão mais os paddings
      decoration: const BoxDecoration(
        color: AppColors.grayWhite,
        border: Border(
          top: BorderSide(
            color: AppColors.graySilver,
            width: 0.5,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Material(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              MyBottomNavIcon(iconPath: 'lib/assets/images/home_fill.svg'),
              MyBottomNavIcon(iconPath: 'lib/assets/images/calendar2.svg'),
              MyFloatingButton(),
              MyBottomNavIcon(iconPath: 'lib/assets/images/tag2.svg'),
              MyBottomNavIcon(iconPath: 'lib/assets/images/bell2.svg'),
            ],
          ),
        ),
      ),
    );
  }
}
