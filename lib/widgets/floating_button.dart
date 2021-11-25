import 'package:flutter/material.dart';
import 'package:myhabittracker/theme/colors.dart';

class MyFloatingButton extends StatelessWidget {
  const MyFloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 13.0,
        right: 13.0,
      ),
      child: SizedBox(
        height: 40,
        width: 40,
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () {},
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.cyanDarker,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.cyanDarker.withOpacity(0.35),
                    spreadRadius: 2,
                    blurRadius: 15,
                    offset: const Offset(0, 0),
                  )
                ]),
            child: Center(
              child: Text(
                "+",
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
