import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image/image.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nanoid/nanoid.dart';
import 'package:path_provider/path_provider.dart';

class ImageUtils {
  ImageUtils();

  String say(String value) => 'Hello,$value';

  //从本地相册获取图片 并另存为固定的尺寸的图片
  Future<File?> selectImageFromAlbum() async {
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

  Future<File> compressFile(File file, Function callback) async {
    final String localImageSaveBasePath =
        (await getApplicationDocumentsDirectory()).path;
    int quality = 100;
    int total = 4;
    const int imageSizeLimit = 0xffff; //图片大小限制 16进制表示
    File compressImage = file;

    print('规格大小：${int.parse(imageSizeLimit.toRadixString(10))}');
    print('图片大小：${file.lengthSync()}');
    // compressImage!.lengthSync() > int.parse(num.toRadixString(10))
    while (total > 0 && total <= 4) {
      // print('length:${data.lengthSync()}');

      switch (total) {
        case 4:
          quality = 80;
          break;
        case 3:
          quality = 60;
          break;
        case 2:
          quality = 40;
          break;
        case 1:
          quality = 20;
          break;
        case 0:
          quality = 0;
          break;
        default:
          quality = 0;
          break;
      }

      print('quality:$quality');

      try {
        compressImage = (await FlutterImageCompress.compressAndGetFile(
          compressImage.absolute.path,
          '$localImageSaveBasePath/cover_${nanoid(10)}.jpg',
          quality: quality,
        ))!;

        total -= 1;

        if (compressImage.lengthSync() <
            int.parse(imageSizeLimit.toRadixString(10))) {
          break;
        }

        if (total == 0) {
          //将16进制转为10进制并进行比较
          if (compressImage.lengthSync() >
              int.parse(imageSizeLimit.toRadixString(10))) {
            // _customImageSettingView.showMsgByToast('图片超出上传规格');
            callback();
            throw Exception('图片超出上传规格');
          }
        }

        print('壓縮後的大小：${compressImage.lengthSync()}');
      } catch (e) {
        // _customImageSettingView.showMsgByToast('图片压缩异常');
        callback();
      }
    }

    return compressImage;
  }
}
