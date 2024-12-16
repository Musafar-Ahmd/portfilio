import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/project_model.dart';

class ProjectsViewModel extends ChangeNotifier {
  List<Projects>? projects;


  Future<dynamic> loadJson() async {
    final String jsonString =
    await rootBundle.loadString("assets/local_config/profile.json");
    dynamic jsonData = json.decode(jsonString);
    if (jsonData is List) {
      projects =
          jsonData.map((item) => Projects.fromJson(item)).toList();
    } else {
      projects = [];
    }
    notifyListeners();
  }
}