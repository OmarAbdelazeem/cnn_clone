import 'package:flutter/material.dart';
import 'package:testbloc12/res/strings_constants.dart';
import 'package:testbloc12/ui/widgets/custom_button.dart';
import 'package:testbloc12/ui/widgets/text_with_switsh.dart';


class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringsConstants.settings),
        centerTitle: true,
        backgroundColor: Color(0xffcb2026),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomTextButton(StringsConstants.edition),
            CustomTextButton(StringsConstants.alerts),
            CustomTextButton(StringsConstants.androidNotificationSettings),
            TextWithSwitch(StringsConstants.readerMode),
            TextWithSwitch(StringsConstants.enableThisIsCNN),
            CustomTextButton(StringsConstants.fontSize),
            TextWithSwitch(StringsConstants.autoPlayVideosOverWiFi),
            TextWithSwitch(StringsConstants.playHDVideosOverWiFi),
            CustomTextButton(StringsConstants.sendFeedback),
            CustomTextButton(StringsConstants.privacyPolicy),
            CustomTextButton(StringsConstants.termsOfService),
            CustomTextButton(StringsConstants.adChoices),
          ],
        ),
      ),
    );
  }
}




