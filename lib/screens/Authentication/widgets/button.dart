import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final FaIcon icon;
  final Function? onTapButton;

  const AuthButton({
    super.key,
    required this.text,
    required this.icon,
    this.onTapButton,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        if (onTapButton != null) {onTapButton!()}
      },
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size14,
            horizontal: Sizes.size16,
          ),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade300,
                width: Sizes.size2,
              ),
              borderRadius: BorderRadius.circular(Sizes.size14)),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(alignment: Alignment.centerLeft, child: icon),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
