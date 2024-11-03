import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wear_weather/presentation/common/persistent_navbar.dart';

class AuthServices {
  Future<void> signup({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => PersistentNavbar()),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == "weak-password") {
        message = "The password provided is too weak";
      } else if (e.code == "email-already-in-use") {
        message = "An account already exists with that email";
      }
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR);
    }
  }

  Future<void> signin({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => PersistentNavbar()),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == "user-not-found") {
        message = "User not found";
      } else if (e.code == "wrong-password") {
        message = "Wrong password";
      }
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR);
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      // Step 1: Trigger Google Sign-In
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        // If the user cancels the sign-in process
        throw Exception("Sign in canceled by user");
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Navigate to the main page upon successful login
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => PersistentNavbar()),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      // Firebase-specific errors
      String errorMessage = '';
      switch (e.code) {
        case 'account-exists-with-different-credential':
          errorMessage =
              "An account already exists with a different credential.";
          break;
        case 'invalid-credential':
          errorMessage = "The provided credential is invalid.";
          break;
        case 'user-disabled':
          errorMessage = "The user has been disabled.";
          break;
        case 'operation-not-allowed':
          errorMessage = "Google sign-in is not enabled in Firebase.";
          break;
        case 'user-not-found':
          errorMessage = "No user found for this Google account.";
          break;
        default:
          errorMessage = "An unexpected error occurred: ${e.message}";
      }
      Fluttertoast.showToast(msg: errorMessage, toastLength: Toast.LENGTH_LONG);
    } catch (e) {
      // Handle other errors, such as network issues or Google sign-in errors
      Fluttertoast.showToast(
        msg: "An error occurred: ${e.toString()}",
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}
