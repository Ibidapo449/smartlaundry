import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iklin/app/view/widgets/app_loading_dialog.dart';
import 'package:iklin/core/errors/errors.dart';
import 'package:iklin/core/utils/flushbar_notification.dart';
import 'package:iklin/features/auth/domain/usecases/activate_basic_signup.dart';
import 'package:iklin/features/auth/domain/usecases/basic_signup_usecase.dart';
import 'package:iklin/features/auth/presentation/widgets/code_scent_modal.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthNotifier extends ChangeNotifier {
  AuthNotifier({
    required this.activateBasicSignupUsecase,
    required this.basicSignupUsecase,
  });

  final ActivateBasicSignupUsecase activateBasicSignupUsecase;
  final BasicSignup basicSignupUsecase;
  Future<void> activateBasicSignnup(
    BuildContext context, {
    required String email,
    required String otp,
  }) async {
    final navigator = Navigator.of(context);
    unawaited(showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: const AppLoadingDialog(
              text: 'Verifying email',
            ),
          );
        }));

    final response = await activateBasicSignupUsecase(
        ActivateBasicSignupParams(email: email, otp: otp));
    response.fold(
      (l) {
        navigator.pop();
        FlushbarNotification.showErrorMessage(
          context,
          title: 'Email verification fail!!',
          message: FailureToMessage.mapFailureToMessage(l),
        );
      },
      (r) {
        navigator.pop();

        FlushbarNotification.showSuccessMessage(
          context,
          message: 'Verification successful',
        );
      },
    );
  }

  Future<void> basicSignup(
    BuildContext context, {
    required String email,
  }) async {
    final navigator = Navigator.of(context);
    unawaited(showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: const AppLoadingDialog(
              text: 'Signing in',
            ),
          );
        }));
    final response = await basicSignupUsecase(
      BasicSignupParams(email: email),
    );
    response.fold(
      (l) {
        navigator.pop();
        FlushbarNotification.showErrorMessage(
          context,
          title: 'Signup fail!',
          message: FailureToMessage.mapFailureToMessage(l),
        );
      },
      (r) {
        navigator.pop();
        showModalBottomSheet(
            backgroundColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            context: context,
            builder: (context) {
              return CodeSentModal(
                email: email,
              );
            });
        FlushbarNotification.showSuccessMessage(
          context,
          message: 'Registration Succesful',
        );
      },
    );
  }
}
