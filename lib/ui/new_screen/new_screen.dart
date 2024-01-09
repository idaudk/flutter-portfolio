import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return TweenAnimationBuilder(
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.fastOutSlowIn,
                  tween:
                      Tween<Offset>(begin: Offset(-100, 0), end: Offset(0, 0)),
                  builder: (context, value, child) {
                    return Transform.translate(
                      offset: value,
                      child: child,
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    height: 100,
                    width: 100,
                    padding: EdgeInsets.all(8),
                    color: Colors.red,
                    child: Text('animation here'),
                  ),
                );
              })
        ],
      ),
    );
  }
}
