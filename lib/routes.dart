import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:house_rent/screen/auth/login.dart';
import 'package:house_rent/screen/auth/signup.dart';
import 'package:house_rent/screen/auth/home_screen.dart';
import 'package:house_rent/screen/home/home.dart';

// Define the routes of the application
final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return HomePage(); // User is signed in
            }
            return LoginScreen(); // User is not signed in
          }
          return Scaffold(
              body:
                  Center(child: CircularProgressIndicator())); // Loading state
        },
      ),
  '/login': (context) => LoginScreen(),
  '/signup': (context) => SignupScreen(),
  '/home': (context) => HomePage(),
};
