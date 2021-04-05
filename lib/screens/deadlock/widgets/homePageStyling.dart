import 'package:project_os/screens/deadlock/widgets/customAppBar.dart';
import 'package:project_os/screens/deadlock/widgets/customInfoCard.dart';

import 'package:flutter/material.dart';

class HomePageStyling extends StatefulWidget {
  HomePageStyling({Key key}) : super(key: key);

  @override
  _HomePageStylingState createState() => _HomePageStylingState();
}

class _HomePageStylingState extends State<HomePageStyling> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        CustomAppBar(), // importing from customAppBar file
        SizedBox(
          height: 20.0,
        ),
        CustomInfoCard(),
      ]),
    );
  }
}
