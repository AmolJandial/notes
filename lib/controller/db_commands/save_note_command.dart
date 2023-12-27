import 'package:notes/common/extensions.dart';
import 'package:notes/controller/base_command.dart';
import 'package:notes/controller/category_commands/update_category_state_command.dart';
import 'package:notes/controller/notes_commands/enter_overview_mode_command.dart';
import 'package:notes/model/note/note_entity.dart';

class SaveNoteCommand extends BaseCommand{
  Future<void> run() async{
    int id;
    if(noteModel.id == -1){
      id = await databaseService.getNoteId(noteModel.parentCategory);
    }else{
      id = noteModel.id;
    }
    NoteEntity noteEntity = noteModel.mapToNoteEntity(id);
    EnterOverviewModeCommand().run(noteEntity);
    await databaseService.addNote(noteEntity);
    await UpdateCategoryStateCommand().run(noteEntity.parentCategory);
  }
}