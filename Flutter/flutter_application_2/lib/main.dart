import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Container Demo!!',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Flutter Container demo"),
      ),
      body: Container(
        width: 600,
        height: 600,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("A ", style: TextStyle(fontSize: 25),),
                Text("B ", style: TextStyle(fontSize: 25),),
                Text("C ", style: TextStyle(fontSize: 25),),
              ],
            ),
            Text('A ', style: TextStyle(fontSize: 25),),
            Text('B ', style: TextStyle(fontSize: 25),),
            Text('C ', style: TextStyle(fontSize: 25),),
            Text('D ', style: TextStyle(fontSize: 25),),
            Text('E ', style: TextStyle(fontSize: 25),),
            ElevatedButton(
              onPressed: (){
                print("elevated button pressed!");
              }, child: Text("Click!!"),
            )

          ],
        ),
      )
    );
  }
}