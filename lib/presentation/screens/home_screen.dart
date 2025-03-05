import 'package:flutter/material.dart';
import 'package:podtimer/presentation/widgets/shared/custom_bottom_navigation_bar.dart';

import '../views/views.dart';

class HomeScreen extends StatefulWidget {
  static const name = 'HomeScreen';
  final int index;
  const HomeScreen({super.key, required this.index});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final routes = const <Widget>[
    HomeView(),
    PodcastsView(),
    ConfigView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        // keeps state
        index: widget.index,
        children: routes,
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(selectedIndex: 0),
    );
  }
}
