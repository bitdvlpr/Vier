// To parse this JSON data, do
//
//     final todo = todoFromJson(jsonString);

import 'dart:convert';

class Todo {
  int id;
  String title;
  String details;
  String category;

  Todo({
    this.id,
    this.title,
    this.details,
    this.category,
  });


  factory Todo.fromMap(Map<String, dynamic> map) => new Todo(
    id: map["id"],
    title: map["title"],
    details: map["details"],
    category: map["categories"],
  );

  Map<String, dynamic> toMap() => {
    "title": title,
    "details": details,
    "categories": category,
  };
}
