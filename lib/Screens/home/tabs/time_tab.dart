import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/time_Background.png")
              ,fit: BoxFit.fill)

      ),
    );
  }
}
