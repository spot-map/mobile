import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/domain/bloc/spot/constants/spot_status.dart';
import 'package:ride_map/domain/bloc/spot/spot_bloc.dart';
import 'package:ride_map/presentation/ui/screen/list/widget/list_widget.dart';
import 'package:ride_map/until/dev.dart';

import '../../../widget/map/location_error/location_error_widget.dart';

class ListLayout extends StatelessWidget {
  const ListLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: true,
      body: BlocBuilder<SpotBloc, SpotState>(

          builder: (context, state) {
            if (state.status == SpotStatus.success) {
              Dev.log('SPOTS ${state.spot!.data.length}');
              return listWidget(context, state.spot!);
            }
            if (state.status == SpotStatus.error) {
              return LocationErrorWidget(
                errorMessage: state.errorMessage,
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
      ),
    );
  }
}
