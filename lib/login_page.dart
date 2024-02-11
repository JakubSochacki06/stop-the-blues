import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:provider/provider.dart';
import 'package:stoptheblues/processing_logging_page.dart';
import 'package:stoptheblues/providers/user_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context, listen: false);
    return FlutterLogin(
      theme: LoginTheme(
        primaryColor: Colors.white,
        accentColor: Color(0xFF1185DE),
        cardTheme: CardTheme(
          color: Color(0xFF30AAFF)
        ),
        buttonTheme: LoginButtonTheme(
          backgroundColor: Color(0xFF1185DE)
        )
      ),
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ProcessingLoggingPage(),
        ));
      },
      title: 'Stop the blues',
      logo: AssetImage('assets/logo.png'),
      onSignup: (string) async{
        await provider.registerWithEmailPassword(string.name!, string.password!);
      },
      onLogin: (string) async{
        await provider.loginWithEmailPassword(string.name, string.password);
      },
      onRecoverPassword: (string){},
    );
  }
}
