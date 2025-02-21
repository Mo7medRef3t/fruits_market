// ignore_for_file: invalid_required_positional_param

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class AuthRepo {
  Future<Either<Exception, UserCredential>> loginWithEmail(
      @required String loginEmail, @required String loginPassword);
  Future<Either<Exception, UserCredential?>> signUpWithEmail(
      @required String signUpEmail, @required String signUpPassword);

  Future<Either<Exception, UserCredential>> loginWithGoogle();
  Future completeInformation(
    @required String name,
    @required String phoneNumber,
    @required String address,
  );
}
