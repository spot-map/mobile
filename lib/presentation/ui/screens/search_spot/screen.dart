import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/domain/entities/map_models/map_model.dart';
import 'package:ride_map/presentation/common/theme/base/app_color.dart';
import 'package:ride_map/presentation/common/cubit/map/cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  static const path = 'SearchSpot';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                  pinned: true,
                  snap: true,
                  stretch: true,
                  floating: true,
                  elevation: 0,
                  centerTitle: false,
                  title: Text('Поиск спотов', style: TextStyle(color: context.colors.textColor)),
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(70),
                    child: CupertinoSearchTextField(
                      controller: context.read<MapCubit>().searchController,
                      onChanged: (value) => context.read<MapCubit>().onSearchSpot,
                    ),
                  )),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                sliver: SliverList.builder(
                    itemCount: state.mapModel!.data.length,
                    itemBuilder: (context, index) => Card(
                        elevation: 15,
                        shadowColor: context.colors.backButtonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                            // leading: CircleAvatar(
                            //     backgroundImage: NetworkImage(
                            //         state.mapModel!.data[index].)),
                            // title: Text(state.mapModel!.data[index].name ?? ""),
                            // subtitle: Text(state.mapModel!.data[index].description ?? "")
                        )
                    )),
              )
            ],
          ),
        );
      },
    );
  }
}
