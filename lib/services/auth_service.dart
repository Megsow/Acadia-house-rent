import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign up with email and password
  Future<User?> signUpUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      // Additional setup after successful sign up (e.g., send verification email)
      return user;
    } on FirebaseAuthException catch (e) {
      _handleFirebaseAuthException(e, context);
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in with email and password
  Future<User?> loginUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      return user;
    } on FirebaseAuthException catch (e) {
      _handleFirebaseAuthException(e, context);
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Private method to handle Firebase Auth exceptions
  void _handleFirebaseAuthException(
      FirebaseAuthException e, BuildContext context) {
    String errorMessage;
    switch (e.code) {
      case 'invalid-email':
        errorMessage = "Your email address appears to be malformed.";
        break;
      case 'wrong-password':
        errorMessage = "Your password is wrong.";
        break;
      case 'user-not-found':
        errorMessage = "User with this email doesn't exist.";
        break;
      case 'user-disabled':
        errorMessage = "User with this email has been disabled.";
        break;
      case 'too-many-requests':
        errorMessage = "Too many requests. Try again later.";
        break;
      case 'operation-not-allowed':
        errorMessage = "Signing in with Email and Password is not enabled.";
        break;
      default:
        errorMessage = "An undefined Error happened.";
    }
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(errorMessage)));
  }
}
