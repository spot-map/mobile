import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/presentation/common/cubit/spot/cubit.dart';
import 'package:ride_map/presentation/ui/screen/list/widget/list_widget.dart';
import 'package:ride_map/presentation/ui/widget/app_bar/app_bar.dart';

class ListSpotScreen extends StatelessWidget {
  const ListSpotScreen({Key? key}) : super(key: key);
  static const path = 'listSpot';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const MyAppBar(
        automaticallyImplyLeading: true,
        centerTitle: false,
        size: 50,
        title: 'Список спотов',
      ),
      body: BlocBuilder<MapCubit, MapState>(
        builder: (context, state) {
          return state.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SpotList(model: state.mapModel!);
        },
      ),
    );
  }
}
