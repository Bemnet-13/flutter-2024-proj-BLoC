import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:FantasyE/application/auth/auth_logic/auth_logic_bloc.dart';
import '../../../widgets/colors.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/text_styles.dart';
import '../../../widgets/text_fields.dart';
import '../../../../injection.dart';
import '../../../widgets/chips.dart';
import 'package:flutter/material.dart';
import '../../../../application/auth/auth_form/auth_bloc.dart';

class LoginPlayer extends StatelessWidget {
  const LoginPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginFormBloc>(
          create: (BuildContext context) => getIt<LoginFormBloc>()
            ..add(
              const LoginFormEvent.roleSelected('PLAYER'),
            ),
        ),
        BlocProvider<SignupFormBloc>(
          create: (BuildContext context) => getIt<SignupFormBloc>(),
        ),
      ],
      child: const LoginFormPlayer(),
    );
  }
}

class LoginFormPlayer extends StatelessWidget {
  const LoginFormPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginFormBloc, LoginFormState>(
        listener: (context, state) {
      state.authFailureOrSuccessOption.fold(
        () {},
        (either) => either.fold(
          (failure) {
            print('Snackbar here with failure');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: failure.map(
                  cancelledByUser: (_) => const Text('Cancelled'),
                  serverError: (_) => const Text('Server Error'),
                  emailAlreadyInUse: (_) =>
                      const Text('Email Already In Use. Try another email'),
                  invalidEmailAndPasswordCombination: (_) =>
                      const Text('Invalid Email or Password'),
                  invalidRoleUsedInLogin: (_) =>
                      const Text('Invalid Role. Use defined these roles'),
                  accountSuspended: (_) =>
                      const Text("Your account has been suspended"),
                ),
              ),
            );
          },
          (_) {
            print('Snackbar here with success');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Login successful'),
                action: SnackBarAction(
                  label: 'Go To Dashboard',
                  onPressed: () {
                    context.go('/player_dashboard');
                    context.read<AuthLogicBloc>().add(
                          const AuthLogicEvent.loginRequestedAsPlayer(),
                        );
                  },
                ),
              ),
            );
          },
        ),
      );
    }, builder: (context, state) {
      return Scaffold(
        backgroundColor: CustomColors.scaffoldBackground,
        body: SingleChildScrollView(
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
                        "Login as a Player",
                        style: StyledText.loginStyle,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
                      child: Text(
                        "Please sign in to continue",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20.0),
                      ),
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
                          EmailFieldEntry(
                            key: const Key('emailField'),
                            isLoggingIn: true,
                          ),
                          PasswordFieldEntry(
                            key: const Key('passwordField'),
                            isLoggingIn: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    AuthButton(
                      key: const Key('loginButton'),
                      "LOGIN ", CustomColors.darkPrimary,
                        '/player_dashboard', true, () {
                      context.read<LoginFormBloc>().add(
                            const LoginFormEvent
                                .loginWithEmailAndPasswordPressed(),
                          );
                    }),
                    const BottomText(
                        "Don't you have an account?", "Sign Up", '/signup')
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
