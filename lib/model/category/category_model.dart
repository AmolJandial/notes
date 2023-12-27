import 'package:flutter/cupertino.dart';

import '../note/note_entity.dart';

class CategoryModel {
  final String title;
  final Color color;
  final IconData iconData;
  final int notesCount;
  final List<NoteEntity> notes;

  CategoryModel({
    required this.title,
    required this.color,
    required this.iconData,
    required this.notesCount,
    required this.notes,
  });

  @override
  String toString() {
    return 'CategoryModel{title: $title, color: $color, iconData: $iconData, notesCount: $notesCount, notes: $notes}';
  }
}

class CategoryModelState extends ChangeNotifier {

  late CategoryModel _state;
  CategoryModel get state => _state;
  set state(CategoryModel newState){
    _state = newState;
    notifyListeners();
  }

  String get title => _state.title;
  int get notesCount => _state.notesCount;
  Color get color => _state.color;
  List<NoteEntity> get notes => _state.notes;




}
