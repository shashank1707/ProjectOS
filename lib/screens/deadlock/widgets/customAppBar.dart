import 'package:flutter/material.dart';
import 'package:project_os/main.dart';

import 'clipShadowPath.dart';

class CustomAppBar extends StatefulWidget {
  CustomAppBar({Key key}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return ClipShadowPath(
      shadow: BoxShadow(
        color: Colors.blue,
        spreadRadius: 10,
        blurRadius: 5,
        offset: Offset(-5, 3),
      ),
      clipper: MyClipper(),
      child: Container(
        // creating gradient container
        height: 320,
        decoration: BoxDecoration(
            // creating gradient
            gradient:
                LinearGradient(colors: [Colors.blue, Colors.greenAccent])),
        child: Row(
          // Row as a child of container to set back arrow and app page title
          children: [
            IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
              Navigator.pop(context);
            }),
            SizedBox(
              width: 14.0,
            ),
            Center(
              child: Container(
                height: 100,
                width: 300,
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Concurrency and Deadlock",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height - 50);
    var controllPoint = Offset(50, size.height);
    var endPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(
        controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
