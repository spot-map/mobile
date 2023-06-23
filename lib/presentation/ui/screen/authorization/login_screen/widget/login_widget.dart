
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/domain/bloc/login/login_bloc.dart';
import 'package:ride_map/untils/theme/appColors.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailCotroller = TextEditingController();
    final TextEditingController _passwordCotroller = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, top: 50),
              child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:  BorderSide(color: Color(0xff4777ef)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    hintText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailCotroller
              )),
          const SizedBox(
            height: 30,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:   BorderSide(color: Color(0xff4777ef)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    hintText: 'Пароль',
                  ),
                  keyboardType: TextInputType.text,
                  controller: _passwordCotroller
              )),
          SizedBox(
            width: 327,
            child: ElevatedButton(
              onPressed: () {
              BlocProvider.of<LoginBloc>(context).add(LoginUserEvent(_emailCotroller.text, _passwordCotroller.text));
            }, child: const Text('Войти'),),
          )
        ],
      ),
    );
  }
}
