import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:ride_map/internal/di/inject.dart';
import 'package:ride_map/presentation/common/router/routes.dart';
import 'package:ride_map/until/theme/base/app_color.dart';
import 'dart:io';

import '../cubit.dart';

class AddSpotWidget extends StatelessWidget {
  AddSpotWidget({super.key, required this.currentUserLocation});

  final LatLng currentUserLocation;

  final TextEditingController _name = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          body: BlocProvider<AddSpotCubit>(
        create: (context) => getIt(),
        child: BlocBuilder<AddSpotCubit, AddSpotState>(
          builder: (context, state) {
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
                                    textCapitalization: TextCapitalization.sentences,
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
                                          borderRadius: BorderRadius.circular(10),
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  TextFormField(
                                    textCapitalization: TextCapitalization.sentences,
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
                                          borderRadius: BorderRadius.circular(10),
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  TextFormField(
                                    textCapitalization: TextCapitalization.sentences,
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
                                          borderRadius: BorderRadius.circular(10),
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
                        final List<XFile> images = await picker.pickMultiImage();
                        if (images != null) {
                          context.read<AddSpotCubit>().onSelectMultipleImages(images);
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
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                itemCount: state.images!.length,
                                itemBuilder: (_, index) => GestureDetector(
                                      onTap: () {
                                        context.push(
                                          AppRoutes.fullImageScreen,
                                          extra: state.images![index].path,
                                        );
                                      },
                                      child: Container(
                                        height: 100,
                                        width: 120,
                                        margin: const EdgeInsets.only(left: 3.0, right: 3.0),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(12.0),
                                            image: DecorationImage(
                                              image: FileImage(File(state.images![index].path)),
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
                    MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        height: 50,
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AddSpotCubit>().onAddStop(_name.text, _address.text, _description.text,
                                currentUserLocation.latitude, currentUserLocation.longitude);
                          }
                        },
                        child: state.isLoading
                            ? const CircularProgressIndicator()
                            : Text(
                                'Добавить',
                                style: TextStyle(color: context.colors.textColor),
                              ))
                  ],
                ),
              ),
            );
          },
        ),
      )),
    );
  }
}
