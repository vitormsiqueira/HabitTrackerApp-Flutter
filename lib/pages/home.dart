import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhabittracker/theme/app_theme.dart';
import 'package:myhabittracker/theme/colors.dart';
import 'package:myhabittracker/widgets/app_bar.dart';
import 'package:myhabittracker/widgets/bottom_nav_bar.dart';
import 'package:myhabittracker/widgets/timeline_date.dart';

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
      bottomNavigationBar: MyBottomNavigationBar(),
      body: MyBodyInicio(),
    );
  }
}

class MyBodyInicio extends StatefulWidget {
  const MyBodyInicio({Key? key}) : super(key: key);

  @override
  State<MyBodyInicio> createState() => _MyBodyInicioState();
}

class _MyBodyInicioState extends State<MyBodyInicio>
    with TickerProviderStateMixin {
  late TabController _tabController;

  // @override
  // void initState() {
  //   _tabController = new TabController(length: 2, vsync: this);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    DateTime _selectedValue = DateTime.now();

    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: TimeLineDate(DateTime.now()),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    constraints:
                        const BoxConstraints.expand(height: 24, width: 320),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: AppColors.grayWhite,
                    ),
                    child: TabBar(
                      indicator: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(50), // Creates border
                        color: AppColors.cyan,
                      ), //Change background color from here
                      labelColor: AppColors.white,
                      unselectedLabelColor: AppColors.grayDark,
                      unselectedLabelStyle: GoogleFonts.montserrat(
                        fontSize: 11,
                        color: AppColors.grayDark,
                        fontWeight: FontWeight.w300,
                      ),
                      labelStyle: GoogleFonts.montserrat(
                        fontSize: 11,
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                      ),
                      tabs: const [
                        Tab(text: "hoje"),
                        Tab(text: "esta semana"),
                        Tab(text: "este mês"),
                      ],
                    ),
                  ),
                  const Expanded(
                    child: TabBarView(
                      children: [
                        TodayTabBar(),
                        TodayTabBar(),
                        TodayTabBar(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TodayTabBar extends StatelessWidget {
  const TodayTabBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
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
                    '6',
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
        const Divider(
          color: AppColors.gray,
          thickness: 0.5,
          height: 0.5,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 15, left: 20.0, right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Você está quase lá, continue!',
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  color: AppColors.grayDarker,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                '67%',
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  color: AppColors.gray,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, bottom: 15.0, top: 10.0),
          child: const ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: LinearProgressIndicator(
              backgroundColor: AppColors.gray,
              valueColor: AlwaysStoppedAnimation<Color>(
                AppColors.cyan,
              ),
              value: 0.67,
            ),
          ),
          height: 31.0,
        ),
        const Divider(
          color: AppColors.gray,
          thickness: 0.5,
          height: 0.5,
        ),
      ],
    );
  }
}
