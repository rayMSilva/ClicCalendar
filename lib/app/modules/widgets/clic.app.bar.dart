import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final IconData? titleIcon;
  final IconData? iconleading;
  final VoidCallback? leadingFunction;

  const ClicAppBar({
    super.key,
    required this.title,
    required this.iconleading,
    required this.leadingFunction,
    required this.titleIcon,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: leadingFunction,
        icon: Icon(iconleading!),
      ),
      centerTitle: true,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            titleIcon!,
            color: Get.theme.colorScheme.tertiary,
          ),
          const SizedBox(width: 6),
          Text(
            title!,
            style: TextStyle(
              color: Get.theme.colorScheme.primary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
