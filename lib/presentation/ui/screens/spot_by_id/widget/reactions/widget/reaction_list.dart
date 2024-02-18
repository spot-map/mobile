import 'package:flutter/material.dart';
import 'package:ride_map/data/map_by_id_models/map_by_id_model.dart';

class ReactionList extends StatelessWidget {
  const ReactionList({
    Key? key,
    required this.scrollController,
    required this.model,
  }) : super(key: key);

  final ScrollController scrollController;
  final MapByIdModel model;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            controller: scrollController,
            itemCount: model.data!.reactions!.length,
            itemBuilder: (_, index) {
              return ListTile(
                title: Row(
                  children: [
                    Text(model.data!.reactions![index].user!.name!),
                    const Spacer(),
                    const Icon(Icons.star, color: Colors.yellow),
                    Text(model.data!.reactions![index].score!.toString())
                  ],
                ),
                subtitle: Text(model.data!.reactions![index].text!),
              );
            }));
  }
}
