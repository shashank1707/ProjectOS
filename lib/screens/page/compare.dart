import 'package:ProjectOS/screens/page/comparisonGraph.dart';
import 'package:flutter/material.dart';
import './components/neuContainer.dart';

class ComparePage extends StatelessWidget {

  final Map fifoData, lruData, oprData;

  ComparePage({this.fifoData, this.lruData, this.oprData});

  @override
  Widget build(BuildContext context) {
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
          
          title: Text("Comparison", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFF5DA3FA))),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              DisplayInfo(
                title: "FIFO",
                pageHit: fifoData["pageHit"],
                pageFault: fifoData["pageFault"],
                hitRatio: fifoData["hitRatio"].toStringAsFixed(2),
                faultRatio: fifoData["faultRatio"].toStringAsFixed(2),
              ),
              DisplayInfo(
                title: "LRU",
                pageHit: lruData["pageHit"],
                pageFault: lruData["pageFault"],
                hitRatio: lruData["hitRatio"].toStringAsFixed(2),
                faultRatio: lruData["faultRatio"].toStringAsFixed(2),
              ),
              DisplayInfo(
                title: "OPR",
                pageHit: oprData["pageHit"],
                pageFault: oprData["pageFault"],
                hitRatio: oprData["hitRatio"].toStringAsFixed(2),
                faultRatio: oprData["faultRatio"].toStringAsFixed(2),
              ),
              NeuContainer(
                boxChild: FlatButton.icon(
                  icon: Icon(Icons.bar_chart_rounded, color: Color(0xFF5DA3FA)),
                  label: Text("Show Graph", style: TextStyle(fontWeight: FontWeight.bold),),
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ComparisonGraph(
                        fifoData: fifoData,
                        lruData: lruData,
                        oprData: oprData,
                      ))
                    );
                  },
                ),
              )
              
            ]
          ),
        )
      ),
    );
  }
}

class DisplayInfo extends StatelessWidget {

  final pageHit, pageFault;
  final hitRatio, faultRatio;
  final title;

  DisplayInfo({this.pageHit, this.pageFault, this.hitRatio, this.faultRatio, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("$title", style: TextStyle(
                    color: Color(0xff616161),
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  )),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Page Hit : $pageHit", style: TextStyle(
                          color: Color(0xff007aff),
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Hit Ratio : $hitRatio", style: TextStyle(
                          color: Color(0xff007aff),
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        )),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Page Fault : $pageFault", style: TextStyle(
                          color: Color(0xfffc6b4e),
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Fault Ratio : $faultRatio", style: TextStyle(
                          color: Color(0xfffc6b4e),
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        )),
                      )
                    ],
                  ),
              ]
            )
          ),
        );
  }
}