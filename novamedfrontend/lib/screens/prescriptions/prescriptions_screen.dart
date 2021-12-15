import 'package:flutter/material.dart';

import '../utils.dart';

import '../prescriptions/prescription_card.dart';
import '../prescriptions/prescription_flip_card.dart';

var docs = [
  {
    'name': 'Corona Virus',
    'url':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSmD1TcAB64G_9bEmyvtBgXdfiGqd9lfo4Kh_HfLjsDqXCfqVlp&usqp=CAU',
  },
  {
    'name': 'Dengue',
    'url':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSmD1TcAB64G_9bEmyvtBgXdfiGqd9lfo4Kh_HfLjsDqXCfqVlp&usqp=CAU',
  },
  {
    'name': 'Diabetes',
    'url':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSmD1TcAB64G_9bEmyvtBgXdfiGqd9lfo4Kh_HfLjsDqXCfqVlp&usqp=CAU',
  },
  {
    'name': 'Blood Pressure',
    'url':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSmD1TcAB64G_9bEmyvtBgXdfiGqd9lfo4Kh_HfLjsDqXCfqVlp&usqp=CAU',
  },
  {
    'name': 'Malaria',
    'url':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSmD1TcAB64G_9bEmyvtBgXdfiGqd9lfo4Kh_HfLjsDqXCfqVlp&usqp=CAU',
  },
];

class PrescriptionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: <Widget>[
                _buildTopStack(appHeight, context),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: appHeight * 0.1,
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      height: appHeight * 0.08,
                      width: MediaQuery.of(context).size.width - 40,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(28)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 5.5,
                                blurRadius: 5.5)
                          ]),
                      child: Center(
                        child: Text(
                          'Your Current Diseases',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'GentiumBookBasic',
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  return PrescriptionCard(
                      docs[index]['name'], docs[index]['url']);
                },
              ),
            ),
            PrescriptionFlipCard(),
          ],
        ),
      ),
    );
  }

  Stack _buildTopStack(double appHeight, BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      overflow: Overflow.visible,
      children: <Widget>[
        _buildBackgroundCover(appHeight),
        _buildTitle(appHeight),
      ],
    );
  }

  _buildBackgroundCover(double appHeight) {
    return Container(
      height: appHeight * 0.13,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: purpleGradient,
      ),
    );
  }

  _buildTitle(double appHeight) {
    return Positioned(
      left: 20.0,
      top: 30,
      child: Row(
        children: <Widget>[
          Text(
            'Prescriptions',
            style: TextStyle(
                fontSize: 32, color: Colors.white, fontFamily: 'Lobster'),
          ),
        ],
      ),
    );
  }
}
