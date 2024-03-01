import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:ride_map/presentation/ui/screens/add_spot/widget/add_spot_widget.dart';
import 'package:ride_map/presentation/ui/widget/app_bar/app_bar.dart';
import 'package:ride_map/presentation/ui/widget/page/common_scaffold.dart';
import 'package:ride_map/presentation/ui/widget/snack/snack_bar.dart';

import 'cubit.dart';

class AddSpotScreen extends StatelessWidget {
  const AddSpotScreen({Key? key, required this.currentUserLocation})
      : super(key: key);

  final LatLng currentUserLocation;
  static const path = 'addSpot';

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appBar: const MyAppBar(
        title: 'Добавить спот',
        size: 50,
        automaticallyImplyLeading: true,
        centerTitle: false,
      ),
      message: context.read<AddSpotCubit>().messageStream,
      onMessage: (message) {
        if (message == AddSpotState.showSuccessMessage) {
          snackBar(
              message: 'Спот отправлен на модерацию',
              context: context,
              isError: false);
        } else if (message == AddSpotState.showErrorMessage) {
          snackBar(
              message: 'Ошибка добавления спота',
              context: context,
              isError: false);
        } else if (message == AddSpotState.notAuthorized) {
          snackBar(
              message: 'Необходимо авторизироваться',
              context: context,
              isError: true);
        }
      },
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: false,
      child: AddSpotWidget(
        currentUserLocation: currentUserLocation,
      ),
    );
  }
}
