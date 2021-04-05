import 'package:flutter/material.dart';

class ModalSheetContent extends StatefulWidget {
  ModalSheetContent({Key key}) : super(key: key);

  @override
  _ModalSheetContentState createState() => _ModalSheetContentState();
}

class _ModalSheetContentState extends State<ModalSheetContent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      behavior: HitTestBehavior.opaque,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            //A container starts here
            InkWell(
              onTap: () => Navigator.of(context).pushNamed('/bankers'),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.greenAccent])),
                height: 90,
                width: 200,
                child: Card(
                  elevation: 12.0,
                  shadowColor: Colors.blue,
                  child: Center(
                    child: Text(
                      "BANKER'S ALGORITHM",
                      style: TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            //A container starts here
            InkWell(
              onTap: () => Navigator.of(context).pushNamed('/lock'),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.greenAccent])),
                height: 90,
                width: 200,
                child: Card(
                  elevation: 12.0,
                  shadowColor: Colors.blue,
                  child: Center(
                    child: Text(
                      "LOCK VARIABLE",
                      style: TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            //A container starts here
            InkWell(
              onTap: () => Navigator.of(context).pushNamed('/test'),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.greenAccent])),
                height: 90,
                width: 200,
                child: Card(
                  elevation: 12.0,
                  shadowColor: Colors.blue,
                  child: Center(
                    child: Text(
                      "TEST AND SET",
                      style: TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            //A container starts here
            InkWell(
              onTap: () => Navigator.of(context).pushNamed('/petersons'),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.greenAccent])),
                height: 90,
                width: 200,
                child: Card(
                  elevation: 12.0,
                  shadowColor: Colors.blue,
                  child: Center(
                    child: Text(
                      "PETERSON'S ALGORITHM",
                      style: TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            //A container starts here
            InkWell(
              onTap: () => Navigator.of(context).pushNamed('/ostrich'),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.greenAccent])),
                height: 90,
                width: 200,
                child: Card(
                  elevation: 12.0,
                  shadowColor: Colors.blue,
                  child: Center(
                    child: Text(
                      "OSTRICH METHOD",
                      style: TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            //A container starts here
            InkWell(
              onTap: () => Navigator.of(context).pushNamed('/turn'),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.greenAccent])),
                height: 90,
                width: 200,
                child: Card(
                  elevation: 12.0,
                  shadowColor: Colors.blue,
                  child: Center(
                    child: Text(
                      "TURN VARIABLE",
                      style: TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 14.0,
            ),
            //A container starts here
            InkWell(
              onTap: () => Navigator.of(context).pushNamed('/bisem'),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.greenAccent])),
                height: 90,
                width: 200,
                child: Card(
                  elevation: 12.0,
                  shadowColor: Colors.blue,
                  child: Center(
                    child: Text(
                      "BINARY SEMAPHORES",
                      style: TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 14.0,
            ),
            //A container starts here
            InkWell(
              onTap: () => Navigator.of(context).pushNamed('/cosem'),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.greenAccent])),
                height: 90,
                width: 200,
                child: Card(
                  elevation: 12.0,
                  shadowColor: Colors.blue,
                  child: Center(
                    child: Text(
                      "COUNTING SEMAPHORES",
                      style: TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 14.0,
            ),
          ],
        ),
      ),
    );
  }
}
