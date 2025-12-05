import 'package:flutter/material.dart';

class ClicButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final String? title;
  final Size? minimumSize;
  final Color backgroundColor;

  const ClicButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.backgroundColor,
    this.minimumSize,
  });

  @override
  State<ClicButton> createState() => _ClicButtonState();
}

class _ClicButtonState extends State<ClicButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.backgroundColor,
        minimumSize: widget.minimumSize,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Text(
        widget.title!,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
