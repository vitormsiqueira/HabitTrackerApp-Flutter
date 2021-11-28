import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
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

class _MyBodyInicioState extends State<MyBodyInicio> {
  @override
  Widget build(BuildContext context) {
    DateTime _selectedValue = DateTime.now();

    @override
    void initState() {
      super.initState();
    }

    return Container(
      color: AppColors.white,
      padding: EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: TimeLineDate(DateTime.now()),
          ),
        ],
      ),
    );
  }
}
