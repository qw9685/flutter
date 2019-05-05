import 'package:flutter/material.dart';
import 'widgets/tabbarWidget.dart';
import 'pages/firstPage.dart';
import 'pages/secondPage.dart';
import 'pages/thirdPage.dart';

final icons = [Icon(Icons.ac_unit),Icon(Icons.threed_rotation),Icon(Icons.access_time)];
final titles = ['第一个','第二个','第三个'];
final pageList = [firstPage(),secondPage(),thirdPage()];

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: tabbarWidget(icons: icons,titles: titles,pageList: pageList,),
          ),
        ),
      ),
    );
  }
}