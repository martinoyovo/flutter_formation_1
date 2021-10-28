import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> with SingleTickerProviderStateMixin {
  AnimationController? _heartAnimationController;
  Animation? _heartAnimation;
  @override
  void initState() {
    _heartAnimationController = AnimationController(duration: Duration(seconds: 5), vsync: this);
    _heartAnimation = Tween(begin: 50.0, end: 170.0).animate(CurvedAnimation(
        curve: Curves.easeIn, parent: _heartAnimationController!));

    _heartAnimationController!.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _heartAnimationController!.reverse();
      }
      else {
        _heartAnimationController!.forward();
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Animations'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          secondChild(),
        ],
      ),
    );
  }

  Widget secondChild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: AnimatedBuilder(
            animation: Tween(begin: 150.0, end: 170.0).animate(CurvedAnimation(
                curve: Curves.bounceOut, parent: _heartAnimationController!)),
            builder: (context, child) {
              return Center(
                child: Container(
                  child: Center(
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: _heartAnimation!.value,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: OutlineButton(
              padding: const EdgeInsets.all(12.0),
              color: Colors.white,
              textColor: Colors.black,
              child: Text('Start Beating Heart Animation'),
              onPressed: () {
                _heartAnimationController!.forward();
              },
              splashColor: Colors.red,
            ),
          ),
        )
      ],
    );
  }
}
