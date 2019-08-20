import 'package:flutter/material.dart';

// ignore: one_member_abstracts
abstract class ApiRepository {
  Future<Object> fetchData(BuildContext mContext,String url, Map<String, Object> map, int index);
}
