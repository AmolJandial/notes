import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes/common/extensions.dart';
import 'package:notes/controller/notes_commands/enter_editable_mode_command.dart';
import 'package:notes/model/note/note_model.dart';
import 'package:provider/provider.dart';

import '../../controller/db_commands/save_note_command.dart';
import '../../controller/notes_commands/check_dirty_note_command.dart';
import '../../controller/notes_commands/enter_overview_mode_command.dart';

class NoteBody extends StatelessWidget {
  const NoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    final noteState = context.select<NoteModelState, NoteModel>((value) => value.state);
    Widget categoryChip = InputChip(
      label: Text(noteState.parentCategory),
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      onPressed: _onCategoryChipPressed,
    );
    Widget titleEditText = TextField(
      controller: noteState.titleController,
      keyboardType: TextInputType.text,
      onTap: () => _enterEditableMode(noteState),
      inputFormatters: [LengthLimitingTextInputFormatter(50)],
      decoration: InputDecoration(
          hintText: 'Title',
          hintStyle: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Colors.grey),
          border: InputBorder.none),
    );
    Widget contentBody = Expanded(
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: TextField(
            controller: noteState.bodyController,
            selectionControls: materialTextSelectionControls,
            onTap: () => _enterEditableMode(noteState),
            maxLines: 200,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: const InputDecoration(
                border: InputBorder.none, hintText: 'Enter notes here...'),
          )),
    );

    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) => _onPopInvoked(
          context.read<NoteModelState>(), didPop, context),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _enterEditableMode(noteState),
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              categoryChip,
              titleEditText,
              contentBody,
            ],
          ),
        ),
      ),
    );
    ;
  }

  void _onCategoryChipPressed() {}

  void _onPopInvoked(
      NoteModelState note,
      bool didPop,
      BuildContext context) {
    if (didPop) {
      return;
    }
    if (note.noteControlState.inEditable || note.noteControlState.inCreation) {
      final isNoteDirty = CheckDirtyNoteCommand().run(note);
      if (isNoteDirty) {
        showPopupDialog(context);
      } else {
        if(note.noteControlState.inEditable){
          EnterOverviewModeCommand().run(note.mapToNoteEntity(note.id));
        }else{
          Navigator.pop(context);
        }
      }
    } else if (note.noteControlState.inOverview) {
      Navigator.pop(context);
    }
  }

  void _enterEditableMode(NoteModel noteModelState) {
    if (noteModelState.noteControlState.inOverview) {
      EnterEditableModeCommand().run();
    }
  }

  void showPopupDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        alignment: Alignment.bottomCenter,
        title: const Text('Save your changes or discard them?', style: TextStyle(fontSize: 16)),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Discard'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              SaveNoteCommand().run();
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
