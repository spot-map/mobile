import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/presentation/ui/screens/authorization/cubit.dart';
import 'package:ride_map/presentation/ui/screens/authorization/widget/auth_text_field.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key, required this.state}) : super(key: key);

  final AuthState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 35, right: 35),
                    child: Column(
                      children: [
                        AuthTextField(
                            hinText: 'Email',
                            controller: context.read<AuthCubit>().emailController,
                            isObscureText: false,
                            errorText: state.emailError,
                            onChanged: context.read<AuthCubit>().onEmailChanged,
                            keyboardType: TextInputType.emailAddress),
                        const SizedBox(
                          height: 30,
                        ),
                        AuthTextField(
                            hinText: 'Пароль',
                            controller: context.read<AuthCubit>().passwordController,
                            isObscureText: true,
                            errorText: state.passwordError,
                            onChanged: context.read<AuthCubit>().onPasswordChanged,
                            keyboardType: TextInputType.visiblePassword),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Вход',
                              style: TextStyle(fontSize: 27, fontWeight: FontWeight.w700),
                            ),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: const Color(0xff4c505b),
                              child: IconButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    context.read<AuthCubit>().onLogin();
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward,
                                  )),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
