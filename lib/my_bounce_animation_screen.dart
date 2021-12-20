import 'package:flutter/material.dart';

class MyBounceAnimationScreen extends StatefulWidget {
  @override
  _MyBounceAnimationScreenState createState() => _MyBounceAnimationScreenState();
}

class _MyBounceAnimationScreenState extends State<MyBounceAnimationScreen> with SingleTickerProviderStateMixin {

  AnimationController animationController;
  double scale;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 300,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    scale = 1 - animationController.value;
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Bounce Button Animation Sample"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: GestureDetector(
              onTapUp: (TapUpDetails tapUPDetails){
                animationController.reverse();
              },
              onTapDown: (TapDownDetails tapDownDetails){
                animationController.forward();
              },
              child: Transform.scale(
                scale: scale,
                child: bounceButtonAnimationWidget(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bounceButtonAnimationWidget() {
    return Container(
      width: 300,
      height: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          boxShadow: [
            BoxShadow(
              color: Color(0x80000000),
              blurRadius: 10,
              offset: Offset(0,5),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.orangeAccent,
              Colors.pinkAccent,
            ],
          )),
      child: Center(
        child: Text(
          'Bounce Animation',
          style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}