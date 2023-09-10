import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location_repository/location_repository.dart';
import 'package:ride_map/domain/bloc/spot/constants/spot_status.dart';
import 'dart:io';
import '../../../../../domain/bloc/spot/spot_bloc.dart';
import '../../../../../until/dev.dart';
import '../../../../../until/preferences/preferences.dart';
import '../../../widget/full_screen_image/full_screen_image.dart';
import '../../../widget/snack/snack_bar.dart';

Widget addSpotWidget(BuildContext context,
    {required CurrentUserLocationEntity? currentUserLocation}) {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  return GestureDetector(
    onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
    child: Scaffold(
      body: BlocBuilder<SpotBloc, SpotState>(
        builder: (context, state) {
          if (state.status == SpotStatus.added) {
            snackBar(
                'Спот отправлен на модерацию', context, false);
          }
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    child: Column(
                      children: [
                        Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  style: const TextStyle(color: Colors.black),
                                  controller: _name,
                                  key: const Key('addName'),
                                  validator: (value) {
                                    if (value == '') {
                                      return 'Введите название спота';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: "Название",
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10),
                                      )),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  style: const TextStyle(color: Colors.black),
                                  controller: _address,
                                  key: const Key('addAddress'),
                                  validator: (value) {
                                    if (value == '') {
                                      return 'Введите адрес спота';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: "Адрес",
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10),
                                      )),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  style: const TextStyle(color: Colors.black),
                                  controller: _description,
                                  key: const Key('addDescription'),
                                  validator: (value) {
                                    if (value == '') {
                                      return 'Введите описание спота';
                                    } else if (value!.length < 10) {
                                      return 'Описание не может быть меньше 10 символов';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: "Описание",
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10),
                                      )),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      final ImagePicker picker = ImagePicker();
                      final List<XFile>? images =
                          await picker.pickMultiImage();
                      if (images != null) {
                        BlocProvider.of<SpotBloc>(context)
                            .add(SelectMultipleImageEvent(images));
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: state.images != null
                          ? ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5),
                              itemCount: state.images!.length,
                              itemBuilder: (_, index) => GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  FullScreenPage(
                                                    path: state
                                                        .images![index].path,
                                                    dark: Prefs.getBool(
                                                        'theme')!,
                                                  )));
                                    },
                                    child: Container(
                                      height: 100,
                                      width: 120,
                                      margin: const EdgeInsets.only(
                                          left: 3.0, right: 3.0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          image: DecorationImage(
                                            image: FileImage(File(
                                                state.images![index].path)),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ))
                          : const Icon(
                              Icons.photo_camera,
                              size: 80,
                              color: Colors.grey,
                            ),
                    ),
                  ),
                  const SizedBox(height: 20),
                 state.status == SpotStatus.loading ? CircularProgressIndicator() : MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      height: 50,
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      onPressed: () {
                        if (Prefs.getString('token') != null) {
                          if (_formKey.currentState!.validate()) {
                            Dev.log(state.status);
                            BlocProvider.of<SpotBloc>(context)..add(
                                AddSpotEvent(
                                    _name.text,
                                    _address.text,
                                    _description.text,
                                    currentUserLocation!.latitude,
                                    currentUserLocation.longitude));
                            Dev.log(state.status);
                          }
                        } else {
                          snackBar(
                              'Необходимо авторизироваться', context, true);
                        }
                      },
                      child: Text(
                        'Добавить',
                        style: TextStyle(
                            color: Prefs.getBool('theme')!
                                ? Colors.black
                                : Colors.white),
                      ))
                ],
              ),
            ),
          );
        },
      ),
    ),
  );
}
