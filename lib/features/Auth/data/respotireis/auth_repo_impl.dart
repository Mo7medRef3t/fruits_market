// ignore_for_file: use_build_context_synchronously

import 'package:fruits_market/features/Auth/domain/respotireis/auth_repo.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future completeInformation(String name, String phoneNumber, String address) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, UserCredential>> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return Right(
          await FirebaseAuth.instance.signInWithCredential(credential));
    } catch (e) {
      return left(Exception('Error during Google Sign-In: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Exception ,UserCredential?>> signUpWithEmail(signUpEmail, signUpPassword) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: signUpEmail,
        password: signUpPassword,
      );
      User? user = userCredential.user;


      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        await FirebaseAuth.instance.signOut();
        return const Right(null);
      }

      return Left(Exception("Sign up failed please comeback again"));
    } on FirebaseAuthException catch (e) {
      return Left(Exception(e.message ?? 'Autentication failed'));
    }
  }

  @override
  Future<Either<Exception ,UserCredential>> loginWithEmail(loginEmail, loginPassword) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: loginEmail, password: loginPassword);
      User? user = userCredential.user;

      
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        await FirebaseAuth.instance.signOut();
        return Left(Exception("Please verify your email before logging in."));
      } else if (user != null && user.emailVerified) {
        return Right(userCredential);
      }

      return Left(Exception("Login failed"));
    } on FirebaseAuthException catch (e) {
      return Left(Exception(e.message ?? 'Authentication failed'));
    }
  }
}
