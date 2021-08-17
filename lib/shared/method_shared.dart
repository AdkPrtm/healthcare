part of 'shared.dart';

final ImagePicker _picker = ImagePicker();

Future selectImage() async {
  try {
    final dataImage = await _picker.pickImage(source: ImageSource.gallery);
    if (dataImage != null) {
      print(dataImage.name);
      print(dataImage.path);
    }
  } catch (e) {
    print(e);
  }
}
