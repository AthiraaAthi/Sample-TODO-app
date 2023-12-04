import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
part 'note_model.g.dart';

@HiveType(typeId: 1)
class NoteModel {
  NoteModel(
      {required this.title,
      required this.date,
      required this.description,
      required this.color});
  @HiveField(1)
  String title;
  @HiveField(2)
  String date;
  @HiveField(3)
  String description;
  @HiveField(4)
  int color;
}
