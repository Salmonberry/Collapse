import 'package:dio/dio.dart';

typedef DioErrorEventHandle = void Function(String value);

class DioErrorHandle {
  final DioError _dioError;

  DioErrorHandle(this._dioError);

  void handle(DioErrorEventHandle callback) {
    //获取后台返回的自定义错误码
    final String errorCode =
        (_dioError.response!.data as Map<String, dynamic>)['error_code'];
    String _text = '';

    switch (errorCode) {
      case 'COUPON_NOT_EXIST':
        _text = 'coupon_not_exist';
        break;
      case 'RETURN_NOT_ALLOW_ERROR':
        _text = 'return_not_allow_error';
        break;
      case 'RETURN_EXPIRE_ERROR':
        _text = 'return_expire_error';
        break;
      case 'RETURN_QUANTITY_ERROR':
        _text = 'return_quantity_error';
        break;
      default:
        break;
    }

    callback(_text);
  }
}
