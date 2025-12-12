import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/core/utils/enums.dart';
import 'package:task_manager/features/auth/presentation/notifiers/auth_notifier.dart';
import 'package:task_manager/features/auth/presentation/widgets/login_btn.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: .2, horizontal: 10),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LoginButton(
                type: LoginButtonType.anonymous,
                onPressed: () async {
                  final authNotifier = ref.read(authNotifierProvider.notifier);
                  await authNotifier.signInAnonymous();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
