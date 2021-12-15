import 'package:flutter/material.dart';

class BackCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black87,
            blurRadius: 30,
            // offset: Offset(offset, offset),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 85,
            backgroundColor: Theme.of(context).accentColor,
            child: CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(
                'https://www.thehealthy.com/wp-content/uploads/2017/09/02_doctor_Insider-Tips-to-Choosing-the-Best-Primary-Care-Doctor_519507367_Stokkete.jpg',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: RichText(
              text: TextSpan(
                  text: 'Dr. Sharma',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                      color: Colors.black),
                  children: [
                    TextSpan(
                        text:
                            '\nSunday, May 21st at 10 am 93 Columbia Asia,Patiala, Punjab',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            // height: 1.5,
                            color: Colors.black87))
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
