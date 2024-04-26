import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../Model/BusinessesModel.dart';


class BusinessViewModel extends ChangeNotifier {


  TextEditingController search = TextEditingController();
  List<Business> businessesList = <Business>[];



  Future<void> sendGetRequest({String? data}) async {
    Response response = await http.get(Uri.parse("https://api.yelp.com/v3/businesses/search?location=${data.toString()}",),
        headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer bza6Hp9uiEWv2F86OSEycfB9Sc7-7G9FfMZ1JgtQM3cqSpEnG6CsF_IzpEmouNAdfiXcvmL4DSbMqbsp6jmWpyKJ-DG7-FzN3hfqXxjvQ_jfgvZQWXr5yN9pdIrjZXYx",
        },
    );

    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);

      // var businesses = responseBody['businesses'];
      BusinessesModel business = BusinessesModel.fromJson(responseBody);
      businessesList = business.businesses!;
      notifyListeners();


    } else {
      businessesList.clear();
      notifyListeners();

    }
  }



}