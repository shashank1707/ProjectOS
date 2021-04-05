import 'package:project_os/screens/disk/description/clook_description.dart';
import 'package:project_os/screens/disk/description/look_description.dart';
import 'package:project_os/screens/disk/description/fcfs_description.dart';
import 'package:project_os/screens/disk/description/sstf_description.dart';
import 'package:project_os/screens/disk/description/scan_description.dart';
import 'package:project_os/screens/disk/description/cscan_description.dart';
import 'package:flutter/material.dart';

class AlgoInfoScreen extends StatelessWidget {
  final String title;

  AlgoInfoScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(title),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: text(title),
      ),
    );
  }
 Widget text(String title){
          if(title=="CLOOK"){
            return CLookDescription();
          }else if(title =="LOOK"){
            return LookDescription();
          }else if(title =="FCFS"){
           
            return FcfsDescription();
          
          }else if(title =="SSTF"){
           
            return SstfDescription();
          
          }else if(title =="SCAN"){
           
            return ScanDescription();
          
          }else if(title =="CSCAN"){
           
            return CscanDescription();
          
          }
          else {

            return Center(child: Text(title),);
          }
 }

}
