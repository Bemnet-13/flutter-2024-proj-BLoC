import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/colors.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/text_styles.dart';
import '../../../widgets/text_fields.dart';
import '../../../widgets/chips.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../../../../application/auth/auth_form/auth_bloc.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupFormBloc, SignupFormState>(
        listener: (context, state) {
      state.authFailureOrSuccessOption.fold(
        () {},
        (either) => either.fold(
          (failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: failure.maybeMap(
                    cancelledByUser: (_) => const Text('Cancelled'),
                    serverError: (_) => const Text('Server Error'),
                    emailAlreadyInUse: (_) =>
                        const Text('Email Already In Use. Try another email'),
                    invalidEmailAndPasswordCombination: (_) =>
                        const Text('Invalid Email or Password'),
                    invalidRoleUsedInLogin: (_) =>
                        const Text('Invalid Role. Use defined these roles'),
                    orElse: () =>
                        const Text("Could not sign you up. Try again.")),
              ),
            );
          },
          (_) {
            context.go('/login');

            // ScaffoldMessenger.of(context).showSnackBar(
              // SnackBar(
                // content: const Text('Registration successful'),
                // action: SnackBarAction(
                  // label: 'Go To Login',
                  // onPressed: () {
                  // },
                // ),
              // ),
            // );
          },
        ),
      );
    }, builder: (context, state) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              './assets/Fantasy_Ethiopia_Logo_Transparent.png',
              width: 350,
              height: 350,
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
                    child: Text(
                      "Signup",
                      style: StyledText.loginStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: RoleChoiceChip(),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Form(
                    autovalidateMode: state.showErrorMessages
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                    child: const Column(
                      children: [
                        NameFieldEntry(
                          key: const Key('nameField'),
                        ),
                        EmailFieldEntry(
                          key: const Key('emailField'),
                          isLoggingIn: false),
                        PasswordFieldEntry(
                          key: const Key('passwordField'),
                          isLoggingIn: false),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AuthButton(
                  key: const Key('signupButton'),

                    "SIGNUP ",
                    CustomColors.darkPrimary,
                    '/login',
                    false,
                    () => context.read<SignupFormBloc>().add(
                          const SignupFormEvent
                              .registerWithEmailAndPasswordPressed(),
                        ),
                  ),
                  const BottomText(
                      "Already have an account?", "Login", '/login')
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
