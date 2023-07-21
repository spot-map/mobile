import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_repository/location_repository.dart';
import 'package:ride_map/domain/bloc/spot/constants/spot_status.dart';
import 'package:ride_map/domain/bloc/spot/spot_bloc.dart';
import 'package:ride_map/presentation/ui/screen/add_spot/widget/add_spot_widget.dart';
import 'package:ride_map/presentation/ui/widget/snack/snack_bar.dart';

class SpotLayout extends StatelessWidget {
  const SpotLayout({Key? key, required this.currentUserLocation}) : super(key: key);

  final CurrentUserLocationEntity? currentUserLocation;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpotBloc, SpotState>(
      builder: (context, state) {
        if (state.status == SpotStatus.added) {
          snackBar('Спот отправлен на модерацию', context, false);
        }
        if (state.status == SpotStatus.error) {
          snackBar('Ошибка добавления спота', context, false);
        }

        return addSpotWidget(context, currentUserLocation);
      }
    );
  }
}
