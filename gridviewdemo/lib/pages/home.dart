
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gridviewdemo/pages/listview.dart';

final List<String> titles = [];
final List<Color> backColors = [];

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  void initState() {
    super.initState();
    for(int i = 0; i<100;i++){
      titles.add(i.toString());
      //随机颜色
      backColors.add(Color.fromRGBO(Random.secure().nextInt(255), Random.secure().nextInt(255), Random.secure().nextInt(255), 1.0));
    }    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('girdView', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromRGBO(73, 73, 73, 1.0),
        centerTitle: true, //强制文字居中
      ),
      body: GridView.builder(
        itemCount: titles.length,    
        //横轴item数量 间距
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 10.0,          
        ),
        itemBuilder: (BuildContext context,int index){
          return _itemBuilder(context,index);
        }
      )
    );
  }

  Container _itemBuilder(BuildContext context, int index) {
    return new Container(
      //设置item圆角
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0), color: backColors[index]),
      child: InkWell(
        onTap: () {
          clickItemBtn(context,index);
        },
        child: Center(
          child: Text(
            titles[index],
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}

//点击item
void clickItemBtn(BuildContext context,int index) {
        Navigator.push(context,
        MaterialPageRoute(builder: (context)=>
        listview(navTitle: titles[index])
      )
    );       
}
