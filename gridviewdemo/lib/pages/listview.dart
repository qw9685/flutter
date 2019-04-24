import 'package:flutter/material.dart';
import 'package:gridviewdemo/config/constConfig.dart';

BuildContext _context;

class listview extends StatelessWidget {
  final String navTitle;
  listview({Key key, @required this.navTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) => _build(context, navTitle);
}

@override
Widget _build(BuildContext context, String navTitle) {
  _context = context;
  return Scaffold(
    appBar: AppBar(
      title: Text(navTitle),
      centerTitle: true, //强制文字居中
    ),
    body: Container(
      child: ListView(children: _children()),
    ),
  );
}

List<Widget> _children() {
  List<Widget> Widgets = [];
  for (int i = 0; i < 100; i++) {
    Widgets.add(_getItem(i, i.toString()));
  }
  return Widgets;
}

Widget _getItem(int index, String text) {
  if (index.isOdd) return new Divider(); //添加分割线
  return new Container(
    height: 60,
    child: new Row(
      children: <Widget>[
        _leftText(index,text),
      ],
    ),
  );
}

Widget _leftText(int index, String text) {
  return Container(
    margin: EdgeInsets.only(left: 20),
    width: 120,
    child: Text('这是第${text}个item', textAlign: TextAlign.center),
    alignment: Alignment.center, //居中
  );
}
