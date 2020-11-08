import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/component/stepCard.dart';
// import 'package:flutter_app/model/infoCard.dart';

/**
 * @type 卡片类型
 * setp: 进度卡片
 * car: 车辆信息卡片
 * order: 订单信息卡片
 */

class InfoCard extends StatelessWidget{

  final info;
  InfoCard(this.info);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 0, 16, 14),
      padding: EdgeInsets.all(15.0),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        border: new Border.all(width: 1, color: Colors.white),
      ),
      child: renderChild()
    );
  }

  Widget renderChild() {
    switch(this.info["type"]) {
      case "step":
        return StepCard(this.info["data"]);
      case 'car':
        return CarCard(this.info);
      case 'order':
        return OrderCard(this.info);
    }
  }
}

class CarCard extends StatelessWidget {
  final info;
  CarCard(this.info);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 89.5,
              height: 67.5,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                image: DecorationImage(
                    image: NetworkImage("https://pic2.58cdn.com.cn/p1/big/n_v26d53fadb15e74fbea1f1659c00c3727e.jpg"),
                    fit: BoxFit.cover
                ),
                // border: new Border.all(width: 1, color: Colors.white),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 190,
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(
                    "大众 迈腾 2017款 380TDSI DSG 豪华舒适型",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF333333)
                    ),
                  ),
                ),
                Text(
                  "车牌号·京A12345",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF999999)
                  ),
                )
              ],
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          color: Color(0xFFF7F7F7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(width: 13),
              Text("订单编号"),
              Text(
                "JY20200115182032",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF333333)
                ),
              ),
              FlatButton(
                child: Container(
                  width: 28,
                  height: 15,
                  decoration: new BoxDecoration(
                    color: Color(0xFFFCFAFB),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    border: new Border.all(width: 1, color: Color(0xFFFF552E)),
                  ),
                  child: Center(
                    child: Text(
                      "复制",
                      style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFF552E)
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: 'JY20200115182032'))
                      .then((value) => print('已复制'));
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}

class OrderCard extends StatelessWidget {
  final info;
  OrderCard(this.info);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 5.0,
      children: <Widget>[
        new Row(
          children: <Widget>[
            Text(
              "${this.info["title"]}",
              style: TextStyle(
                  color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        Column(
          children: this.info["data"].map<Widget>((info) => Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Text(
                  '${info["text"]}：',
                  style: TextStyle(
                    color: Color(0xFF999999),
                  )
                )
              ),
              Expanded(
                flex: 2,
                child: Wrap(
                  textDirection: TextDirection.rtl,
                  children: <Widget>[Text("${info["value"]}", textAlign: TextAlign.right)],
                ),
              )
            ],
          )).toList()
        ),
      ],
    );
  }
  
}
