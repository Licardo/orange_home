import 'dart:math';

import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return BannerState();
  }
}

class BannerState extends State<BannerWidget> {
  var _currentPage = 0;
  var imageDatas = ["assets/images/banner01.jpg", "assets/images/banner02.jpg"];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Stack(
              children: [
                PageView.builder(
                    controller: PageController(),
                    itemCount: imageDatas.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        child: Image.asset(imageDatas[index], fit: BoxFit.cover,),
                      );
                    }
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 27),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 7),
                              child: CustomPaint(
                                painter: CirclePainter(_currentPage == 0 ? Colors.amber : Colors.green),
                              )
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 7),
                              child: CustomPaint(
                                painter: CirclePainter(_currentPage == 1 ? Colors.amber : Colors.green),
                              )
                          )
                        ],
                      )
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  Color _color;
  CirclePainter(this._color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
        ..style = PaintingStyle.fill
        ..color = _color
        ..strokeWidth = 2
        ..strokeCap = StrokeCap.round;
    canvas.drawArc(Rect.fromCircle(center: Offset(size.width/2, size.height/2), radius: 4), 0, 2*pi, false, paint);
  }

  @override
  bool shouldRepaint(covariant CirclePainter oldDelegate) {
    return _color != oldDelegate._color;
  }
}