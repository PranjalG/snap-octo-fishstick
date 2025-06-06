import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

part 'sld_image_event.dart';
part 'sld_image_state.dart';

class SldImageBloc extends Bloc<SldImageEvent, SldImageState> {
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;
  bool imageAdded = false;

  SldImageBloc() : super(SldImageInitial()) {
    on<SldImageEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<AddSldImageEvent>(_AddSldImageEvent);
    on<RemoveSldImageEvent>(_RemoveSldImageEvent);
  }

  Future<void> _AddSldImageEvent(AddSldImageEvent event, Emitter<SldImageState> emit) async {

    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      emit(SldImageAdded(imagePath: pickedFile.path, imageName: pickedFile.name));
    } else
      emit(SldImageState());
  }

  void _RemoveSldImageEvent(RemoveSldImageEvent event, Emitter<SldImageState> emit) async {
    emit(SldImageState());
  }
}
