import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/enums.dart';

class LoginButton extends StatelessWidget {
  final LoginButtonType type;
  final VoidCallback onPressed;

  const LoginButton({super.key, required this.type, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    late String text;
    late Widget icon;
    late Color bgColor;
    late Color fgColor;

    switch (type) {
      case LoginButtonType.google:
        text = "Sign in with Google";
        icon = const Icon(FontAwesomeIcons.google, size: 22);
        bgColor = Colors.white;
        fgColor = Colors.black87;
        break;

      case LoginButtonType.anonymous:
        text = "Continue as Guest";
        icon = const Icon(Icons.person_outline, size: 22);
        bgColor = Theme.of(context).colorScheme.primary;
        fgColor = Theme.of(context).colorScheme.onPrimary;
        break;
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
