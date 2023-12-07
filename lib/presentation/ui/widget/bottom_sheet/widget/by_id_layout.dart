import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/domain/bloc/spot_by_id/spot_by_id_cubit.dart';
import 'package:ride_map/presentation/ui/widget/bottom_sheet/widget/by_id_widget.dart';

class ByIdLayout extends StatelessWidget {
  ByIdLayout({Key? key, this.id}) : super(key: key);
  int? id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SpotByIdCubit>(
      create: (context) => SpotByIdCubit(
        id: id!,
      ),
      child: BlocBuilder<SpotByIdCubit, SpotByIdState>(
        builder: (context, state) {
          return state.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ByIdWidget(model: state.mapByIdModel!);
        },
      ),
    );
  }
}
