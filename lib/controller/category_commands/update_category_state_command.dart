import 'package:notes/common/extensions.dart';
import 'package:notes/controller/base_command.dart';
import 'package:notes/controller/db_commands/get_notes_by_category_command.dart';

class UpdateCategoryStateCommand extends BaseCommand{
  Future<void> run(String categoryTitle) async{
    final notes = await GetNotesByCategoryCommand().run(categoryTitle);
    final category = await databaseService.getCategory(categoryTitle);
    categoryModel.state = category.mapToCategoryModel(notes);
  }
}