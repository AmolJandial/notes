import 'package:flutter/material.dart';
import 'package:notes/model/app/app_model.dart';
import 'package:notes/model/category/category_model.dart';
import 'package:notes/model/note/note_model.dart';
import 'package:notes/services/database_service.dart';
import 'package:provider/provider.dart';

late BuildContext _context;

void init(BuildContext context) => _context = context;

class BaseCommand{
  //services
  final databaseService = _context.read<DatabaseService>();

  //models
  final appModel = _context.read<AppModel>();
  final categoryModel = _context.read<CategoryModelState>();
  final noteModel = _context.read<NoteModelState>();
}