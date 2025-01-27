import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_page_bloc/login_page_bloc.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('language_selection'.tr())),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //  setState(() {});
            showLanguageSelectionDialog(context);
          },
          child: Text('hello'.tr()),
        ),
      ),
    );
  }

  void showLanguageSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('English'),
                onTap: () {
                  setState(() {});
                  context.setLocale(const Locale('en'));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('हिंदी (Hindi)'),
                onTap: () {
                  setState(() {});

                  context.setLocale(const Locale('hi'));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('മലയാളം (Malayalam)'),
                onTap: () {
                  setState(() {});
                  context.setLocale(const Locale('ml'));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Add your action here
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
