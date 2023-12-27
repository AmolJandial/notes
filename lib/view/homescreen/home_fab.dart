import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes/controller/notes_commands/enter_creation_mode_command.dart';
import 'package:notes/view/notescreen/note_screen.dart';

class HomeFab extends StatelessWidget {
  const HomeFab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
            onPressed: () => onFabPressed(context),
            child: const Icon(FontAwesomeIcons.plus)),
      ),
    );
  }

  void onFabPressed(BuildContext context) {
    EnterCreationModeCommand().run();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const NoteScreen(),
      ),
    );
  }
}
