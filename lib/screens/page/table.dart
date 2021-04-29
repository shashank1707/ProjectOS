import 'package:flutter/material.dart';

class DataGrid extends StatelessWidget {

  final dataTable;
  final inputString;

  DataGrid({this.dataTable, this.inputString});
  var fr = 1;
  var index = 0;

  bool isSame = false;

  var prev = [-1, -1, -1];

  @override
  Widget build(BuildContext context) {
    var _inputString = inputString.split(" ");
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFEBEBEB),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded, size: 25, color: Colors.black,),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          title: Text("Table", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFF5DA3FA))),
        ),
        body: Align(
          alignment: Alignment.topCenter,
                  child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.circle, color: Color(0xff007aff), size: 15,),
                              SizedBox(width: 15),
                              Text("Page Hit", style: TextStyle(color: Color(0xff007aff), fontWeight: FontWeight.bold, fontSize: 16), )
                            ]
                          ),
                          SizedBox(width: 50),
                          Row(
                            children: [
                              Icon(Icons.circle, color: Color(0xfffc6b4e), size: 15,),
                              SizedBox(width: 15),
                              Text("Page Fault", style: TextStyle(color: Color(0xfffc6b4e), fontWeight: FontWeight.bold, fontSize: 16),)
                            ]
                          )
                        ]
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xFF616161)
                            ),
                            child: Text("Page", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                          ...(dataTable[0]).map((k){
                            return Container(
                              margin: EdgeInsets.all(5),
                              alignment: Alignment.center,
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xFF616161)
                              ),
                              child: Text("F${fr++}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            );
                          }).toList(),
                        ],
                      ),
                      
                      ...(dataTable).map((arr){
                        isSame = false;
                        if(arr.toString() == prev.toString()){
                          isSame = true;
                        }
                        prev = arr;
                        return Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(5),
                              alignment: Alignment.center,
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xFFebebeb)
                              ),
                              child: Text("${_inputString[index++]}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                            ),
                            ...(arr).map((e){
                              return Container(
                                margin: EdgeInsets.all(5),
                                alignment: Alignment.center,
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(e == -1 ? " " : "$e", style: TextStyle(fontWeight: FontWeight.bold,
                                color: isSame ? Color(0xff007aff) : Color(0xfffc6b4e)
                                )
                                ,),
                              );
                            }).toList()
                          ],
                        );
                      }).toList()
                    ],
                  )
              )
            ),
          ),
        )
      ),
    );
  }
}