import 'package:notes/common/database_constants.dart';
import 'package:notes/common/extensions.dart';
import 'package:notes/controller/base_command.dart';
import 'package:notes/controller/db_commands/get_notes_by_category_command.dart';
import 'package:notes/model/note/note_entity.dart';

class GetInitialDataCommand extends BaseCommand{

  Future<bool> run() async{
    final categories = await databaseService.getAllCategories();
    appModel.categories = categories;
    final notes = await GetNotesByCategoryCommand().run(DatabaseConstants.categoryAllNotes);
    categoryModel.state = categories[0].mapToCategoryModel(notes);
    return true;
  }

}