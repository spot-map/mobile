import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/domain/bloc/spot_cubit/map_cubit.dart';
import 'package:ride_map/presentation/ui/screen/list/widget/list_widget.dart';
import 'package:ride_map/until/dev.dart';
import '../../../widget/map/location_error/location_error_widget.dart';

class ListLayout extends StatelessWidget {
  const ListLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: true,
      body: BlocBuilder<MapCubit, MapState>(

          builder: (context, state) {
            return state.isLoading ? const Center(
              child: CircularProgressIndicator(),
            ) : listWidget(context, state.mapModel!);


          },
      ),
    );
  }
}
