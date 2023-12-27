
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/common/database_constants.dart';
import 'package:notes/common/providers.dart';
import 'package:notes/common/widgets/error_widget.dart';
import 'package:notes/common/widgets/loading_widget.dart';
import 'package:notes/controller/db_commands/get_initial_data_command.dart';
import 'package:notes/model/category/category_entity.dart';
import 'package:notes/model/note/note_entity.dart';
import 'package:notes/view/homescreen/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:notes/controller/base_command.dart' as commands;

void main() async{
  //Database initialization
  await Hive.initFlutter();
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<CategoryEntity>(DatabaseConstants.categoriesBox);
  await Hive.openBox<NoteEntity>(DatabaseConstants.notesBox);

  runApp(MultiProvider(providers: [
    databaseProvider,
    appModelProvider,
    categoryModelStateProvider,
    noteModelStateProvider
  ],
  child: const MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 48),
          titleSmall: TextStyle(fontSize: 24),
          bodyMedium: TextStyle(fontSize: 16),
          bodySmall: TextStyle(fontSize: 12),
        ),
        useMaterial3: true
      ),
      home: Builder(
          builder: (context) {
            commands.init(context);
            return FutureBuilder<bool>(
              future: GetInitialDataCommand().run(),
              builder: (context, snapshot) {
                print(snapshot);
                if(snapshot.hasData){
                  return const HomeScreen();
                }
                else if(snapshot.hasError){
                  return const ErrorStateWidget();
                }
                else{
                  return const LoadingWidget();
                }

              },
            );
          }
        ),
      );
  }
}
