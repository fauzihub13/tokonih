import 'package:flutter/material.dart';
import 'package:flutter_tokonih/features/shared/widgets/common_appbar.dart';
import 'package:flutter_tokonih/features/shared/widgets/empty_state.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CommonAppbar(title: 'Notification', canBack: true),
      ),
      body: SafeArea(
        child: Center(
          child: EmptyState(
            iconPath: 'notification.svg',
            title: 'You haven’t gotten any notifications yet!',
            subTitle: 'We’ll alert you when something cool happens.',
          ),
        ),
      ),
    );
  }
}
