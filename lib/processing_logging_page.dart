import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stoptheblues/page_navigator.dart';
import 'package:stoptheblues/providers/user_provider.dart';
import 'package:stoptheblues/services/database_service.dart';

import 'login_page.dart';

class ProcessingLoggingPage extends StatefulWidget {
  @override
  State<ProcessingLoggingPage> createState() => _LoggingPageState();
}

class _LoggingPageState extends State<ProcessingLoggingPage> {

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);

    Future<void> setUpData() async{
      DatabaseService _dbS = DatabaseService();
      print('setting upo data');
      await _dbS.setUserDataFromGoogle(FirebaseAuth.instance.currentUser!);
      print('dodano do bazy');
      await userProvider.fetchUserData(FirebaseAuth.instance.currentUser!.email!);
    }

    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return FutureBuilder
              (
              future: setUpData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.connectionState == ConnectionState.done) {
                  print(userProvider.user);
                  if (userProvider.user == null) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          Text('Tworzenie użytkownika', style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,)
                        ],
                      ),
                    );
                  }
                  return PageNavigator();
                } else {
                  return const Center(child: Text('Coś poszło nie tak!'));
                }
              },
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Coś poszło nie tak!'));
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}