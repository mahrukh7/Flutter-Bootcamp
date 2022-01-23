import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter UI App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(title: 'Login Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 125.0,),
            CircleAvatar(
              radius: 38,
              backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/70944109?v=4'),
            ),
            const SizedBox(
              height: 45.0,
            ),
            Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
            const SizedBox(height: 8.0,),
            Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 18.0,),
            ButtonBar(
              children: <Widget>[
                TextButton(
                  child: const Text('CANCEL'),
                  onPressed: (){
                    //cancel login
                  },
                ),
                ElevatedButton(
                  child: const Text('NEXT'),
                  onPressed: (){
                    //move to the next page
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
