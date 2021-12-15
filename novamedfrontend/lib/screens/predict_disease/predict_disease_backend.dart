import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

String disease1;
String disease2;
String disease3;

String speacialist1;
String speacialist2;
String speacialist3;

Future<void> dt(
    String sym1, String sym2, String sym3, String sym4, String sym5) async {
  var url = Uri.parse('http://10.0.2.2:5000/predict_disease/dt');
  try {
    print("1");
    final response = await http.post(url,
        headers: {
          "accept": "application/json",
          'Content-Type': 'application/json'
        },
        body: json.encode({
          "sym1": sym1,
          "sym2": sym2,
          "sym3": sym3,
          "sym4": sym4,
          "sym5": sym5
        }));
    print("2");
    final responseData = json.decode(response.body);
    if (responseData['message'] != null) {
      throw HttpException(responseData['message']);
    }
    print(responseData);
    disease1 = responseData["json"]["dt"];
    speacialist1 = responseData["json"]["sp1"];
    print(disease1);
  } catch (err) {
    throw err;
  }
}

Future<void> rf(
    String sym1, String sym2, String sym3, String sym4, String sym5) async {
  var url = Uri.parse('http://10.0.2.2:5000/predict_disease/rf');
  try {
    print("1");
    final response = await http.post(url,
        headers: {
          "accept": "application/json",
          'Content-Type': 'application/json'
        },
        body: json.encode({
          "sym1": sym1,
          "sym2": sym2,
          "sym3": sym3,
          "sym4": sym4,
          "sym5": sym5
        }));
    print("2");
    final responseData = json.decode(response.body);
    if (responseData['message'] != null) {
      throw HttpException(responseData['message']);
    }
    print(responseData);
    disease2 = responseData["json"]["rf"];
    speacialist2 = responseData["json"]["sp2"];
  } catch (err) {
    throw err;
  }
}

Future<void> nb(
    String sym1, String sym2, String sym3, String sym4, String sym5) async {
  var url = Uri.parse('http://10.0.2.2:5000/predict_disease/nb');
  try {
    print("1");
    final response = await http.post(url,
        headers: {
          "accept": "application/json",
          'Content-Type': 'application/json'
        },
        body: json.encode({
          "sym1": sym1,
          "sym2": sym2,
          "sym3": sym3,
          "sym4": sym4,
          "sym5": sym5
        }));
    print("2");
    final responseData = json.decode(response.body);
    if (responseData['message'] != null) {
      throw HttpException(responseData['message']);
    }
    print(responseData);
    disease3 = responseData["json"]["nb"];
    speacialist3 = responseData["json"]["sp3"];
    print(disease3);
  } catch (err) {
    throw err;
  }
}
