import 'package:flutter/material.dart';
import 'package:notes/model/category/category_model.dart';
import 'package:provider/provider.dart';

class MainContainer extends StatelessWidget {
  final ({double progress}) appBarRecord;

  const MainContainer({super.key, required this.appBarRecord});

  @override
  Widget build(BuildContext context) {
    Widget categoryTitleWidget = Text(
      context.select<CategoryModelState, String>((value) => value.title),
      style: TextStyle.lerp(
        Theme.of(context).textTheme.titleLarge,
        Theme.of(context).textTheme.titleSmall,
        appBarRecord.progress,
      ),
    );
    Widget notesCountWidget = Visibility(
      child: Opacity(
        opacity: 1.0 - appBarRecord.progress,
        child: Text(
          'notes ${context.select<CategoryModelState, int>((value) => value.notesCount)}',
          style: TextStyle.lerp(
            const TextStyle(fontSize: 18),
            const TextStyle(fontSize: 0),
            appBarRecord.progress,
          ),
        ),
      ),
    );

    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      curve: Curves.linear,
      padding: EdgeInsets.lerp(
          const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          const EdgeInsets.only(bottom: 0, left: 54),
          appBarRecord.progress),
      alignment: Alignment.lerp(
          Alignment.center, Alignment.centerLeft, appBarRecord.progress),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          categoryTitleWidget,
          notesCountWidget,
        ],
      ),
    );
  }
}
