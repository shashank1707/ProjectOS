import 'package:flutter/material.dart';

import 'package:project_os/screens/deadlock/bankersHomePage.dart';
import 'package:project_os/screens/deadlock/semaphoreHomePage.dart';
import 'package:project_os/screens/deadlock/concurrencyHomePage.dart';
import 'package:project_os/screens/deadlock/deadlockHomePage.dart';
import 'package:project_os/screens/deadlock/lockHomePage.dart';
import 'package:project_os/screens/deadlock/ostrichHomePage.dart';
import 'package:project_os/screens/deadlock/petersonsHomePage.dart';
import 'package:project_os/screens/deadlock/testHomePage.dart';
import 'package:project_os/screens/deadlock/turnHomePage.dart';
import 'package:project_os/screens/deadlock/binaryHomePage.dart';
import 'package:project_os/screens/deadlock/countingHomePage.dart';

import './widgets/homePageStyling.dart';

class DeadlockHome extends StatefulWidget {
  @override
  _DeadlockHomeState createState() => _DeadlockHomeState();
}

class _DeadlockHomeState extends State<DeadlockHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title:
            "Concurrency and Deadlock application", // Setting the title for the app
        home:
            CDHomePage(), // setting the homepage for the app which is in this same file
        routes: {
          '/first': (_) => ConcurrencyHomePage(),
          '/second': (_) => DeadlockHomePage(),
          '/third': (_) => SemaphoreHomePage(),
          '/bankers': (_) => BankersHomePage(),
          '/lock': (_) => LockHomePage(),
          '/ostrich': (_) => OstrichHomePage(),
          '/petersons': (_) => PetersonsHomePage(),
          '/test': (_) => TestHomePage(),
          '/turn' : (_) => TurnHomePage(),
          '/bisem' : (_) => BinaryHomePage(),
          '/cosem' : (_) => CountingHomePage(),
        },
      );
  }
}

class CDHomePage extends StatefulWidget {
  CDHomePage({Key key}) : super(key: key);

  @override
  _CDHomePageState createState() => _CDHomePageState();
}

// The class which holds the state for homepage
class _CDHomePageState extends State<CDHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePageStyling(),
    );
  }
}
