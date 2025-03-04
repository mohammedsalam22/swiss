import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lottie Animation Example'),
      ),
      body: Center(
        child: Lottie.asset('assets/animations/Animation - warehouse.json'),
      ),
    );
  }
}

