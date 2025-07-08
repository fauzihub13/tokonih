import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';
import 'package:flutter_tokonih/core/helper/auth_local_helper.dart';
import 'package:flutter_tokonih/core/router/route_name.dart';
import 'package:flutter_tokonih/models/response/login_response_model.dart';
import 'package:go_router/go_router.dart';

class MainAppbar extends StatefulWidget {
  const MainAppbar({super.key});

  @override
  State<MainAppbar> createState() => _MainAppbarState();
}

class _MainAppbarState extends State<MainAppbar> {
  LoginResponseModel? authData;
  Future<void> _loadAuthData() async {
    final response = await AuthLocalHelper().getAuthData();
    setState(() {
      authData = response;
    });
  }

  @override
  void initState() {
    _loadAuthData();
    super.initState();
  }

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
                    authData == null ? '-' : authData!.firstName ?? '-',
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
                    context.pushNamed(RouteName.notificationPage);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return NotificationPage();
                    //     },
                    //   ),
                    // );
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
