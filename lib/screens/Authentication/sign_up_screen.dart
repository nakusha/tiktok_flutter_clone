import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/screens/Authentication/login_screen.dart';
import 'package:tiktok_clone/screens/Authentication/username_screen.dart';
import 'package:tiktok_clone/screens/Authentication/widgets/button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onLoginTap(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  void _onEmailTab(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const UsernameScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
              child: Column(
                children: [
                  Gaps.v80,
                  const Text(
                    'Sign up for TikTok',
                    style: TextStyle(
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gaps.v20,
                  const Text(
                    'Create Profile, follow other accounts, make your own videos, and more.',
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      color: Colors.black45,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Gaps.v40,
                  if (orientation == Orientation.portrait) ...[
                    AuthButton(
                        onTapButton: () => {_onEmailTab(context)},
                        icon: const FaIcon(FontAwesomeIcons.solidUser),
                        text: 'Use Phone or Email'),
                    Gaps.v10,
                    const AuthButton(
                        icon: FaIcon(FontAwesomeIcons.apple),
                        text: 'Continue with Apple')
                  ],
                  if (orientation == Orientation.landscape)
                    Row(
                      children: [
                        Expanded(
                          child: AuthButton(
                              onTapButton: () => {_onEmailTab(context)},
                              icon: const FaIcon(FontAwesomeIcons.solidUser),
                              text: 'Use Phone or Email'),
                        ),
                        Gaps.h10,
                        const Expanded(
                          child: AuthButton(
                              icon: FaIcon(FontAwesomeIcons.apple),
                              text: 'Continue with Apple'),
                        ),
                      ],
                    )
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 2,
            color: Colors.grey.shade50,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: Sizes.size16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  Gaps.h5,
                  GestureDetector(
                    onTap: () => _onLoginTap(context),
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
