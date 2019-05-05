import 'package:flutter/material.dart';

class tabbarWidget extends StatefulWidget {
  final List icons;
  final List titles;
  final List pageList;
  const tabbarWidget(
      {Key key,
      @required this.titles,
      @required this.icons,
      @required this.pageList})
      : super(key: key);

  _tabbarWidgetState createState() => _tabbarWidgetState();
}

class _tabbarWidgetState extends State<tabbarWidget> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _getBottomNavigationBar(),
    );
  }
  //tabbar
  Widget _getBottomNavigationBar() {
    var page = widget.pageList[_tabIndex];    
    return page(BottomNavigationBar(
      items: _getBottomNavigationBarItem(),
      // 显示的模式
      type: BottomNavigationBarType.fixed,
      //默认页
      currentIndex: _tabIndex,
      //点击item
      onTap: (index){
        //刷新页面
        setState(() {
          _tabIndex = index;
        });
      },
    ));
  }

  //items
  List<BottomNavigationBarItem>_getBottomNavigationBarItem(){
    List<BottomNavigationBarItem>items = [];
    for (int i = 0;i<widget.icons.length;i++){
     BottomNavigationBarItem item =  BottomNavigationBarItem(
                icon: widget.icons[i], title: widget.titles[i]);
     items.add(item);
    }
    return items;
  }  
}
