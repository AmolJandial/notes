import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../controller/notes_commands/enter_overview_mode_command.dart';
import '../../model/note/note_entity.dart';
import '../notescreen/note_screen.dart';

class HomeListItem extends StatelessWidget {
  final Color noteColor;
  final NoteEntity note;

  const HomeListItem({super.key, required this.note, required this.noteColor});

  @override
  Widget build(BuildContext context) {
    Widget circleContainer = Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: noteColor,
      ),
    );
    Widget noteTitle = Text(
      note.title,
      style: Theme.of(context).textTheme.titleLarge,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
    Widget additionalInfoRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('3 Dec 2023', style: Theme.of(context).textTheme.labelMedium),
        const Icon(FontAwesomeIcons.star, size: 16),
      ],
    );
    Widget content = Text(
      note.body,
      maxLines: 5,
      style: Theme.of(context).textTheme.bodySmall,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
    );

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 1,
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        onTap: () => onCardTap(note, context),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              circleContainer,
              const SizedBox(height: 8),
              noteTitle,
              const SizedBox(height: 8),
              additionalInfoRow,
              const SizedBox(height: 8),
              content,
            ],
          ),
        ),
      ),
    );
  }

  void onCardTap(NoteEntity note, BuildContext context) {
    EnterOverviewModeCommand().run(note);
    Future.delayed(const Duration(milliseconds: 300), (){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const NoteScreen(),
        ),
      );
    });

  }
}
