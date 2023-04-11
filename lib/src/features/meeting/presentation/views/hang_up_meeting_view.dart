import 'package:flutter/material.dart';

import '../../../../../base/define/styles.dart';
import '../../../../../base/temp_dio/dio_client.dart';
import '../../../../../base/widgets/buttons/button.dart';
import '../../../report_meeting/presentation/views/report_meeting_page.dart';
import '../../../report_meeting/presentation/views/report_meeting_view.dart';

class HangUpMeetingView extends StatefulWidget {
  const HangUpMeetingView({Key? key}) : super(key: key);

  @override
  State<HangUpMeetingView> createState() => _HangUpMeetingViewState();
}

class _HangUpMeetingViewState extends State<HangUpMeetingView> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppOutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const ReportMeetingPage(),
                        settings: RouteSettings(arguments: args)),
                  );
                },
                text: 'Report',
                icon: Icons.report_outlined,
                textColor: AppColor.error,
                iconColor: AppColor.error,
                minimumSize: const Size(100, 48),
              ),
              const SizedBox(height: spacing8),
              AppOutlinedButton(
                onPressed: () async {
                  final result = await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Confirm block'),
                      content:
                          const Text('Are you sure to block this teacher?'),
                      actions: [
                        AppTextButton(
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          text: 'Cancel',
                        ),
                        AppFilledButton(
                          onPressed: () async {
                            await DioClient.blockTeacher(
                                blockedId: args.teacherId);
                            if (!mounted) return;
                            Navigator.pop(context, true);
                          },
                          text: 'Block',
                        ),
                      ],
                    ),
                  );
                  if (result) {
                    if (mounted) {
                      Navigator.pop(context);
                    }
                  }
                },
                text: 'Block',
                textColor: AppColor.error,
                icon: Icons.block,
                iconColor: AppColor.error,
                minimumSize: const Size(100, 48),
              ),
              const SizedBox(height: spacing8),
              AppOutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                text: 'Done',
                textColor: AppColor.support,
                icon: Icons.done,
                iconColor: AppColor.support,
                minimumSize: const Size(100, 48),
              ),
            ],
          ),
        ),
      ),
    );
  }
}