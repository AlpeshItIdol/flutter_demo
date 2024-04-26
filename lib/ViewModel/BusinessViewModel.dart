import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../Model/BusinessesModel.dart';


class BusinessViewModel extends GetxController {


  TextEditingController search = TextEditingController();
  RxList<Business> businessesList = <Business>[].obs;



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
      businessesList.value = business.businesses!;
      update();


    } else {
      businessesList.clear();
      update();
    }
  }



}