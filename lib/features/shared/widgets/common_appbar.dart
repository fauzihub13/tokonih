import 'package:flutter/material.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';

class CommonAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool canBack;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final Widget? suffixIcon;
  final VoidCallback? suffixIconOnTap;

  const CommonAppbar({
    super.key,
    required this.title,
    required this.canBack,
    this.onTap,
    this.backgroundColor,
    this.textColor,
    this.suffixIcon,
    this.suffixIconOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white, boxShadow: []),
      child: AppBar(
        backgroundColor: backgroundColor ?? Colors.white,
        scrolledUnderElevation: 0.0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              canBack
                  ? SizedBox(
                    width: 40,
                    height: 40,
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: DefaultColors.neutral950,
                          size: 16,
                        ),
                        onPressed: () {
                          if (onTap != null) {
                            onTap!();
                          } else {
                            Navigator.pop(context);
                            // context.pop(context);
                          }
                        },
                      ),
                    ),
                  )
                  : const SizedBox(width: 40),
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              suffixIcon != null
                  ? SizedBox(
                    width: 40,
                    height: 40,
                    child: Center(
                      child: IconButton(
                        icon: suffixIcon!,
                        onPressed: () {
                          if (suffixIconOnTap != null) {
                            suffixIconOnTap!();
                          } else {}
                        },
                      ),
                    ),
                  )
                  : const SizedBox(width: 48),
            ],
          ),
        ),
      ),
    );
  }

  // Define preferedSizeWidget
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
