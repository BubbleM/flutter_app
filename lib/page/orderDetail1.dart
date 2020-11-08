import 'package:flutter/material.dart';
import 'package:flutter_app/component/sliverCustomHeaderDelegate.dart';

class OrderDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  // String tradingStatus;
  // OrderDetail({this.tradingStatus=''});

  ScrollController _scrollController;
  VoidCallback onChange;

  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener((){
      print(_scrollController.offset);
      print('...................onChange');
    });
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _scrollController.dispose();
    super.dispose();
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
                    // controller: _scrollController,
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
                      // SliverToBoxAdapter(
                      //   child: Container(
                      //     transform: Matrix4.translationValues(0, 155.5, 0),
                      //     child: Card(
                      //       // margin: EdgeInsets.fromLTRB(16, 0, 16, 14),
                      //       child: Column(
                      //         children: <Widget>[
                      //           Card(
                      //             margin: EdgeInsets.all(10),
                      //             child: Column(
                      //               children: <Widget>[
                      //                 Card(
                      //                   margin: EdgeInsets.all(10),
                      //                   child: Column(
                      //                     children: <Widget>[
                      //                       ListTile(title: Text('张三'), subtitle: Text('高级工程师')),
                      //                       ListTile(title: Text('电话：xxxxxx')),
                      //                       ListTile(title: Text('地址：山西山西陕西'))
                      //                     ],
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     )
                      //   ),
                      // )
                    ],
                  ),
                  ListView.builder(
                      itemCount: 100,
                      itemExtent: 50.0, //列表项高度固定时，显式指定高度是一个好习惯(性能消耗小)
                      controller: _scrollController,
                      itemBuilder: (context, index) {
                        return ListTile(title: Text("$index"),);
                      }
                  ),
                ],
            ),
        )
    );
  }
}