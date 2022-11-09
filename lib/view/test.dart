import 'dart:async';
import 'dart:convert';

import 'package:e_commerce_app/constant/app_constants.dart';
import 'package:e_commerce_app/controllers/categories_controller.dart';
import 'package:e_commerce_app/widgets/big_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../data/api/crud.dart';

// class CategoriesRepo {
//   final Crud crud;
//   CategoriesRepo({required this.crud});

//   Future<CategoriesModel> getCategories() async {
//     var response = await crud.getRequest(AppConstants.CATEGORIES_URI);
//     return response;
//   }
// }

// Future<CategoriesModel> fetchAlbum() async {
//   final response = await http.get(Uri.parse(AppConstants.CATEGORIES_URI));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return CategoriesModel.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }

// class CategoriesModel {
//   int? categoriesId;
//   String? categoriesName;
//   String? categoriesImage;
//   String? categoriesDatetime;

//   CategoriesModel(
//       {this.categoriesId,
//       this.categoriesName,
//       this.categoriesImage,
//       this.categoriesDatetime});

//   CategoriesModel.fromJson(Map<String, dynamic> json) {
//     categoriesId = json['categories_id'];
//     categoriesName = json['categories_name'];
//     categoriesImage = json['categories_image'];
//     categoriesDatetime = json['categories_datetime'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['categories_id'] = this.categoriesId;
//     data['categories_name'] = this.categoriesName;
//     data['categories_image'] = this.categoriesImage;
//     data['categories_datetime'] = this.categoriesDatetime;
//     return data;
//   }
// }

class TestApp extends StatefulWidget {
  const TestApp({super.key});

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  // late Future<CategoriesModel> futureAlbum;
  final _contrllerC = Get.find<CategoriesController>();
  @override
  void initState() {
    super.initState();
    // futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: Center(
          child: BigTextWidget(
        text: "kdkd",
        // text: _contrllerC.categoriesList.length.toString(),
        // child: FutureBuilder<CategoriesModel>(
        //   future: futureAlbum,
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
        //       return Text(snapshot.data!.categoriesName.toString());
        //     } else if (snapshot.hasError) {
        //       return Text('${snapshot.error}');
        //     }

        //     // By default, show a loading spinner.
        //     return const CircularProgressIndicator();
        //   },
        // ),
      )),
    );
  }
}
