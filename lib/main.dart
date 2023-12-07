
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/common/providers.dart';
import 'package:notes/common/widgets/error_widget.dart';
import 'package:notes/common/widgets/loading_widget.dart';
import 'package:notes/controller/db_commands/get_initial_data_command.dart';
import 'package:notes/model/category/category_entity.dart';
import 'package:notes/view/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:notes/controller/base_command.dart' as commands;

import 'common/database_constants.dart';

void main() async{
  //Database initialization
  await Hive.initFlutter();
  Hive.registerAdapter(CategoryAdapter());

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(

        ),
        useMaterial3: true
      ),
      home: MultiProvider(
        providers: [
          databaseProvider,
          appModelProvider,
        ],
        child: Builder(
          builder: (context) {
            commands.init(context);
            return FutureBuilder<bool>(
              future: GetInitialDataCommand().run(),
              builder: (context, snapshot) {
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
      ),
    );
  }
}
