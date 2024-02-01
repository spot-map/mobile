part of 'cubit.dart';


class AddSpotState extends Equatable{
  final bool isLoading;
  final String errorMessage;
  final List<XFile>? images;
  final bool onAdded;

  const AddSpotState({
    this.onAdded = false,
    this.images,
    this.isLoading = false,
    String? errorMessage,
  }) : errorMessage = errorMessage ?? '';

  @override
  List<Object?> get props => [onAdded, images, isLoading, errorMessage];

  AddSpotState copyWith({ bool? onAdded, bool? isLoading, String? errorMessage, List<XFile>? images}) {
    return AddSpotState(
        onAdded: onAdded ?? this.onAdded,
        errorMessage: errorMessage ?? this.errorMessage,
        isLoading: isLoading ?? this.isLoading,
        images:  images ?? this.images
    );
  }

  static const String showSuccessMessage = 'SuccessMessage';
  static const String showErrorMessage = 'ErrorMessage';
  static const String notAuthorized = 'notAuthorized';
}

