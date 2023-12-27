import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/common/database_constants.dart';
import 'package:notes/model/note/note_entity.dart';

import '../model/category/category_entity.dart';

class DatabaseService{


  Future<List<CategoryEntity>> getAllCategories() async{
    final categoryBox = Hive.box<CategoryEntity>(DatabaseConstants.categoriesBox);
    if(categoryBox.isEmpty){
      await addCategory(DatabaseConstants.defaultCategories[0]);
      await addCategory(DatabaseConstants.defaultCategories[1]);
      await addCategory(DatabaseConstants.defaultCategories[2]);
      await addCategory(DatabaseConstants.defaultCategories[3]);
      return getAllCategories();
    }
    final category = categoryBox.values.toList();
    return category;
  }

  Future<List<NoteEntity>> getNotesByCategory(String categoryTitle) async{
    final notesBox = Hive.box<NoteEntity>(DatabaseConstants.notesBox);
    final List<NoteEntity> notes = notesBox.values.toList();
    return notes;
  }

  Future<CategoryEntity> getCategory(String categoryTitle) async{
    final categoryBox = Hive.box<CategoryEntity>(DatabaseConstants.categoriesBox);
    final category = categoryBox.get(categoryTitle);
    return category!;
  }

  Future<void> addCategory(CategoryEntity categoryEntity) async{
    final categoryBox = Hive.box<CategoryEntity>(DatabaseConstants.categoriesBox);
    await categoryBox.put(categoryEntity.title, categoryEntity);
  }

  Future<void> addNote(NoteEntity noteEntity) async{
    final notesBox = Hive.box<NoteEntity>(DatabaseConstants.notesBox);
    await notesBox.put(noteEntity.id, noteEntity);
  }

  Future<int> getNoteId(String parentCategory) async{
    final List<NoteEntity> notes = await getNotesByCategory(parentCategory);
    return notes.length;
  }

}