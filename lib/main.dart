// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhabittracker/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.bodyText1;

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const MyHomePage(title: 'My Habit Tracker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
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
                      color: AppTheme.colors.grayDark,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '\nVitor Siqueira',
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          color: AppTheme.colors.grayDarker,
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
                customBorder: CircleBorder(),
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
            color: AppTheme.colors.graySilver,
            height: 0.5,
          ),
          preferredSize: Size.fromHeight(2.0),
        ),
        backgroundColor: AppTheme.colors.grayWhite,
      ),
      // Centraliza horizontalmente o Floating Button
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: MyBottomNavigationBar(),
      body: BodyInicio(),
    );
  }
}

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60, // altura do botão mais os paddings
      decoration: BoxDecoration(
        color: AppTheme.colors.grayWhite,
        border: Border(
          top: BorderSide(
            color: AppTheme.colors.graySilver,
            width: 0.5,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Material(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                customBorder: CircleBorder(),
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 50,
                  padding: EdgeInsets.all(14.0),
                  child: SvgPicture.asset(
                    'lib/assets/images/home_fill.svg',
                    color: AppTheme.colors.graySilver,
                    height: 20,
                  ),
                ),
              ),
              InkWell(
                customBorder: CircleBorder(),
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 50,
                  padding: EdgeInsets.all(14.0),
                  child: SvgPicture.asset(
                    'lib/assets/images/calendar2.svg',
                    color: AppTheme.colors.graySilver,
                  ),
                ),
              ),
              Padding(
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
                          color: AppTheme.colors.cyanDarker,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  AppTheme.colors.cyanDarker.withOpacity(0.35),
                              spreadRadius: 2,
                              blurRadius: 15,
                              offset: Offset(0, 0),
                            )
                          ]),
                      child: Center(
                        child: Text(
                          "+",
                          style: TextStyle(
                            fontSize: 24,
                            color: AppTheme.colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                customBorder: CircleBorder(),
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 50,
                  padding: EdgeInsets.all(14.0),
                  child: SvgPicture.asset(
                    'lib/assets/images/tag2.svg',
                    color: AppTheme.colors.graySilver,
                    height: 20,
                  ),
                ),
              ),
              InkWell(
                customBorder: CircleBorder(),
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 50,
                  padding: EdgeInsets.all(14.0),
                  child: SvgPicture.asset(
                    'lib/assets/images/bell2.svg',
                    color: AppTheme.colors.graySilver,
                    height: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      elevation: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Minha conta"),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket), label: "Meus pedidos"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favoritos"),
      ],
    );
  }
}

class BodyInicio extends StatelessWidget {
  const BodyInicio({
    Key? key,
  }) : super(key: key);

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
