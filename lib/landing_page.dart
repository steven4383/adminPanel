import 'package:admin_panel_jcet/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      initialData: FirebaseAuth.instance.currentUser,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            sideBuilder: (context, constraints) {
              return const FlutterLogo(
                size: 300,
              );
            },
            subtitleBuilder: (context, action) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  action == AuthAction.signIn
                      ? 'Welcome to JCET Admin Please sign in to continue.'
                      : 'Welcome to JCET Admin Please create an account to continue',
                ),
              );
            },
            providerConfigs: [const EmailProviderConfiguration()],
          );
        }

        return const HomeScreen();
      },
    );
  }
}
