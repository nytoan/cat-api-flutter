import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/cat.dart';

class Service {
    static Service shared = Service();

    int page = 1;
    int limit = 18;
    int more = 9;

    List<Cat> cats = [];

    bool canLoadMore = false;

    Future<List<Cat>> fetch() async {
        final response = await http.get(
            "https://api.thecatapi.com/v1/images/search?limit=${this.limit}&page=0&order=Desc", 
            headers: { "x-api-key" : "90f3986b-f393-4657-acc4-1f3f18d83c44" }
        );
        parseResponse(response);
        canLoadMore = true;
        return cats;
    }

    Future<List<Cat>> _fetchMore() async {
        final response = await http.get(
            "https://api.thecatapi.com/v1/images/search?limit=${this.more}&page=${this.page}&order=Desc", 
            headers: { "x-api-key" : "90f3986b-f393-4657-acc4-1f3f18d83c44" }
        );
        parseResponse(response);
        canLoadMore = true;
        return cats;
    }

    fetchMore() {
        if (!canLoadMore) {
            return;
        }
        canLoadMore = false;
        page += 1;
        return _fetchMore();
    }

    parseResponse(response) {
        if (response.statusCode == 200) {
            for (var catJson in json.decode(response.body)) {
                cats.add(Cat.fromJson(catJson));
            }
        }
    }

}