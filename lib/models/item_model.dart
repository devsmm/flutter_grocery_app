import 'package:flutter/material.dart';

class ItemModel {
  String? key, name, price, image;
  ItemModel({this.key, this.name, this.image, this.price});
  ItemModel.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    price = json['price'];
    name = json['name'];
    image = json['image'];
  }
  Map<String, dynamic>? toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = key;
    data['name'] = name;
    data['price'] = price;
    data['image'] = image;
  }
}
