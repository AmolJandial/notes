import 'package:notes/controller/base_command.dart';

class GetInitialDataCommand extends BaseCommand{

  Future<bool> run() async{
    final categories = await databaseService.getAllCategories();
    appModel.categories = categories;
    print(appModel.categories);
    return true;
  }

}