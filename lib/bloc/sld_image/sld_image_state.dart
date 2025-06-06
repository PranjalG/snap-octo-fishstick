part of 'sld_image_bloc.dart';

class SldImageState extends Equatable {
  const SldImageState();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

final class SldImageInitial extends SldImageState {
  @override
  List<Object> get props => [];
}

class SldImageAdded extends SldImageState {
  final String imagePath;
  final String imageName;

  SldImageAdded({
    required this.imagePath,
    required this.imageName,
  });
}
