import 'package:hive/hive.dart';
part 'note_entity.g.dart';


@HiveType(typeId: 1, adapterName: 'NoteAdapter')
class NoteEntity extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String body;

  @HiveField(2)
  final String parentCategory;

  @HiveField(3)
  final DateTime creationDate;

  @HiveField(4)
  final DateTime modifiedDate;

  @HiveField(5)
  final int id;

  NoteEntity({
    required this.id,
    required this.title,
    required this.body,
    required this.parentCategory,
    required this.creationDate,
    required this.modifiedDate,
  });

  @override
  String toString() {
    return 'NoteEntity{title: $title, body: $body, parentCategory: $parentCategory, creationDate: $creationDate, modifiedDate: $modifiedDate, id: $id}';
  }
}
