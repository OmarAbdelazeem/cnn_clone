import 'package:flutter/material.dart';
import 'package:testbloc12/widgets/custom_button.dart';
import 'package:testbloc12/widgets/text_with_switsh.dart';

class SettingsScreen extends StatelessWidget {
  static const String tag = 'settings-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
        backgroundColor: Color(0xffcb2026),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomButton('Edition'),
            CustomButton('Alerts'),
            CustomButton('Android Notification Settings'),
            TextWithSwitch('Reader Mode'),
            TextWithSwitch('Enable \'This is CNN\''),
            CustomButton('Font Size'),
            TextWithSwitch('Autoplay videos over Wi-Fi'),
            TextWithSwitch('Play HD videos over Wi-Fi'),
            CustomButton('Send Feedback'),
            CustomButton('Privacy Policy'),
            CustomButton('Terms of Service'),
            CustomButton('Ad Choices'),
          ],
        ),
      ),
    );
  }
}




