import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
        toolbarHeight: 90,
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
                    style: TextStyle(
                      fontSize: 14,
                      color: AppTheme.colors.grayDark,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '\nVitor Siqueira',
                        style: TextStyle(
                          fontSize: 22,
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
                    width: 45,
                    height: 45,
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
            height: 1,
          ),
          preferredSize: Size.fromHeight(2.0),
        ),
        backgroundColor: AppTheme.colors.grayWhite,
      ),
      body: BodyInicio(),
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
      ),
    );
  }
}
