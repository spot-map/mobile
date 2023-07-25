import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ride_map/domain/bloc/spot_by_id/spot_by_id_bloc.dart';
import 'package:ride_map/presentation/ui/widget/bottom_sheet/widget/reactions/widget/reaction_list.dart';
import 'package:ride_map/presentation/ui/widget/container/custom_container.dart';
import '../../../../../../data/map_by_id_page_models/map_by_id_model.dart';
import '../../../app_bar/app_bar.dart';

Future reactionsBottomSheet(BuildContext context, MapByIdModel model) {
  return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
            initialChildSize: 0.75,
            maxChildSize: 0.75,
            minChildSize: 0.75,
            expand: false,
            builder: (context, scrollController) => _reactions(context, model),
          ));
}

Widget _reactions(BuildContext context, MapByIdModel model) {
  ScrollController scrollController = ScrollController();
  TextEditingController messageController = TextEditingController();
  bool messageValid = false;
  final GlobalKey<FormState> _reactionKey = GlobalKey<FormState>();

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
                    hintText: 'Введите текст',
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
                          _showDialog(
                              context, messageController.text, model.data!.id!);

                          scrollController.animateTo(
                            scrollController.position.minScrollExtent,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        } else {
                          null;
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

Future<void> _showDialog(BuildContext context, String message, int id) async {
  await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text('Оцените спот'),
            content: RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              onRatingUpdate: (rating) {
                BlocProvider.of<SpotByIdBloc>(context)
                    .add(SendReactions(message, rating.toInt(), id));
                Navigator.pop(context);
              },
            ),
          ));
}
