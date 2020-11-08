import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'infoCard.dart';
import '../component/sliverCustomHeaderDelegate.dart';

class Content extends StatelessWidget{
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
              color: Color(0xFFF6F5F7),
              // transform: Matrix4.translationValues(0, -49, 0),
              child:Column(
                children: <Widget>[
                  InfoCard(type: 'card', title: '订单金额', data: [InfoItem('支付方式', '线下支付'), InfoItem('车款', '82,000元'), InfoItem('成交服务费', '-400元'), InfoItem('实收款', '81,600元'), InfoItem('保证金', '冻结出售保证金1000元，从抵押保证金中扣除，交易成功后会自动返回')]),
                  InfoCard(type: 'card', title: '交付信息', data: [InfoItem('交割方', '优信拍代理'), InfoItem('联系人', '优信拍代理·1010-1088'), InfoItem('所在地', '北京')]),
                  InfoCard(type: 'card', title: '交付信息', data: [InfoItem('交割方', '优信拍代理'), InfoItem('联系人', '优信拍代理·1010-1088'), InfoItem('所在地', '北京')]),
                  InfoCard(type: 'card', title: '交付信息', data: [InfoItem('交割方', '优信拍代理'), InfoItem('联系人', '优信拍代理·1010-1088'), InfoItem('所在地', '北京')]),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 69),
                    child: InfoCard(type: 'card', title: '交付信息', data: [InfoItem('交割方', '优信拍代理'), InfoItem('联系人', '优信拍代理·1010-1088'), InfoItem('所在地', '北京')]),
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}

class Detail extends StatelessWidget{
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
        children: <Widget>[
          Content(),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: Container(
                height: 69,
                padding: EdgeInsets.all(20.0),
                color: Colors.white,
                child: new Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        flex:1,
                        child: Text('实收款 81,600元', style: TextStyle(
                          color: Color(0xFF999999),
                        ))
                      ),
                      Expanded(
                        flex: 2,
                        child: new Flex(
                          direction: Axis.horizontal,
                        // textDirection: TextDirection.rtl,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Text('电话联系', textAlign: TextAlign.right),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text('确认收款', textAlign: TextAlign.right),
                            )
                          ],
                      ),
                    )
                  ]
              )
            ),
          ),
        ],
      ),
    );
  }
}