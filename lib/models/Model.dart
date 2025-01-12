import 'dart:convert' as convert;
import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;

final Dio _dio = Dio();
Future<List<Data>> getnuz(String categori) async {
  try {
    final response =
        await _dio.get(('https://inshorts.deta.dev/news?category=${categori}'));
    var pdata = response.data['data'] as List;
    return pdata.map((m) => Data.fromJson(m)).toList();
  } catch (e) {
    throw Exception();
  }
}

class Nuzz {
  String? category;
  List<Data>? data;
  bool? success;

  Nuzz({this.category, this.data, this.success});

  Nuzz.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }
}

class Data {
  String? author;
  String? content;
  String? date;
  String? imageUrl;
  String? readMoreUrl;
  String? time;
  String? title;
  String? url;

  Data(
      {this.author,
      this.content,
      this.date,
      this.imageUrl,
      this.readMoreUrl,
      this.time,
      this.title,
      this.url});

  Data.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    content = json['content'];
    date = json['date'];
    imageUrl = json['imageUrl'];
    readMoreUrl = json['readMoreUrl'];
    time = json['time'];
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['content'] = this.content;
    data['date'] = this.date;
    data['imageUrl'] = this.imageUrl;
    data['readMoreUrl'] = this.readMoreUrl;
    data['time'] = this.time;
    data['title'] = this.title;
    data['url'] = this.url;
    return data;
  }
}
