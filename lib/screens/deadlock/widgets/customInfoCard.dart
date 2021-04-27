import 'package:project_os/screens/deadlock/widgets/modalSheetContent.dart';
import 'package:flutter/material.dart';

class CustomInfoCard extends StatefulWidget {
  @override
  _CustomInfoCardState createState() => _CustomInfoCardState();
}

class _CustomInfoCardState extends State<CustomInfoCard> {
  //A function which is called on Elevated button press to show modal sheet
  void showModalData(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return ModalSheetContent();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Card one
        InkWell(
          hoverColor: Colors.blueAccent,
          onTap: () => Navigator.of(context).pushNamed('/first'),
          child: Container(
            height: 170,
            width: 350,
            child: Card(
              elevation: 8.0,
              shadowColor: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "MORE ABOUT CONCURRENCY",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ),
        ),
        //Card one end
        SizedBox(
          height: 12.0,
        ),
        //Card two
        InkWell(
          onTap: () => Navigator.of(context).pushNamed('/second'),
          hoverColor: Colors.blueAccent,
          child: Container(
            height: 170,
            width: 350,
            child: Card(
              elevation: 8.0,
              shadowColor: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "MORE ABOUT DEADLOCK",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ),
        ),
        //Card two end
        SizedBox(
          height: 12.0,
        ),
        InkWell(
          onTap: () => Navigator.of(context).pushNamed('/third'),
          hoverColor: Colors.blueAccent,
          child: Container(
            height: 170,
            width: 350,
            child: Card(
              elevation: 8.0,
              shadowColor: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "SEMPAHORES",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 12.0,
        ),
        InkWell(
          onTap: () => showModalData(context),
          hoverColor: Colors.blueAccent,
          child: Container(
            height: 170,
            width: 350,
            child: Card(
              elevation: 12.0,
              shadowColor: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "EXPLORE VARIOUS ALGORITHMS",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
