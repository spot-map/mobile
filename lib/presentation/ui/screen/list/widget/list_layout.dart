import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/presentation/common/cubit/spot/cubit.dart';
import 'package:ride_map/presentation/ui/screen/list/widget/list_widget.dart';

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
