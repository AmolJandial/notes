import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes/controller/db_commands/save_note_command.dart';
import 'package:notes/model/note/note_model.dart';
import 'package:provider/provider.dart';

class NoteAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NoteAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final appBarShape = LinearBorder.bottom(side: const BorderSide(width: 1));
    final noteControlState = context.select<NoteModelState, ({bool inCreation, bool inEditable, bool inOverview})>((value) => value.noteControlState);
    AppBar overviewAppBar = AppBar(
      title: Text('overview mode'),
      automaticallyImplyLeading: false,
      shape: appBarShape,
      scrolledUnderElevation: 0,
    );
    AppBar editAppBar = AppBar(
      shape: appBarShape,
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      actions: [
        IconButton(onPressed: _saveIconPressed, icon: const Icon(FontAwesomeIcons.solidFloppyDisk))
      ],
    );
    return noteControlState.inOverview ? overviewAppBar : editAppBar;
  }

  void _saveIconPressed(){
    SaveNoteCommand().run();
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
