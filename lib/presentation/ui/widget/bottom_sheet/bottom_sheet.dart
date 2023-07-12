import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:ride_map/presentation/ui/widget/bottom_sheet/widget/by_id_layout.dart';

// WoltModalSheetPage page1(BuildContext modalSheetContext, int id) {
//   return WoltModalSheetPage.withSingleChild(
//     stickyActionBar: StickyActionBarWrapper(
//       child: Column(
//         children: [
//           WoltElevatedButton(
//             onPressed: () => Navigator.of(modalSheetContext).pop(),
//             theme: WoltElevatedButtonTheme.secondary,
//             child: const Text('Cancel'),
//           ),
//           const SizedBox(height: 8),
//         ],
//       ),
//     ),
//     pageTitle:  Text(''),
//     topBarTitle:  ModalSheetTopBarTitle('Pagination'),
//     closeButton: WoltModalSheetCloseButton(onClosed: Navigator.of(modalSheetContext).pop),
//     mainContentPadding: const EdgeInsetsDirectional.all(16),
//     child: ByIdLayout(id: id)
//   );
// }

Future bottomSheet(BuildContext context, int id) {
  return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        maxChildSize: 0.9,
        initialChildSize: 0.4,
        minChildSize: 0.32,
          expand: false,
          builder: (context, scrollController) => ByIdLayout(id: id),
              ));
}
