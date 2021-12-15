import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/user.dart';
import '../../dummy_data.dart';
import '../utils.dart';
import './predict_disease_backend.dart';
import '../../models/http_exception.dart';

class PredictDiseaseScreen extends StatefulWidget {
  final User currentUser = dummyUsers.singleWhere((user) {
    return user.uid == 'u1';
  });
  @override
  _PredictDiseaseScreenState createState() => _PredictDiseaseScreenState();
}

class _PredictDiseaseScreenState extends State<PredictDiseaseScreen> {
  String dropdownValue1 = 'Symptom';
  String dropdownValue2 = 'Symptom';
  String dropdownValue3 = 'Symptom';
  String dropdownValue4 = 'Symptom';
  String dropdownValue5 = 'Symptom';

  var symptoms = [
    'Symptom',
    'back_pain',
    'constipation',
    'abdominal_pain',
    'diarrhoea',
    'mild_fever',
    'yellow_urine',
    'yellowing_of_eyes',
    'acute_liver_failure',
    'swelling_of_stomach',
    'swelled_lymph_nodes',
    'malaise',
    'blurred_and_distorted_vision',
    'phlegm',
    'throat_irritation',
    'redness_of_eyes',
    'sinus_pressure',
    'runny_nose',
    'congestion',
    'chest_pain',
    'weakness_in_limbs',
    'fast_heart_rate',
    'pain_during_bowel_movements',
    'pain_in_anal_region',
    'bloody_stool',
    'irritation_in_anus',
    'neck_pain',
    'dizziness',
    'cramps',
    'bruising',
    'obesity',
    'swollen_legs',
    'swollen_blood_vessels',
    'puffy_face_and_eyes',
    'enlarged_thyroid',
    'brittle_nails',
    'swollen_extremeties',
    'excessive_hunger',
    'extra_marital_contacts',
    'drying_and_tingling_lips',
    'slurred_speech',
    'knee_pain',
    'hip_joint_pain',
    'muscle_weakness',
    'stiff_neck',
    'swelling_joints',
    'movement_stiffness',
    'spinning_movements',
    'loss_of_balance',
    'unsteadiness',
    'weakness_of_one_body_side',
    'loss_of_smell',
    'bladder_discomfort',
    'foul_smell_of urine',
    'continuous_feel_of_urine',
    'passage_of_gases',
    'internal_itching',
    'toxic_look_(typhos)',
    'depression',
    'irritability',
    'muscle_pain',
    'altered_sensorium',
    'red_spots_over_body',
    'belly_pain',
    'abnormal_menstruation',
    'dischromic _patches',
    'watering_from_eyes',
    'increased_appetite',
    'polyuria',
    'family_history',
    'mucoid_sputum',
    'rusty_sputum',
    'lack_of_concentration',
    'visual_disturbances',
    'receiving_blood_transfusion',
    'receiving_unsterile_injections',
    'coma',
    'stomach_bleeding',
    'distention_of_abdomen',
    'history_of_alcohol_consumption',
    'fluid_overload',
    'blood_in_sputum',
    'prominent_veins_on_calf',
    'palpitations',
    'painful_walking',
    'pus_filled_pimples',
    'blackheads',
    'scurring',
    'skin_peeling',
    'silver_like_dusting',
    'small_dents_in_nails',
    'inflammatory_nails',
    'blister',
    'red_sore_around_nose',
    'loss_of_taste',
    'yellow_crust_ooze'
  ];

  void _selectValue1(String newValue) {
    setState(() {
      dropdownValue1 = newValue;
    });
  }

  void _selectValue2(String newValue) {
    setState(() {
      dropdownValue2 = newValue;
    });
  }

  void _selectValue3(String newValue) {
    setState(() {
      dropdownValue3 = newValue;
    });
  }

  void _selectValue4(String newValue) {
    setState(() {
      dropdownValue4 = newValue;
    });
  }

  void _selectValue5(String newValue) {
    setState(() {
      dropdownValue5 = newValue;
    });
  }

