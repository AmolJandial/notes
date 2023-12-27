import 'package:notes/controller/base_command.dart';
import 'package:notes/model/note/note_model.dart';

class CheckDirtyNoteCommand extends BaseCommand{
  bool run(NoteModelState oldNote){
    if(oldNote.title == oldNote.titleController.text){
      if(oldNote.body == oldNote.bodyController.text){
        return false;
      }else{
        return true;
      }
    }

    return true;
  }
}