import 'package:flutter/material.dart';
import 'pages/firstPage.dart';
import 'pages/secondPage.dart';
import 'pages/thirdPage.dart';

final icons = [
  Icon(Icons.ac_unit),
  Icon(Icons.threed_rotation),
  Icon(Icons.access_time)
];
final titles = ['第一个', '第二个', '第三个'];
final pageList = [firstPage(), secondPage(), thirdPage()];
int _tabIndex = 0;

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: MainPageWidget());
  }
}

class MainPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MainPageState();
  }
}

class MainPageState extends State<MainPageWidget> {
  @override
  Widget build(BuildContext context) => _build(context);

  Widget _build(BuildContext context) {
    
    return Scaffold(
      body: pageList[_tabIndex],
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }

  BottomNavigationBar getBottomNavigationBar() {
    print(_tabIndex);
    return BottomNavigationBar(
      items: getBottomNavigationBarItems(),
      type: BottomNavigationBarType.fixed,
      //默认选中首页
      currentIndex: _tabIndex,
      iconSize: 24.0,
      onTap: (index) {       
        setState(() {
        _tabIndex = index;    
        });  
      },
    );
  }

  List getBottomNavigationBarItems() {
    return <BottomNavigationBarItem>[
      new BottomNavigationBarItem(icon: icons[0], title: Text(titles[0])),
      new BottomNavigationBarItem(icon: icons[1], title: Text(titles[1])),
      new BottomNavigationBarItem(icon: icons[2], title: Text(titles[2])),
    ];
  }
}
 