  void _showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('An Error Occurred!'),
              content: Text(message),
              actions: <Widget>[
                FlatButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                )
              ],
            ));
  }

  var _isLoading = false;

  Future<void> _dt() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await dt(dropdownValue1, dropdownValue2, dropdownValue3, dropdownValue4,
          dropdownValue5);
    } on HttpException catch (err) {
      final errMess = err.toString();
      _showErrorDialog(errMess);
    } catch (err) {
      const errMess = 'Could not predict disease, please try again later.';
      _showErrorDialog(errMess);
    }
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _rf() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await rf(dropdownValue1, dropdownValue2, dropdownValue3, dropdownValue4,
          dropdownValue5);
    } on HttpException catch (err) {
      final errMess = err.toString();
      _showErrorDialog(errMess);
    } catch (err) {
      const errMess = 'Could not predict disease, please try again later.';
      _showErrorDialog(errMess);
    }
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _nb() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await nb(dropdownValue1, dropdownValue2, dropdownValue3, dropdownValue4,
          dropdownValue5);
    } on HttpException catch (err) {
      final errMess = err.toString();
      _showErrorDialog(errMess);
    } catch (err) {
      const errMess = 'Could not predict disease, please try again later.';
      _showErrorDialog(errMess);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var appHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
      Stack(alignment: AlignmentDirectional.topCenter, children: <Widget>[
        _buildTopStack(appHeight, context),
        Container(
            height: appHeight * 0.8,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                DropdownButton<String>(
                  value: dropdownValue1,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String newValue) {
                    _selectValue1(newValue);
                  },
                  items: symptoms.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                DropdownButton<String>(
                  value: dropdownValue2,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String newValue) {
                    _selectValue2(newValue);
                  },
                  items: symptoms.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                DropdownButton<String>(
                  value: dropdownValue3,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String newValue) {
                    _selectValue3(newValue);
                  },
                  items: symptoms.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                DropdownButton<String>(
                  value: dropdownValue4,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String newValue) {
                    _selectValue4(newValue);
                  },
                  items: symptoms.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                DropdownButton<String>(
                  value: dropdownValue5,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String newValue) {
                    _selectValue5(newValue);
                  },
                  items: symptoms.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                            width: 100,
                            child: Text(
                              '$disease1',
                              overflow: TextOverflow.fade,
                              maxLines: 2,
                              softWrap: true,
                            )),
                        RaisedButton(
                            child:
                                Text("Predict", style: TextStyle(fontSize: 20)),
                            onPressed: _dt),
                        SizedBox(
                            width: 100,
                            child: Text('$speacialist1',
                                overflow: TextOverflow.fade,
                                maxLines: 2,
                                softWrap: true))
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        SizedBox(
                            width: 100,
                            child: Text('$disease2',
                                overflow: TextOverflow.fade,
                                maxLines: 2,
                                softWrap: true)),
                        RaisedButton(
                            child:
                                Text("Predict", style: TextStyle(fontSize: 20)),
                            onPressed: _rf),
                        SizedBox(
                            width: 100,
                            child: Text('$speacialist2',
                                overflow: TextOverflow.fade,
                                maxLines: 2,
                                softWrap: true))
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text('$disease3',
                              overflow: TextOverflow.fade,
                              maxLines: 2,
                              softWrap: true),
                        ),
                        RaisedButton(
                            child:
                                Text("Predict", style: TextStyle(fontSize: 20)),
                            onPressed: _nb),
                        SizedBox(
                            width: 100,
                            child: Text('$speacialist3',
                                overflow: TextOverflow.fade,
                                maxLines: 2,
                                softWrap: true))
                      ],
                    )
                  ],
                )
              ],
            )))
      ])
    ])));
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
          'Predict Disease',
          style: TextStyle(
              fontSize: 32, color: Colors.white, fontFamily: 'Lobster'),
        ),
      ],
    ),
  );
}
