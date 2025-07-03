import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';

class MainAppbar extends StatelessWidget {
  final String name;
  const MainAppbar({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: PaddingSize.horizontal),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome back,',
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: DefaultColors.neutral800,
                    ),
                  ),
                  Text(
                    name,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 40,
              height: 40,
              child: Center(
                child: IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/notification.svg',
                    height: 28,
                    width: 28,
                  ),
                  onPressed: () {
                    print('sadasd');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
