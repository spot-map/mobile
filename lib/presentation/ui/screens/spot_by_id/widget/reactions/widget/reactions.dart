import 'package:ride_map/domain/entities/map_by_id_models/map_by_id_model.dart';
import 'package:ride_map/presentation/ui/screens/spot_by_id/cubit.dart';
import 'package:ride_map/presentation/ui/screens/spot_by_id/widget/reactions/widget/reaction_list.dart';
import 'package:ride_map/presentation/ui/widget/app_bar/app_bar.dart';
import 'package:ride_map/presentation/ui/widget/dialogs/rate_dialog.dart';
import 'package:ride_map/presentation/ui/widget/page/custom_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class Reactions extends StatelessWidget {
  Reactions({super.key, required this.model});

  final MapByIdModel model;

  final ScrollController scrollController = ScrollController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: MyAppBar(
            size: 30,
            title: '',
            automaticallyImplyLeading: false,
            centerTitle: false,
            widgetRight: [
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.red,
                  ))
            ],
          ),
          body: CustomContainer(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReactionList(
                  scrollController: scrollController,
                  model: model,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: TextFormField(
                    key: const Key('sendReaction'),
                    controller: messageController,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Ваш комментарий',
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.all(20.0),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.send),
                        color: Theme.of(context).iconTheme.color,
                        onPressed: () {
                          if (messageController.text.isNotEmpty) {
                            FocusManager.instance.primaryFocus?.unfocus();
                            showRateDialog(
                                context,
                                (rating) => {
                                      context
                                          .read<SpotByIdCubit>()
                                          .onSendReaction(messageController.text, rating.toInt(), model.data!.id!),
                                      Navigator.pop(context),
                                    });
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
