import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ListWheel extends StatelessWidget {
  const ListWheel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView(
      itemExtent: 200,
      children: [
        const CupertinoActivityIndicator(),
        const CircularProgressIndicator.adaptive(),
        for (var x in [1, 2, 3, 4, 5, 6, 7, 8, 9])
          FractionallySizedBox(
            widthFactor: 1,
            child: Container(
              color: Colors.teal,
              child: const Center(
                child: Text(
                  'Pick me',
                  style: TextStyle(color: Colors.white, fontSize: Sizes.size40),
                ),
              ),
            ),
          )
      ],
    );
  }
}
