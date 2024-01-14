import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/presentation/ui/screen/spot_by_id/cubit.dart';
import 'package:ride_map/presentation/ui/screen/favorite/cubit.dart';
import 'package:ride_map/presentation/ui/screen/spot_by_id/widget/reactions/reactions_bottom.dart';
import 'package:ride_map/presentation/ui/widget/app_bar/app_bar.dart';
import 'package:ride_map/presentation/ui/widget/snack/snack_bar.dart';
import 'package:ride_map/until/preferences/preferences.dart';

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
            : SafeArea(
                top: false,
                bottom: false,
                child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  appBar: MyAppBar(
                    title: state.mapByIdModel!.data!.name!,
                    size: 50,
                    automaticallyImplyLeading: true,
                    centerTitle: false,
                    widgetRight: [
                      IconButton(
                          onPressed: () {
                            if (Prefs.getString('token') == null) {
                              snackBar(message: 'Выполните авторизацию', context: context, isError: true);
                            } else {
                              context.read<FavoriteCubit>().onAddSpotToFavorite(state.mapByIdModel!.data!.id!);
                            }
                          },
                          icon: Icon(Icons.favorite, color: state.mapByIdModel!.data!.isInFavorite! ? Colors.red : Colors.grey)),
                      IconButton(
                          onPressed: () {
                            reactionsBottomSheet(context, state.mapByIdModel!);
                          },
                          icon: const Icon(Icons.message)),
                      IconButton(
                          onPressed: () {
                            context.read<SpotByIdCubit>().onShareSpot(state.mapByIdModel!.data!.id!);
                          },
                          icon: const Icon(Icons.ios_share))
                    ],
                  ),
                  body: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: Text(state.mapByIdModel!.data!.description!),
                      ),
                      Expanded(
                          child: state.mapByIdModel!.data!.images!.isEmpty
                              ? Text('Изображение не добавлено')
                              : CarouselSlider(
                                  items: state.mapByIdModel!.data!.images!.map((i) {
                                    int index = state.mapByIdModel!.data!.images!.indexOf(i);
                                    return Flexible(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        child: Image.network(
                                          state.mapByIdModel!.data!.images![index].path!,
                                          height: 250,
                                          width: 250,
                                          //fit: BoxFit.fill,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  options: CarouselOptions(
                                    viewportFraction: 0.92,
                                    autoPlayInterval: const Duration(seconds: 10),
                                    autoPlay: true,
                                    enlargeCenterPage: true,
                                    enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                                    enableInfiniteScroll: true,
                                    initialPage: 0,
                                  )))
                    ],
                  ),
                ));
      },
    );
  }
}
