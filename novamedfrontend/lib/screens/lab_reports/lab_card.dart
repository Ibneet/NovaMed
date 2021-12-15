import 'package:flutter/material.dart';

class LabCard extends StatelessWidget {
  final String name;
  final String imageUrl;

  final bool active;

  LabCard(this.name, this.imageUrl, this.active);

  @override
  Widget build(BuildContext context) {
    final double blur = active ? 80 : 0;
    final double offset = active ? 20 : 0;
    final double top = active ? 100 : 200;
    final double bottom = active ? 60 : 100;

    // final imageUrl = dummyUsers.singleWhere((user) {
    //   if (user.uid == withWhom) {
    //     return true;
    //   }
    //   return false;
    // });
    // final imageUrl =
    //     'https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';

    return AnimatedContainer(
      duration: Duration(
        milliseconds: 300,
      ),
      curve: Curves.easeInOutQuint,
      margin: EdgeInsets.only(
        top: top,
        bottom: bottom,
        right: 10,
        left: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey,
          width: 2.0,
        ),
        image: DecorationImage(
          image: NetworkImage(
            // imageUrl,
            imageUrl,
          ),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black87,
            blurRadius: blur,
            offset: Offset(offset, offset),
          ),
        ],
      ),
      child: active
          ? InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                margin: EdgeInsets.only(
                  top: top + 250,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Center(
                      child: Text(
                        '$name',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : SizedBox(),
    );
  }
}
