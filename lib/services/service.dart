import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/cat.dart';

class Service {
    static Future<List<Cat>> fetch() async {
        final response = await http.get(
            "https://api.thecatapi.com/v1/images/search?limit=100&page=10&order=Desc", 
            headers: { "x-api-key" : "90f3986b-f393-4657-acc4-1f3f18d83c44" }
        );

        if (response.statusCode == 200) {
            List<Cat> cats = [];
            for (var catJson in json.decode(response.body)) {
                cats.add(Cat.fromJson(catJson));
            }
            return cats;
        } else {
            throw Exception("failed");
        }
    }
}