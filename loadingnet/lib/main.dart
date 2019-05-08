import 'package:flutter/material.dart';
import 'package:tip_dialog/tip_dialog.dart';
import 'tipWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new TipDialogContainer(//必须使用TipDialogContainer包裹
        child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'loading'),
    ));
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
      body: Center(child: _listViewBuild(context)),
    );
  }

  Widget _listViewBuild(BuildContext context) {
    return new Container(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(10.0),
          itemCount: _getItemList().length * 2,
          itemBuilder: (BuildContext context, int index) {
            return _itemBuilder(context, index);
          }),
    );
  }

  //item数据
  List _getItemList() {
    List items = [
      '提示loading',
      '提示失败',
      '提示成功',
      '提示自定义',
    ];
    return items;
  }

//_itemBuilder
  Widget _itemBuilder(BuildContext context, int index) {
    if (index.isOdd) return new Divider();//分割线

    return Container(
        height: 60,
        child: new TipDialogConnector(builder: (context, tipController) {
          return InkWell(
            onTap: () {
              print("${index}");
              switch (index) {
                case 0:
                  //loading
                  showLoading(tipController);
                  new Future.delayed(const Duration(seconds: 2),
                      () => hideLoading(tipController));
                  break;
                case 2:
                  showFail(tipController, "失败了!");
                  break;
                case 4:
                  showSuccess(tipController, "成功!");
                  break;
                case 6:
                  showTip(tipController, "提示...");
                  break;
                default:
              }
            },
            child: Align(
                alignment: new FractionalOffset(0.0, 0.5),
                child: Text(
                  _getItemList()[index ~/ 2],
                  style: TextStyle(color: Colors.black, fontSize: 14.0),
                )),
          );
        }));
  }
}
