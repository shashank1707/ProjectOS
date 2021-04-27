import 'package:project_os/screens/deadlock/bankersAlgoTwo.dart';
import 'package:flutter/material.dart';

class BankersAlgoLogic extends StatefulWidget {
  BankersAlgoLogic({Key key}) : super(key: key);

  @override
  _BankersAlgoLogicState createState() => _BankersAlgoLogicState();
}

class _BankersAlgoLogicState extends State<BankersAlgoLogic> {
  TextEditingController processController = new TextEditingController();
  TextEditingController resourceController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 12,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: processController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter number of processes',
                  hintText: 'Enter Integer value'),
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 18,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: resourceController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter number of resources',
                  hintText: 'Enter Integer value'),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BankersAlgoTwo(
                              processNumber: int.parse(processController.text),
                              resourceNumber:
                                  int.parse(resourceController.text),
                            )));
              },
              child: Text("next"))
        ],
      ),
    );
  }
}
