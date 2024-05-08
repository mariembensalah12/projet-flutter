import 'package:flutter/material.dart';

class TimelineTileWidget extends StatelessWidget {
  final Widget startChild;
  final Widget endChild;
  final double lineXY;
  final bool isFirst;
  final bool isLast;
  final IndicatorStyle indicatorStyle;

  TimelineTileWidget({
    required this.startChild,
    required this.endChild,
    required this.lineXY,
    required this.isFirst,
    required this.isLast,
    required this.indicatorStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            _buildIndicator(),
            Expanded(child: _buildLine()),
            _buildIndicator(),
          ],
        ),
        Row(
          children: <Widget>[
            isFirst ? SizedBox(width: 40) : SizedBox(width: 20),
            Expanded(child: startChild),
            SizedBox(width: 20),
            Expanded(child: endChild),
            isLast ? SizedBox(width: 40) : SizedBox(width: 20),
          ],
        ),
      ],
    );
  }

  Widget _buildIndicator() {
    return Container(
      height: 40,
      width: 40,
      child: Center(
        child: Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: indicatorStyle.color,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _buildLine() {
    return Container(
      height: double.infinity,
      width: 1,
      color: Colors.grey,
      margin: EdgeInsets.symmetric(horizontal: 20),
    );
  }
}

class IndicatorStyle {
  final Color color;

  IndicatorStyle({required this.color});
}
