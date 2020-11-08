import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/component/infoCard.dart';
import 'package:flutter_app/component/sliverCustomHeaderDelegate.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {

  ScrollController _scrollController;
  VoidCallback onChange;

  var data;

  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener((){

    });

    var loadFile = "assets/order_detail_data.json";

    rootBundle.loadString(loadFile).then((value) {
      setState(() {
        data = json.decode(value.toString())['respData'];
      });
    });
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF6F5F7),
        body: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Stack(
                alignment:Alignment.center,
                children: <Widget>[
                  CustomScrollView(
                    controller: _scrollController,
                    slivers: <Widget>[
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: SliverCustomHeaderDelegate(
                            title: '订单详情',
                            collapsedHeight: 44,
                            expandedHeight: 169,
                             paddingTop: MediaQuery.of(context).padding.top,
                            coverImgUrl: 'https://img.58cdn.com.cn/escstatic/fecar/pmuse/youxinpai/orderbg.png'
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          // transform: Matrix4.translationValues(0, 155.5, 0),
                          child: Column(
                              children: _renderChild(),
                          )
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 49,
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(20, 11, 20, 11),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                '实收款',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF333333)
                                ),
                              ),
                              SizedBox(width: 2),
                              Text(
                                '81,600元',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFFFF552E)
                                ),
                              )
                            ],
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                RaisedButton(
                                  onPressed: () => {
                                    _makePhoneCall('tel:18229070867')
                                  },
                                  child: Text(
                                    '电话联系',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF333333)
                                    ),
                                  ),
                                  color: Colors.white,
                                  shape: StadiumBorder(),
                                ),
                                SizedBox(width: 10),
                                RaisedButton(
                                  onPressed: () => {

                                  },
                                  child: Text(
                                    '确认收款',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white
                                    ),
                                  ),
                                  color: Color(0xFFFF5520),
                                  shape: StadiumBorder(),
                                ),
                              ],
                            ),
                            flex: 1
                          ),
                        ],
                      ),
                    ),
                  )
                ],
            ),
        )
    );
  }

  List<Widget> _renderChild() {
    List<Widget> list = new List();
    data["orderDetail"].forEach((info) => {
      list.add(InfoCard(info))
    });
    list.add(InfoCard({"data": data["jindu"], "type": "step", "title": "交付进度"}));
    list.add(SizedBox(height: 50));
    return list;
  }
}