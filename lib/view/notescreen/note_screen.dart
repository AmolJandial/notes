import 'package:flutter/material.dart';
import 'package:notes/view/notescreen/NoteBody.dart';
import 'package:notes/view/notescreen/note_app_bar.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: NoteAppBar(),
      body: NoteBody(),
    );
  }
}
