import 'package:flutter/material.dart';
import 'package:notes/model/category/category_model.dart';
import 'package:notes/model/note/note_model.dart';
import 'package:notes/view/homescreen/home_drawer.dart';
import 'package:notes/view/homescreen/home_fab.dart';
import 'package:provider/provider.dart';

import 'appbar/home_app_bar.dart';
import 'home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      drawer: const HomeDrawer(),
      body: SafeArea(
        child: Consumer(
          builder: (context, value, child) {
            context.watch<NoteModelState>();
            return Stack(
              children: [
                NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) => [const HomeAppBar()],
                  body: const HomeBody(),
                ),
                const HomeFab(),
              ],
            );
          },
        ),
      ),
    );
  }
}
