import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:ride_map/presentation/common/router/routes.dart';
import 'package:ride_map/presentation/common/theme/base/app_color.dart';
import 'package:ride_map/presentation/ui/widget/text/text_field.dart';
import 'dart:io';

import '../cubit.dart';

class AddSpotWidget extends StatelessWidget {
  AddSpotWidget({super.key, required this.currentUserLocation});

  final LatLng currentUserLocation;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(body: BlocBuilder<AddSpotCubit, AddSpotState>(
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
                        Column(
                          children: [
                            DefaultTextFiled(
                                controller: context.read<AddSpotCubit>().nameController,
                                hinText: 'Название',
                                isObscureText: false,
                                errorText: state.nameError,
                                onChanged: context.read<AddSpotCubit>().onSpotNameChanged,
                                keyboardType: TextInputType.name),
                            const SizedBox(
                              height: 30,
                            ),
                            DefaultTextFiled(
                                controller: context.read<AddSpotCubit>().addressController,
                                hinText: 'Адрес',
                                isObscureText: false,
                                errorText: state.addressError,
                                onChanged: context.read<AddSpotCubit>().onAddressChanged,
                                keyboardType: TextInputType.name),
                            const SizedBox(
                              height: 30,
                            ),
                            DefaultTextFiled(
                                controller: context.read<AddSpotCubit>().descriptionController,
                                hinText: 'Адрес',
                                isObscureText: false,
                                errorText: state.descriptionError,
                                onChanged: context.read<AddSpotCubit>().onDescriptionChanged,
                                keyboardType: TextInputType.name),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        )
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
                          context
                              .read<AddSpotCubit>()
                              .onAddStop(currentUserLocation.latitude, currentUserLocation.longitude);
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
      )),
    );
  }
}
