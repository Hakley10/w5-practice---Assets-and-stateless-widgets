import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, disabled }
enum IconPosition { left, right } 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Custom buttons')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: const [
              CustomButton(
                label: 'Submit',
                icon: Icons.check,
                type: ButtonType.primary,
                iconPosition: IconPosition.left,
              ),
              CustomButton(
                label: 'Time',
                icon: Icons.access_time,
                type: ButtonType.secondary,
                iconPosition: IconPosition.right,
              ),
              CustomButton(
                label: 'Account',
                icon: Icons.account_tree,
                type: ButtonType.disabled,
                iconPosition: IconPosition.right,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final ButtonType type;
  final IconPosition iconPosition;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.type = ButtonType.primary,
    this.iconPosition = IconPosition.left,
  });

  Color _getColor() {
    switch (type) {
      case ButtonType.primary:
        return Colors.blue;
      case ButtonType.secondary:
        return Colors.green;
      case ButtonType.disabled:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getColor();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: type == ButtonType.disabled ? null : () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (iconPosition == IconPosition.left) ...[
              Icon(icon, color: const Color.fromARGB(255, 112, 112, 112)),
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: const TextStyle(color: Color.fromARGB(255, 112, 112, 112), fontSize: 16),
            ),
            if (iconPosition == IconPosition.right) ...[
              const SizedBox(width: 8),
              Icon(icon, color: const Color.fromARGB(255, 112, 112, 112)),
            ],
          ],
        ),
      ),
    );
  }
}
