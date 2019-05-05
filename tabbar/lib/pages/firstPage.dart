import 'package:flutter/material.dart';

TabController _tabController;

class firstPage extends StatefulWidget {
  firstPage({Key key}) : super(key: key);
  _firstPageState createState() => _firstPageState();
}

class _firstPageState extends State<firstPage>
    with SingleTickerProviderStateMixin {
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('1'),
          bottom: new TabBar(
            tabs: <Widget>[
              new Tab(
                icon: new Icon(Icons.access_alarms),
              ),
              new Tab(
                icon: new Icon(Icons.accessibility),
              ),
              new Tab(
                icon: new Icon(Icons.accessible_forward),
              )
            ],
            controller: _tabController,
          ),
        ),
        body: new TabBarView(
          controller: _tabController,
          children: <Widget>[
            new Center(child: new Text('tab1')),
            new Center(child: new Text('tab2')),
            new Center(child: new Text('tab3')),
          ],
        ),
      ),
    );
  }
}
