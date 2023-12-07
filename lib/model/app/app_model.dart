import 'package:flutter/material.dart';

import '../category/category_entity.dart';

class AppModel extends ChangeNotifier{
  late List<CategoryEntity> _categories;
  List<CategoryEntity> get categories => _categories;
  set categories(List<CategoryEntity> newCategories){
    _categories = newCategories;
    notifyListeners();
  }


}