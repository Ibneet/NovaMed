import 'package:flutter/material.dart';

import 'package:flip_card/flip_card.dart';

import '../prescriptions/front_card.dart';
import '../prescriptions/back_card.dart';

class PrescriptionFlipCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      margin: EdgeInsets.all(20),
      // padding: EdgeInsets.all(20),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: FrontCard(),
        back: BackCard(),
      ),
    );
  }
}
