import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardSimples extends StatelessWidget {
  const CardSimples({
    super.key,
    required this.onTap,
    required this.titulo,
    required this.icon,
  });

  final VoidCallback onTap;
  final String titulo;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 170,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 15,
        child: InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            onTap.call();
          },
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      icon,
                      color: Get.theme.colorScheme.secondary,
                      size: 24,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 8, left: 8, right: 8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        titulo,
                        style: Get.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.black.withValues(alpha: 0.8),
                        ),
                        textAlign: TextAlign.left,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
