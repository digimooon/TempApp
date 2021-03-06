import 'package:flutter/material.dart';
import 'package:temperature_app/temp_notifier.dart';

import 'main.dart';

class InfoDialog extends Dialog {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.fromLTRB(35, 0, 35, 100),
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Material(
          color: Colors.white,
          child: _InfoWidget(),
        ),
      ),
    );
  }
}

class _InfoWidget extends StatefulWidget {
  @override
  _InfoWidgetState createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<_InfoWidget> {
  String name;
  String address;

  void _saveInfo(context) {
    TempApp.name = name;
    TempApp.address = address;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    var hintStyle =
    TextStyle(color: Color.fromRGBO(201, 204, 209, 1), fontSize: 13);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("信息录入",
            style: TextStyle(
                color: Colors.deepPurple[800],
                fontWeight: FontWeight.bold,
                fontSize: 17)),
        SizedBox(height: 20),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 55,
          ),
          child: TextField(
            decoration: InputDecoration(
                hintText: '姓名',
                hintStyle: hintStyle,
                filled: true,
                fillColor: Color.fromRGBO(235, 238, 243, 1),
                isCollapsed: true,
                contentPadding: EdgeInsets.fromLTRB(15, 18, 0, 18),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none)),
            onChanged: (input) => setState(() => name = input),
          ),
        ),
        SizedBox(height: 15),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 55,
          ),
          child: TextField(
            decoration: InputDecoration(
                hintText: '地址',
                hintStyle: hintStyle,
                filled: true,
                fillColor: Color.fromRGBO(235, 238, 243, 1),
                isCollapsed: true,
                contentPadding: EdgeInsets.fromLTRB(15, 18, 0, 18),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none)),
            onChanged: (input) => setState(() => address = input),
          ),
        ),
        Container(
            height: 50,
            width: 400,
            margin: const EdgeInsets.only(top: 20, left: 25, right: 25),
            child: RaisedButton(
              onPressed: () => _saveInfo(context),
              color: Colors.deepPurple,
              splashColor: Color.fromRGBO(103, 110, 150, 1),
              child: Text('保存',
                  style: TextStyle(color: Colors.white, fontSize: 13)),
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            )),
      ],
    );
  }
}


class DisplayDialog extends Dialog {
  final List<List<double>> data;
  final ColorMaker maker;

  DisplayDialog(this.data, this.maker);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 280,
        height: 400,
        child: CustomPaint(
            painter: TempPainter(data, maker, true), size: Size(280, 400)),
      ),
    );
  }
}