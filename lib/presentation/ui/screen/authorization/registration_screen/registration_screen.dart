import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/domain/bloc/login/login_bloc.dart';
import 'package:ride_map/untils/dev.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameCotroller = TextEditingController();
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
                      borderSide: BorderSide(color: Color(0xff4777ef)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    hintText: 'Имя',
                  ),
                  keyboardType: TextInputType.name,
                  controller: _nameCotroller)),
          const SizedBox(
            height: 30,
          ),

          Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xff4777ef)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    hintText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailCotroller)),
          const SizedBox(
            height: 30,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color(0xff4777ef)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    hintText: 'Пароль',
                  ),
                  keyboardType: TextInputType.text,
                  controller: _passwordCotroller)),
          SizedBox(
            width: 327,
            child: ElevatedButton(
              onPressed: () {
                Dev.log('WORK');
                Dev.log('${ _nameCotroller.text} ${ _emailCotroller.text} ${_passwordCotroller.text}');
                BlocProvider.of<LoginBloc>(context).add(RegistrationEvent(
                   name: _nameCotroller.text,
                   email: _emailCotroller.text,
                   password: _passwordCotroller.text));
              },
              child: const Text('Регистрация'),
            ),
          )
        ],
      ),
    );
  }
}
