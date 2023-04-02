import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(45),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('Авторизация',
              style: TextStyle(fontSize: 20, color: Colors.black)),
        ),
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, top: 50),
              child: TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Color(0xff4777ef)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  hintText: 'Фамилия',
                ),
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                // controller: lastnameController
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
                    borderSide: const BorderSide(color: Color(0xff4777ef)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  hintText: 'Фамилия',
                ),
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                // controller: lastnameController
              )),
          ElevatedButton(onPressed: () {}, child: const Text('Войти'),)
        ],
      ),
    );
  }
}
