import 'package:hive/hive.dart';
part 'category_entity.g.dart';

@HiveType(typeId: 0, adapterName: 'CategoryAdapter')
class CategoryEntity extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final int colorCode;

  @HiveField(2)
  final int iconCode;

  @HiveField(3)
  final int notesCount;

  CategoryEntity({
    required this.title,
    required this.colorCode,
    required this.iconCode,
    required this.notesCount,
  });
}
