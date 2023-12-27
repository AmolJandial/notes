import 'package:flutter/cupertino.dart';

class NoteModel {
  final int id;
  final String parentCategory;
  final String title;
  final String body;
  final DateTime creationDate;
  final DateTime modifiedDate;
  ({bool inOverview, bool inEditable, bool inCreation}) noteControlState;
  final TextEditingController titleController;
  final TextEditingController bodyController;

  NoteModel({
    required this.id,
    required this.parentCategory,
    required this.title,
    required this.body,
    required this.noteControlState,
    required this.titleController,
    required this.bodyController,
    required this.creationDate,
    required this.modifiedDate,
  }){
    print('NoteModel Provider');
  }

  @override
  String toString() {
    return 'NoteModel{id: $id, parentCategory: $parentCategory, title: $title, body: $body, noteControlState: $noteControlState, titleController: $titleController, bodyController: $bodyController}';
  }
}

class NoteModelState extends ChangeNotifier{
  late NoteModel _state;
  NoteModel get state => _state;
  set state(NoteModel newState) {
    _state = newState;
    notifyListeners();
  }

  ({bool inCreation, bool inEditable, bool inOverview}) get noteControlState => _state.noteControlState;
  set noteControlState(({bool inCreation, bool inEditable, bool inOverview}) newValue) {
    _state.noteControlState = newValue;
    notifyListeners();
  }

  String get parentCategory => _state.parentCategory;
  TextEditingController get titleController => _state.titleController;
  TextEditingController get bodyController => _state.bodyController;
  String get body => _state.body;
  String get title => _state.title;
  DateTime get creationDate => _state.creationDate;
  DateTime get modifiedDate => _state.modifiedDate;
  int get id => _state.id;
}
