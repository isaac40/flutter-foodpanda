import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'BPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

//便當圖片
class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/banto.png"),
            titleSection,
            RadButton("訂餐去", context),
            RadButton("揪團去",context)
          ],
        ),
      ),
    );
  }

  //揪訂餐
  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      '點 餐 囉',
      style: TextStyle(fontSize: 50, color: Colors.blue),
      softWrap: true,
    ),
  );
}

//揪團button
Widget RadButton(String s, BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 20),
    //利用container底下去使用margin,去使Button之間擁有間隔
    child: RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(color: Colors.red)),
      onPressed: () {
        //按鈕特效以及按下button後要去的位置
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BPage()));
      },
      child: Text((s), style: TextStyle(fontSize: 60, color: Colors.blue)),
    ),
  );
}
