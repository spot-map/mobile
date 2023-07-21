import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_repository/location_repository.dart';

import '../../../../../domain/bloc/spot/spot_bloc.dart';
import '../../../../../untils/preferences/preferences.dart';
import '../../../widget/snack/snack_bar.dart';

Widget addSpotWidget(
    BuildContext context, CurrentUserLocationEntity? currentUserLocation) {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _description = TextEditingController();

  return SingleChildScrollView(
    child: Container(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 35, right: 35),
            child: Column(
              children: [
                TextField(
                  style: const TextStyle(color: Colors.black),
                  controller: _name,
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Название",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  style: const TextStyle(color: Colors.black),
                  controller: _address,
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Адрес",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  style: const TextStyle(color: Colors.black),
                  controller: _description,
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Описание",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (Prefs.getString('token') != null) {
                  BlocProvider.of<SpotBloc>(context).add(AddSpotEvent(
                      _name.text,
                      _address.text,
                      _description.text,
                      currentUserLocation!.latitude,
                      currentUserLocation.longitude));
                } else {
                  snackBar('Для необходимо авторизироваться', context, true);
                }
              },
              child: const Text('Добавить'))
        ],
      ),
    ),
  );
}
