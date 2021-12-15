import 'package:flutter/material.dart';

var prescription = [
  'Stimulants',
  'Depressants',
  'Others',
  'Narcotics',
  'Steroids',
  'Hallucinogens',
  'References',
  'Stimulants',
  'Depressants',
  'Others',
  'Narcotics',
  'Steroids',
  'Hallucinogens',
  'References',
];

class FrontCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.pink[50],
        boxShadow: [
          BoxShadow(
            color: Colors.black87,
            blurRadius: 30,
            // offset: Offset(offset, offset),
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          Container(
            // color: Colors.blueAccent,
            margin: EdgeInsets.only(
              left: 300,
            ),
            width: 20,
            height: 10,
            child: Icon(
              Icons.play_arrow,
              color: Colors.purple[400],
              size: 50,
            ),
          ),
          Container(
            height: 80,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.fromLTRB(
              50,
              5,
              50,
              0,
            ),
            child: Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Prescriptions',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'GentiumBookBasic',
                      height: 1.5,
                      color: Colors.black),
                  children: [
                    TextSpan(
                      text: '\n Corona',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'GentiumBookBasic',
                          color: Colors.black87),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 100,
              bottom: 20,
              left: 20,
              right: 20,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).accentColor,
                width: 5.0,
              ),
              borderRadius: BorderRadius.circular(
                20,
              ),
              // border: Border(color:),
              color: Colors.white,
            ),
            child: ListView.builder(
              itemCount: prescription.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.fromLTRB(
                    50,
                    5,
                    50,
                    0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black12,
                  ),
                  child: Center(
                    child: Text(
                      prescription[index],
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          // height: 1.5,
                          color: Colors.black54),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
