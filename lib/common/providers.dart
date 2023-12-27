import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/common/database_constants.dart';
import 'package:notes/model/app/app_model.dart';
import 'package:notes/model/category/category_entity.dart';
import 'package:notes/model/category/category_model.dart';
import 'package:notes/model/note/note_model.dart';
import 'package:notes/services/database_service.dart';
import 'package:provider/provider.dart';

final databaseProvider = Provider<DatabaseService>(create: (context) => DatabaseService());

final appModelProvider = ChangeNotifierProvider<AppModel>(create: (context) => AppModel());

final categoryModelStateProvider = ChangeNotifierProvider<CategoryModelState>(create: (context) => CategoryModelState());

final noteModelStateProvider = ChangeNotifierProvider<NoteModelState>(create: (context) => NoteModelState());