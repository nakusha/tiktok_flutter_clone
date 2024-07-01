import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final screens = [
    const Center(child: Text('Home')),
    const Center(child: Text('Search')),
    const Center(child: Text('3')),
    const Center(child: Text('4')),
    const Center(child: Text('5')),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[_selectedIndex],
        bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onTap,
          destinations: const [
            NavigationDestination(
                icon: FaIcon(FontAwesomeIcons.house), label: 'Home'),
            NavigationDestination(
                icon: FaIcon(FontAwesomeIcons.martiniGlassCitrus),
                label: 'Search'),
          ],
        ));
  }
}
