import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/screens/main_navigation/widgets/nav_tab.dart';
import 'package:tiktok_clone/screens/main_navigation/widgets/stf_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final screens = [
    StfScreen(key: GlobalKey()),
    StfScreen(key: GlobalKey()),
    const Center(child: Text('Search')),
    StfScreen(key: GlobalKey()),
    StfScreen(key: GlobalKey()),
    // const Center(child: Text('Home')),
    // const Center(child: Text('Search')),
    // const Center(child: Text('3')),
    // const Center(child: Text('4')),
    // const Center(child: Text('5')),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostVideoButtonTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text('Record video')),
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const StfScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const StfScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 2,
            child: const StfScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 2,
            child: const StfScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const StfScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.all(Sizes.size12),
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavTab(
              text: "Home",
              isSelected: _selectedIndex == 0,
              icon: FontAwesomeIcons.house,
              selectedIcon: FontAwesomeIcons.house,
              onTap: () => _onTap(0),
            ),
            NavTab(
              text: "Search",
              isSelected: _selectedIndex == 1,
              icon: FontAwesomeIcons.compass,
              selectedIcon: FontAwesomeIcons.solidCompass,
              onTap: () => _onTap(1),
            ),
            Gaps.h24,
            Stack(
              children: [
                Positioned(
                  right: 20,
                  child: Container(
                    height: 30,
                    width: 25,
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size8,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(
                          Sizes.size11,
                        )),
                  ),
                ),
                Positioned(
                  left: 20,
                  child: Container(
                    height: 30,
                    width: 25,
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size8,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(
                          Sizes.size11,
                        )),
                  ),
                ),
                Container(
                  height: 30,
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size12,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: const Center(
                    child: FaIcon(
                      FontAwesomeIcons.plus,
                      color: Colors.black,
                      size: Sizes.size16,
                    ),
                  ),
                )
              ],
            ),
            Gaps.h24,
            NavTab(
              text: "Inbox",
              isSelected: _selectedIndex == 2,
              icon: FontAwesomeIcons.message,
              selectedIcon: FontAwesomeIcons.solidMessage,
              onTap: () => _onTap(2),
            ),
            NavTab(
              text: "Profile",
              isSelected: _selectedIndex == 3,
              icon: FontAwesomeIcons.user,
              selectedIcon: FontAwesomeIcons.solidUser,
              onTap: () => _onTap(3),
            ),
          ],
        ),
      ),
    );
  }
}
