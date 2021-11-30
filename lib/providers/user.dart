import 'dart:convert';
import 'dart:developer';

import 'package:gituser/models/result.dart';
import 'package:gituser/models/user.dart';
import 'package:http/http.dart' as http;

class user {
  static Future<List<GitUser>> getResult(String name) async {
    final url = Uri.parse(
      'https://api.github.com/search/users?q=$name&page=1'
    );
    final response = await http.get(url);

    if(response.statusCode == 200){
      final users = json.decode(response.body);
      List<GitUser> items = [];
      for(var i in Result.fromJson(users).items){
        items.add(i);
      }
      // log("postman ${Result.fromJson(users).items}");
      return items;
    }else{
      throw Exception();
    }
  }
}