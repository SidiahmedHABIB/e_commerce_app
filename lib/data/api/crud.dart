import 'dart:convert';
import 'package:e_commerce_app/data/api/status_request.dart';
import 'package:e_commerce_app/utils/check_internet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future postRequest(String url, Map data) async {
    try {
      // if (await CheckInternet()) {
      var response = await http.post(Uri.parse(url), body: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        print("Error : ${response.statusCode}");
      }
      // } else {
      //   return print(StatusRequest.offlinefailure);
      // }
    } catch (e) {
      print("catch Error : $e");
    }
  }
}
