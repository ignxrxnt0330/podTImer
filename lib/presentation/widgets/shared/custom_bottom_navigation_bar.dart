import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  const CustomBottomNavigationBar({super.key, required this.selectedIndex});

  void onItemTapped(BuildContext context, int index) {
    context.go("/home/$index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      enableFeedback: false,
      currentIndex: selectedIndex,
      onTap: (index) => onItemTapped(context, index),
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: "home"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.podcasts,
            ),
            label: "podcasts"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: "config"),
      ],
    );
  }
}
