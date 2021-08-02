import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:yoro_task/model/message_model.dart';

class MessageRepo{

Future readMessageJson() async {
  final String response = await rootBundle.loadString('assets/data.json');
  final data = await json.decode(response);
  return MessageModel.fromJson(data);
}

}