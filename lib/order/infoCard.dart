import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoItem {
  String text;
  String value;

  InfoItem(this.text, this.value);
}

class InfoCard extends StatelessWidget {
  InfoCard({@required this.type, @required this.title, @required this.data});
  final type;
  final title;
  List<InfoItem> data;

  List<Widget> buildItem() {
    List<Widget> items = [];
    items.add(new Row(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
          textAlign: TextAlign.left,
        ),
      ],
    ));
    for (var item in data) {
      items.add(new Flex(direction: Axis.horizontal, children: <Widget>[
        Expanded(
            flex: 1,
            child: Text(item.text + '：',
                style: TextStyle(
                  color: Color(0xFF999999),
                ))),
        Expanded(
          flex: 2,
          child: Wrap(
            textDirection: TextDirection.rtl,
            children: <Widget>[Text(item.value, textAlign: TextAlign.right)],
          ),
        )
      ]));
    }

    return items;
  }

  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: new BoxDecoration(
          color: Colors.white,
          //设置四周圆角 角度
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          //设置四周边框
          border: new Border.all(width: 1, color: Colors.white),
        ),
        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
        margin: EdgeInsets.fromLTRB(16, 0, 16, 14),
        child: Wrap(runSpacing: 5.0, children: buildItem()));
  }
}
