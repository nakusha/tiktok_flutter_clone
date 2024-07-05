import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notification = false;

  void _onNotificationChnaged(bool? newValue) {
    if (newValue == null) return;

    setState(() {
      _notification = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          actions: const [
            CloseButton(),
          ],
        ),
        body: ListView(
          children: [
            ListTile(
              title: const Text('Log out(iOS/Bottom)'),
              textColor: Theme.of(context).primaryColor,
              onTap: () => showCupertinoModalPopup(
                context: context,
                builder: (context) => CupertinoActionSheet(
                  title: const Text('Log out'),
                  actions: [
                    CupertinoActionSheetAction(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Out!'),
                    ),
                    CupertinoActionSheetAction(
                      // isDefaultAction: true,
                      isDestructiveAction: true,
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('No!'),
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              title: const Text(
                "Logout (iOS)",
              ),
              textColor: Theme.of(context).primaryColor,
              // backdrop 없음
              onTap: () => showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: const Text('Are you sure?'),
                  content: const Text('Plx dont go!'),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("No"),
                    ),
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      isDestructiveAction: true,
                      child: const Text("Yes"),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: const Text(
                "Logout",
              ),
              textColor: Theme.of(context).primaryColor,
              // backdrop 있음
              onTap: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Are you sure?'),
                  content: const Text('Plx dont go!'),
                  actions: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const FaIcon(FontAwesomeIcons.outdent),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Yes"),
                    ),
                  ],
                ),
              ),
            ),
            SwitchListTile(
              value: _notification,
              onChanged: _onNotificationChnaged,
              title: const Text('Notification'),
            ),
            CheckboxListTile(
              value: _notification,
              onChanged: _onNotificationChnaged,
              title: const Text('Enable notifications'),
            ),
            ListTile(
              onTap: () => showAboutDialog(context: context),
              title: const Text(
                'About',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: const Text('About this app......'),
            ),
            const AboutListTile(),
            ListTile(
              onTap: () {
                showLicensePage(context: context);
              },
              title: const Text('License'),
            ),
            ListTile(
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2023),
                  lastDate: DateTime.now(),
                  initialDate: DateTime.now(),
                );
                print(date);
              },
              title: const Text('DatePicker'),
            ),
            ListTile(
              onTap: () async {
                final date = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(2023),
                  lastDate: DateTime.now(),
                );
                print(date);
              },
              title: const Text('DateRangePicker'),
            ),
            ListTile(
              onTap: () async {
                final date = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                print(date);
              },
              title: const Text('TimePicker'),
            ),
          ],
        ));
  }
}
