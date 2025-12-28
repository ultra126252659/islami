import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/radio_Background.png"),
          fit: BoxFit.fill)

      ),
    );
  }
}
