import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Future<void> showRateDialog(BuildContext context, Function(double) onRatingUpdate) async {
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
                      Icons.star,
                      color: Colors.yellow,
                    ),
                onRatingUpdate: onRatingUpdate),
          ));
}
