import 'package:flutter/material.dart';

import '../lab_reports/lab_card.dart';
import '../utils.dart';

var reports = [
  {
    'name': 'Sardhana lab',
    'url':
        'https://cdn.jotfor.ms/form-templates/screenshots/pdf/425x575_2091181867095062/medical-invoice-template.png',
  },
  {
    'name': 'Sardhana lab',
    'url':
        'https://cdn.jotfor.ms/form-templates/screenshots/pdf/425x575_2091181867095062/medical-invoice-template.png',
  },
  {
    'name': 'Sardhana lab',
    'url':
        'https://cdn.jotfor.ms/form-templates/screenshots/pdf/425x575_2091181867095062/medical-invoice-template.png',
  },
  {
    'name': 'Sardhana lab',
    'url':
        'https://cdn.jotfor.ms/form-templates/screenshots/pdf/425x575_2091181867095062/medical-invoice-template.png',
  },
];

class LabReportsScreen extends StatefulWidget {
  @override
  _LabReportsScreenState createState() => _LabReportsScreenState();
}

class _LabReportsScreenState extends State<LabReportsScreen> {
  final PageController _controller = PageController(
    viewportFraction: 0.8,
  );
  int _currentPage = 0;
  void initState() {
    _controller.addListener(() {
      int next = _controller.page.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var appHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _buildTopStack(appHeight, context),
            Container(
              height: appHeight * 0.8,
              child: (reports.length == 0)
                  ? Center(
                      child: Text('No Lab Reports yet!'),
                    )
                  : PageView.builder(
                      itemBuilder: (context, index) {
                        bool active = index == _currentPage;

                        return LabCard(reports[index]['name'],
                            reports[index]['url'], active);
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: reports.length,
                      controller: _controller,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

Stack _buildTopStack(double appHeight, BuildContext context) {
  return Stack(
    clipBehavior: Clip.none,
    alignment: AlignmentDirectional.topCenter,
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
          'Lab Reports',
          style: TextStyle(
              fontSize: 32, color: Colors.white, fontFamily: 'Lobster'),
        ),
      ],
    ),
  );
}
