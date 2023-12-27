import 'package:flutter/cupertino.dart';
import 'package:notes/controller/base_command.dart';
import 'package:notes/model/note/note_entity.dart';

import '../../model/note/note_model.dart';

class EnterOverviewModeCommand extends BaseCommand{
  void run(NoteEntity noteEntity) {
    NoteModel newNoteModel = NoteModel(
        id: noteEntity.id,
        parentCategory: noteEntity.parentCategory,
        title: noteEntity.title,
        body: noteEntity.body,
        noteControlState: (inOverview: true, inCreation: false, inEditable: false),
        titleController: TextEditingController()..text = noteEntity.title,
        bodyController: TextEditingController()..text = noteEntity.body,
        creationDate: noteEntity.creationDate,
        modifiedDate: noteEntity.modifiedDate,
    );
    noteModel.state = newNoteModel;
  }
}