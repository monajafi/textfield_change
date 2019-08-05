import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Retrieve Text Input",
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();
  @override
  void initState() {
    super.initState();
    myController.addListener(_printLatestValue);
  }
  _printLatestValue(){
    print("Second text field: ${myController.text}");
  }
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Retrieve Text Input"),),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (text){
                print("First text field: $text");
              },
            ),
            TextField(
              controller: myController,
            )
          ],
        ),
      ),
    );
  }
}