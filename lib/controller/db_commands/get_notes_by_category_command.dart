import 'package:notes/controller/base_command.dart';
import 'package:notes/model/note/note_entity.dart';

class GetNotesByCategoryCommand extends BaseCommand{
  Future<List<NoteEntity>> run(String categoryTitle) async{
    final List<NoteEntity> notes = await databaseService.getNotesByCategory(categoryTitle);
    return notes;
  }
}