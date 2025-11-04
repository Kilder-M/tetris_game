import 'package:flutter/material.dart';

class GameButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color color;
  final double size;

  const GameButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.color = Colors.white,
    this.size = 60,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black87,
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.6),
                blurRadius: 12,
                spreadRadius: 1,
              ),
            ],
            border: Border.all(color: color, width: 3),
          ),
          child: Icon(icon, color: color, size: size * 0.6),
        ),
      ),
    );
  }
}
