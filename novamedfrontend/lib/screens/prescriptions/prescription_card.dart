import 'package:flutter/material.dart';

class PrescriptionCard extends StatelessWidget {
  final String name;
  final String imageUrl;

  PrescriptionCard(this.name, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[400],
                blurRadius: 30,
                offset: Offset(1, 10),
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Image.network(
                imageUrl,
                height: 125,
                width: 125,
                fit: BoxFit.cover,
              ),
              Container(
                margin: EdgeInsets.only(top: 120),
                child: Text(
                  name.toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'GentiumBookBasic',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
