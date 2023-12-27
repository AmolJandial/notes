import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes/model/category/category_model.dart';
import 'package:notes/model/note/note_entity.dart';
import 'package:provider/provider.dart';

import 'home_list_item.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final notes = context.select<CategoryModelState, List<NoteEntity>>((value) => value.notes);
    return  MasonryGridView.count(
      padding: const EdgeInsets.all(8),
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final categoryColor = context.read<CategoryModelState>().color;
        return HomeListItem(note: notes[index], noteColor: categoryColor);
      },
    );
  }
}
