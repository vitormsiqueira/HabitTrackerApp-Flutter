import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhabittracker/theme/app_theme.dart';
import 'package:myhabittracker/widgets/app_bar.dart';
import 'package:myhabittracker/widgets/bottom_nav_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: MyAppBar(),
      ),
      // Centraliza horizontalmente o Floating Button
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: MyBottomNavigationBar(),
      body: MyBodyInicio(),
    );
  }
}

class MyBodyInicio extends StatelessWidget {
  const MyBodyInicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: AppTheme.colors.white,
        height: MediaQuery.of(context).size.height,
        child: Container(),
      ),
    );
  }
}
