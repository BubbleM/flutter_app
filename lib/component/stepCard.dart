import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class StepCard extends StatelessWidget {

  List stepInfo;
  StepCard(this.stepInfo);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 5.0,
      children: <Widget>[
        new Row(
          children: <Widget>[
            Text(
              "交付进度",
              style: TextStyle(
                  color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        Column(
            children: this.stepInfo.map((step) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(formatDate(DateTime.parse(step["step_time"]), [mm, "-", dd]), style: TextStyle(color: Color(0xFF666666), fontSize: 13)),
                    Text(formatDate(DateTime.parse(step["step_time"]), [hh, ":", nn]), style: TextStyle(color: Color(0xFFAAAAAA), fontSize: 12))
                  ],
                ),
                Column(
                  children: <Widget>[
                    _buildIcon(1),
                    _buildLine(true)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      step["step_name"],
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF333333),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: step["step_detail"].map<Widget>((info) =>
                        Text(
                          "$info",
                          style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF333333)
                          ),
                        )
                      ).toList()
                    ),
                    // Container(
                    //   width: 68,
                    //   height: 25,
                    //   margin: EdgeInsets.fromLTRB(150, 9, 0, 0),
                    //   decoration: new BoxDecoration(
                    //     borderRadius: BorderRadius.all(Radius.circular(13.0)),
                    //     border: new Border.all(width: 1, color: Color(0xFFE6E6E6)),
                    //   ),
                    //   child: Center(
                    //     child: Text(
                    //       "呼叫代驾",
                    //       style: TextStyle(
                    //           fontSize: 12,
                    //           fontWeight: FontWeight.w400,
                    //           color: Color(0xFF333333)
                    //       ),
                    //     ),
                    //   ),
                    // )
                  ],
                )
              ],
            )).toList()
        ),
      ],
    );
  }

  Widget _buildLine(bool visible) {
    return Container(
      width: visible ? 1.0 : 0.0,
      height: 70.0,
      color: Color(0xFFEBEBEB),
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
    );
  }

  Widget _buildIcon(int index) {
    return  Container(
      width: 10,
      height: 10,
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(13.0)),
        border: new Border.all(width: 2, color: Color(index == 1 ? 0xFFFF552E : 0xFFE0E0E0)),
      ),
    );
  }
}