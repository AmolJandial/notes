import 'package:flutter/cupertino.dart';
import 'package:notes/model/category/category_entity.dart';
import 'package:notes/model/category/category_model.dart';
import 'package:notes/model/note/note_model.dart';

import '../model/note/note_entity.dart';

extension CategoryMapping on CategoryEntity {
  CategoryModel mapToCategoryModel(List<NoteEntity> notes) => CategoryModel(
        title: title,
        color: Color(colorCode),
        iconData: IconData(iconCode,
            fontPackage: 'font_awesome_flutter',
            fontFamily: 'FontAwesomeSolid'),
        notesCount: notes.length,
        notes: notes,
      );
}

extension NoteMapping on NoteModelState {
  NoteEntity mapToNoteEntity(int createdId) => NoteEntity(
        id: createdId,
        title: titleController.text,
        body: bodyController.text,
        parentCategory: parentCategory,
        creationDate: creationDate,
        modifiedDate: modifiedDate,
      );
}
