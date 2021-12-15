import 'package:flutter/material.dart';

import './moods.dart';
import '../utils.dart';
import '../../models/user.dart';
import '../../dummy_data.dart';

class HomeScreen extends StatelessWidget {
  final User currentUser = dummyUsers.singleWhere((user) {
    return user.uid == 'u1';
  });
  final User doctor = dummyUsers.singleWhere((user) {
    return user.uid == 'u2';
  });
  @override
  Widget build(BuildContext context) {
    var appHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: mainBgColor,
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _buildTopStack(appHeight, context),
          SizedBox(
            height: appHeight * 0.07,
          ),
          _buildRecentVisits(context),
          _buildRecentVisitsInfo(),
        ],
      )),
    );
  }

  Stack _buildTopStack(double appHeight, BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      overflow: Overflow.visible,
      children: <Widget>[
        _buildBackgroundCover(appHeight),
        _buildGreeting(appHeight),
        _buidMoodsHolder(appHeight, context),
      ],
    );
  }

  _buildBackgroundCover(double appHeight) {
    return Container(
      height: appHeight * 0.3,
      decoration: BoxDecoration(
          gradient: purpleGradient,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40))),
    );
  }

  _buildGreeting(double appHeight) {
    return Positioned(
      left: 20.0,
      bottom: 60,
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(
              'assets/images/isha.jpeg',
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Hi Ibneet!',
                style: TextStyle(
                    fontSize: 36, color: Colors.white, fontFamily: 'Lobster'),
              ),
              SizedBox(
                height: appHeight * 0.01,
              ),
              Text(
                'How are you feeling today?',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'GentiumBookBasic'),
              )
            ],
          ),
        ],
      ),
    );
  }

  _buidMoodsHolder(double appHeight, ctx) {
    return Positioned(
        bottom: -45,
        child: Container(
          height: appHeight * 0.12,
          width: MediaQuery.of(ctx).size.width - 40,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(28)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, spreadRadius: 5.5, blurRadius: 5.5)
              ]),
          child: MyMoods(),
        ));
  }

  _buildRecentVisits(ctx) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
      alignment: Alignment.topLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Your recent visits.',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
          ),
          FlatButton(
            onPressed: () {},
            child: Text(
              'See All',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.pink[900]),
            ),
          )
        ],
      ),
    );
  }

  _buildRecentVisitsInfo() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 14.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(18)),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(
                  doctor.imageUrl,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              RichText(
                text: TextSpan(
                    text: 'Dr. Sharma',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                        color: Colors.black),
                    children: [
                      TextSpan(
                          text:
                              '\nSunday, May 21st at 10 am\nColumbia Asia\nPatiala, Punjab',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              // height: 1.5,
                              color: Colors.black45))
                    ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
