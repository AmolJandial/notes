import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/common/database_constants.dart';

import '../model/category/category_entity.dart';

class DatabaseService{


  DatabaseService(){
    print('database service constructor');
  }



  Future<List<CategoryEntity>> getAllCategories() async{
    final categoryBox = await Hive.openBox<CategoryEntity>(DatabaseConstants.categoriesBox);
    if(categoryBox.isEmpty){
      await addCategory(CategoryEntity(title: DatabaseConstants.categoryAllNotes, colorCode: Colors.grey.value, iconCode: FontAwesomeIcons.book.codePoint, notesCount: 0));
      await addCategory(CategoryEntity(title: DatabaseConstants.categoryFavorites, colorCode: Colors.grey.value, iconCode: FontAwesomeIcons.star.codePoint, notesCount: 0));
      await addCategory(CategoryEntity(title: DatabaseConstants.categoryRecycleBin, colorCode: Colors.grey.value, iconCode: FontAwesomeIcons.trash.codePoint, notesCount: 0));
      await addCategory(CategoryEntity(title: DatabaseConstants.categoryUncategorized, colorCode: Colors.grey.value, iconCode: FontAwesomeIcons.circleDot.codePoint, notesCount: 0));
      return getAllCategories();
    }
    final category = categoryBox.values.toList();
    await categoryBox.close();
    return category;
  }

  Future<void> addCategory(CategoryEntity categoryEntity) async{
    final categoryBox = await Hive.openBox<CategoryEntity>(DatabaseConstants.categoriesBox);
    await categoryBox.put(categoryEntity.title, categoryEntity);
    await categoryBox.close();
  }

}