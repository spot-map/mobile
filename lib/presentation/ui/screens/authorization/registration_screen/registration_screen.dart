import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/presentation/ui/screens/authorization/cubit.dart';
import 'package:ride_map/presentation/ui/widget/text/text_field.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key, required this.state}) : super(key: key);
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
                        DefaultTextFiled(
                            hinText: 'Имя',
                            controller: context.read<AuthCubit>().nameController,
                            isObscureText: false,
                            errorText: state.nameError,
                            onChanged: context.read<AuthCubit>().onNameChanged,
                            keyboardType: TextInputType.name),
                        const SizedBox(
                          height: 30,
                        ),
                        DefaultTextFiled(
                            hinText: 'Email',
                            controller: context.read<AuthCubit>().emailRegistrationController,
                            isObscureText: false,
                            errorText: state.emailRegistrationError,
                            onChanged: context.read<AuthCubit>().onEmailRegistrationChanged,
                            keyboardType: TextInputType.emailAddress),
                        const SizedBox(
                          height: 30,
                        ),
                        DefaultTextFiled(
                            hinText: 'Пароль',
                            controller: context.read<AuthCubit>().passwordRegistrationController,
                            isObscureText: false,
                            errorText: state.passwordRegistrationError,
                            onChanged: context.read<AuthCubit>().onPasswordRegistrationChanged,
                            keyboardType: TextInputType.visiblePassword),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Регистрация',
                              style: TextStyle(fontSize: 27, fontWeight: FontWeight.w700),
                            ),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: const Color(0xff4c505b),
                              child: IconButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    context.read<AuthCubit>().onRegistration();
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
