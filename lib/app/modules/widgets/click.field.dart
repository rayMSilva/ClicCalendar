// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum FieldStyle { normal, outlined, elevated }

class ClicField extends StatefulWidget {
  final String? label;
  final Icon? icon;
  final VoidCallback? rightIconFunction;
  final String? hint;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final bool enabled;
  final int maxLenght;
  final bool? hide;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final Function()? onDoubleTap;
  final Function()? onEditingComplete;
  final Function(String)? onChanged;
  final FieldStyle style;
  final bool? ignorePoiter;

  const ClicField({
    Key? key,
    this.label,
    this.hint,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.enabled = true,
    this.maxLenght = 60,
    this.hide,
    this.validator,
    this.onEditingComplete,
    this.onTap,
    this.onDoubleTap,
    this.onChanged,
    this.style = FieldStyle.normal,
    this.icon,
    this.rightIconFunction,
    this.ignorePoiter = false,
  }) : super(key: key);

  @override
  State<ClicField> createState() => _ClicFieldState();
}

class _ClicFieldState extends State<ClicField> {
  @override
  Widget build(BuildContext context) {
    double radius = 8;
    var inputDecoration = InputDecoration(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      alignLabelWithHint: true,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: AutoSizeText(
              widget.label ?? "",
              maxLines: 1,
              style: Get.theme.textTheme.titleMedium?.copyWith(
                color: Get.theme.colorScheme.tertiary,
                fontWeight: FontWeight.w700,
              ),
              minFontSize: 4,
            ),
          ),
        ],
      ),
      suffixIcon: widget.icon != null
          ? IconButton(
              onPressed: widget.rightIconFunction,
              icon: widget.icon ?? const SizedBox.shrink(),
            )
          : null,
      hintText: widget.hint,
      filled: true,
      fillColor: switch (widget.style) {
        FieldStyle.normal => Colors.grey[200],
        FieldStyle.outlined => Colors.transparent,
        FieldStyle.elevated => Colors.white,
      },
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Get.theme.colorScheme.tertiary),
        borderRadius: BorderRadius.circular(radius),
      ),
      border: switch (widget.style) {
        FieldStyle.normal => OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(radius),
          ),
        FieldStyle.outlined => OutlineInputBorder(
            borderSide: BorderSide(color: Get.theme.colorScheme.primary),
            borderRadius: BorderRadius.circular(radius),
          ),
        FieldStyle.elevated => OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(radius),
          ),
      },
      enabledBorder: switch (widget.style) {
        FieldStyle.normal => OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(radius),
          ),
        FieldStyle.outlined => OutlineInputBorder(
            borderSide: BorderSide(color: Get.theme.colorScheme.tertiary.withValues(alpha: 0.4)),
            borderRadius: BorderRadius.circular(radius),
          ),
        FieldStyle.elevated => OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(radius),
          ),
      },
      disabledBorder: switch (widget.style) {
        FieldStyle.normal => OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(radius),
          ),
        FieldStyle.outlined => OutlineInputBorder(
            borderSide: BorderSide(color: Get.theme.colorScheme.tertiary.withValues(alpha: 0.1)),
            borderRadius: BorderRadius.circular(radius),
          ),
        FieldStyle.elevated => OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(radius),
          ),
      },
    );
    return GestureDetector(
      onTap: widget.enabled
          ? () async {
              if (widget.focusNode != null) {
                widget.focusNode!.requestFocus();
              }
            }
          : null,
      onDoubleTap: widget.enabled ? widget.onDoubleTap : null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Material(
                  elevation: widget.style == FieldStyle.elevated ? 3 : 0,
                  borderRadius: BorderRadius.circular(radius),
                  child: IgnorePointer(
                    ignoring: widget.ignorePoiter!,
                    child: TextFormField(
                      focusNode: widget.focusNode,
                      style: const TextStyle(height: 1),
                      cursorColor: Get.theme.colorScheme.primary,
                      keyboardType: widget.keyboardType,
                      controller: widget.controller,
                      onEditingComplete: () async {
                        if (widget.onEditingComplete != null) {
                          await widget.onEditingComplete!();
                        }
                      },
                      textInputAction: TextInputAction.done,
                      onChanged: widget.onChanged,
                      decoration: inputDecoration,
                      obscureText: widget.hide ?? false,
                      cursorHeight: 20,
                      // maxLines: widget.maxLines ?? 1,
                      // maxLength: widget.maxLength,
                      enabled: widget.enabled,
                      // inputFormatters: widget.inputFormatter == null ? null : [widget.inputFormatter!],
                      validator: widget.validator,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
