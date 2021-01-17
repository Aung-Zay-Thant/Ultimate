import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count;

  @override
  void initState() {
    getCount();
    super.initState();
  }

  getCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = prefs.getInt("count");
    if (counter == null) {
      setState(() {
        count = 0;
      });
    } else {
      setState(() {
        count = counter;
      });
    }
  }

  counter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      count = count + 1;
    });
    prefs.setInt("count", count);
  }

  deleteCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("count");
    int counter = prefs.getInt("count");
    if (counter == null) {
      setState(() {
        count = 0;
      });
    } else {
      setState(() {
        count = counter;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SharePrefrences"),
        leading: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            deleteCount();
          },
        ),
      ),
      body: Center(
        child: Text(
          "Pressed $count times",
          style: TextStyle(fontSize: 25),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          counter();
        },
      ),
    );
  }
}
