// ignore_for_file: must_be_immutable

part of 'cubit.dart';

class AddSpotState extends Equatable {
  final bool isLoading;
  final String errorMessage;
  final List<XFile>? images;
  final MapByIdModel? onAdded;
  final String? nameError;
  String name;
  final String? descriptionError;
  String description;
  final String? addressError;
  String address;

  AddSpotState(
      {this.onAdded,
      this.images,
      this.isLoading = false,
      String? errorMessage,
      this.descriptionError,
      this.description = "",
      this.addressError,
      this.address = "",
      this.nameError,
      this.name = ""})
      : errorMessage = errorMessage ?? '';

  @override
  List<Object?> get props => [
        onAdded,
        images,
        isLoading,
        errorMessage,
        name,
        nameError,
        description,
        descriptionError,
        address,
        addressError
      ];

  AddSpotState copyWith(
      {MapByIdModel? onAdded,
      bool? isLoading,
      String? errorMessage,
      List<XFile>? images,
      String? nameError,
      String? name,
      String? description,
      String? descriptionError,
      String? addressError,
      String? address}) {
    return AddSpotState(
        onAdded: onAdded ?? this.onAdded,
        errorMessage: errorMessage ?? this.errorMessage,
        isLoading: isLoading ?? this.isLoading,
        name: name ?? this.name,
        nameError: nameError ?? this.nameError,
        description: description ?? this.description,
        descriptionError: descriptionError ?? this.descriptionError,
        address: address ?? this.address,
        addressError: addressError ?? this.addressError,
        images: images ?? this.images);
  }

  static const String showSuccessMessage = 'SuccessMessage';
  static const String showErrorMessage = 'ErrorMessage';
  static const String notAuthorized = 'notAuthorized';
}
