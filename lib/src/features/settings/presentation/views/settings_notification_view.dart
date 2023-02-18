import 'package:flutter/material.dart';

import '../../../../../base/define/app_text.dart';
import '../widgets/setting_switch_row.dart';

class SettingsNotification extends StatelessWidget {
  const SettingsNotification({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xFFFDFCFF),
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: Navigator.of(context).pop,
            child: const Icon(
              Icons.arrow_back,
              color: Color(0xFF43474E),
            ),
          ),
          title: Row(children: const [
            Text(
              AppText.txtNotification,
              style: TextStyle(
                fontSize: 22.0,
                height: 28.0,
                color: Color(0xFF1A1C1E),
              ),
            ),
          ]),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  AppText.txtNotifyMeAbout,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 16.0,
                  ),
                  child: SettingSwitchRow(
                    title: AppText.txtDealsAndDiscounts,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 16.0,
                  ),
                  child: SettingSwitchRow(
                    title: AppText.txtNewTopics,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 16.0,
                  ),
                  child: SettingSwitchRow(
                    title: AppText.txtNewTeachers,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 32.0,
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xFFCAC4D0),
                    ),
                    child: SizedBox(
                      height: 1.0,
                      width: double.infinity,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 16.0,
                  ),
                  child: SettingSwitchRow(
                    title: AppText.txtSounds,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 16.0,
                  ),
                  child: SettingSwitchRow(
                    title: AppText.txtVibrations,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
