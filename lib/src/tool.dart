import 'dart:io';

import 'package:image/image.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nanoid/nanoid.dart';
import 'package:path_provider/path_provider.dart';

class Tool {
  Tool();

  String say(String value) => 'Hello,$value';

  Future<File?> pickedCustomImage() async {
    XFile? image;
    CroppedFile? croppedFile;
    File? newImage;

    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      croppedFile = await ImageCropper().cropImage(
          sourcePath: image.path,
          compressFormat: ImageCompressFormat.jpg,
          aspectRatio: const CropAspectRatio(ratioX: 3, ratioY: 4),
          maxWidth: 240,
          maxHeight: 320,
          uiSettings: [
            AndroidUiSettings(toolbarTitle: 'Cropper', lockAspectRatio: true),
          ]);

      if (croppedFile != null) {
        final resizeImage = copyResize(
            decodeImage(File(croppedFile.path).readAsBytesSync())!,
            width: 240,
            height: 320);

        final String localImageSaveBasePath =
            (await getApplicationDocumentsDirectory()).path;

        newImage = File('$localImageSaveBasePath/cover_${nanoid(10)}.jpg')
          ..writeAsBytesSync(encodeJpg(resizeImage));
      }
    }

    return newImage;
  }
}
