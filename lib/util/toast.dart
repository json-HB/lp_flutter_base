import 'util.dart';
import 'i18n.dart';

void showSuccess(String text) {
  callNativeMethod('showSuccess', {'text': text});
}

void showWarning(String text) {
  callNativeMethod('showWarning', {'text': text});
}

void showError(String text) {
  callNativeMethod('showError', {'text': text});
}

void showToast(String text) {
  if (text.indexOf('DioErrorType.DEFAULT') != -1) {
    text = $i18n('common.msg.netErr');
  }
  callNativeMethod('showToast', {'text': text});
}
