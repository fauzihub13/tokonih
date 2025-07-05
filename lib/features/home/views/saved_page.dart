import 'package:flutter/material.dart';
import 'package:flutter_tokonih/features/shared/widgets/empty_state.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: EmptyState(
            iconPath: 'saved.svg',
            title: 'No Saved Items!',
            subTitle:
                'You don’t have any saved items. Go to home and add some.',
          ),
        ),
      ),
    );
  }
}
