import 'package:flutter/material.dart';

class TaskItem{
  final String priority;
  final String title;
  final String description;
  final Color color;
  final String date;

  TaskItem({
    required this.priority,
    required this.title,
    required this.description,
    required this.color,
    required this.date
  });
}