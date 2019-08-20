import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_getdrool/preference.dart';

import 'SignInPage.dart';
import 'apiRepository.dart';
import 'package:http/http.dart' as http;

import 'exception_class.dart';

class ProdApiRepository implements ApiRepository {
  @override
  Future<Map<String, Object>> fetchData(BuildContext mContext, String url,
      Map<String, Object> map, int index) async {
    print(map);
    http.Response response = await http.post(
      // Encode URl
      Uri.encodeFull(url),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode(map),
    );
    print("response -- " + response.body);
    final Map<String, Object> responseBody = json.decode(response.body);
    final statusCode = response.statusCode;
    if (statusCode != 200 || responseBody == null) {
      throw FetchDataException(
          "An error ocurred : [Status Code : $statusCode]");
    }

    if (responseBody['message'] == "Invalid Token") {
      await PreferenceManager().remove();
      Route route = MaterialPageRoute(builder: (context) => SignInPage());
      await Navigator.pushAndRemoveUntil(
          mContext, route, (Route<dynamic> route) => false);
    }

    return responseBody;
  }
}
