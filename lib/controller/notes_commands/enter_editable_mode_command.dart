import 'package:notes/controller/base_command.dart';

class EnterEditableModeCommand extends BaseCommand{
  void run(){
    noteModel.noteControlState = (inEditable: true, inCreation: false, inOverview: false);
  }
}