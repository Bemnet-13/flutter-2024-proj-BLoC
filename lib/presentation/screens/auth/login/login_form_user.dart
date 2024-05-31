import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:FantasyE/application/auth/bloc/auth_logic_bloc.dart';
import '../../../widgets/colors.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/text_styles.dart';
import '../../../widgets/text_fields.dart';
import '../../../../injection.dart';
import '../../../widgets/chips.dart';
import 'package:flutter/material.dart';
import '../../../../application/auth/auth_bloc.dart';

class LoginPlayer extends StatelessWidget {
  const LoginPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginFormBloc>(
          create: (BuildContext context) => getIt<LoginFormBloc>()
            ..add(
              LoginFormEvent.roleSelected('PLAYER'),
            ),
        ),
        BlocProvider<SignupFormBloc>(
          create: (BuildContext context) => getIt<SignupFormBloc>(),
        ),
        BlocProvider<AuthLogicBloc>(
          create: (BuildContext context) => getIt<AuthLogicBloc>(),
        ),
      ],
      child: LoginFormPlayer(),
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
          (failure) {},
          (_) {},
        ),
      );
    }, builder: (context, state) {
      return Scaffold(
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
                            isLoggingIn: true,
                          ),
                          PasswordFieldEntry(
                            isLoggingIn: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    RegisterButton("LOGIN ", CustomColors.divider,
                        '/player_dashboard', true),
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
