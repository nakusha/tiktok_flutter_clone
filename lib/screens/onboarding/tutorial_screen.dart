import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/screens/main_navigation/main_navigation.dart';

enum Direction { right, left }

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.right;
  Page _showinPage = Page.first;

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      //to the right
      setState(() {
        _direction = Direction.right;
      });
    } else {
      //to the left
      setState(() {
        _direction = Direction.left;
      });
    }
  }

  void _onPanEnd(DragEndDetails detail) {
    if (_direction == Direction.left) {
      setState(() {
        _showinPage = Page.second;
      });
    } else {
      setState(() {
        _showinPage = Page.first;
      });
    }
  }

  void _onPressApp() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const MainNavigation()));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size24,
          ),
          child: SafeArea(
            child: AnimatedCrossFade(
              firstChild: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v80,
                  Text(
                    'Watch coll videos!',
                    style: TextStyle(
                      fontSize: Sizes.size36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v20,
                  Text(
                    'Videos are personalized for you based on what you watch, like and share.',
                    style: TextStyle(
                      fontSize: Sizes.size20,
                    ),
                  )
                ],
              ),
              secondChild: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v80,
                  Text(
                    'Follow the rules',
                    style: TextStyle(
                      fontSize: Sizes.size36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v20,
                  Text(
                    'Take care of one another! Pils!',
                    style: TextStyle(
                      fontSize: Sizes.size20,
                    ),
                  )
                ],
              ),
              crossFadeState: _showinPage == Page.first
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 300),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size5,
              ),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: _showinPage == Page.first ? 0 : 1,
                child: CupertinoButton(
                  onPressed: _onPressApp,
                  color: Theme.of(context).primaryColor,
                  child: const Text('Enter the app!'),
                ),
              )),
        ),
      ),
    );
  }
}
