import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/domain/bloc/spot_by_id/spot_by_id_cubit.dart';
import 'package:ride_map/presentation/ui/widget/bottom_sheet/widget/by_id_widget.dart';

class SpotByIdModal extends StatelessWidget {
  const SpotByIdModal({super.key});

  static const String path = 'mapById';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpotByIdCubit, SpotByIdState>(
      builder: (context, state) {
        return state.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(top: false, bottom: false, child: ByIdWidget(model: state.mapByIdModel!));
      },
    );
  }
}
