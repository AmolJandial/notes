import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../model/category/category_entity.dart';

class DatabaseConstants{
  static const categoriesBox = 'categoryBox';
  static const notesBox = 'notesBox';
  static const categoryAllNotes = 'All notes';
  static const categoryFavorites = 'Favorites';
  static const categoryRecycleBin = 'Recycle bin';
  static const categoryUncategorized = 'Uncategorized';

  static final defaultCategories = [
    CategoryEntity(title: categoryAllNotes, colorCode: Colors.grey.value, iconCode: FontAwesomeIcons.book.codePoint, notesCount: 0),
    CategoryEntity(title: categoryFavorites, colorCode: Colors.grey.value, iconCode: FontAwesomeIcons.star.codePoint, notesCount: 0),
    CategoryEntity(title: categoryRecycleBin, colorCode: Colors.grey.value, iconCode: FontAwesomeIcons.trash.codePoint, notesCount: 0),
    CategoryEntity(title: categoryUncategorized, colorCode: Colors.grey.value, iconCode: FontAwesomeIcons.circleDot.codePoint, notesCount: 0),
  ];
}