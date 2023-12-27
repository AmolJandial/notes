import 'package:flutter/cupertino.dart';
import 'package:notes/controller/base_command.dart';
import 'package:notes/model/note/note_model.dart';

class EnterCreationModeCommand extends BaseCommand {
  void run() {
    NoteModel newNoteModel = NoteModel(
      id: -1,
      parentCategory: categoryModel.title,
      title: '',
      body: '',
      noteControlState: (inOverview: false, inCreation: true, inEditable: false),
      titleController: TextEditingController(),
      bodyController: TextEditingController(),
      creationDate: DateTime.now(),
      modifiedDate: DateTime.now()
    );
    noteModel.state = newNoteModel;
  }
}
