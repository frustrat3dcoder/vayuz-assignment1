import 'dart:convert';
import 'dart:io';

import 'package:demo_app/image_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://dog.ceo/api/breeds/image/random';

  Future getHttp(BuildContext context) async {
    try {
      var res = await http
          .get(Uri.parse(baseUrl), headers: {"Accept": "application/json"});
      var responsBody = json.decode(res.body);
      if (res.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ImageDisplayScreen(
                  imageUrl: responsBody["message"].toString())),
        );
      } else if (res.statusCode == 405) {
        var snackBar = const SnackBar(
            content: Text("Something went wrong please try again"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } on SocketException {
      var snackBar = const SnackBar(content: Text("No Internet connection"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } on HttpException {
      var snackBar = const SnackBar(content: Text("Couldn't find the post"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } on FormatException {
      var snackBar = const SnackBar(content: Text("Bad response format"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
