import 'lp_http.dart';
import 'i18n.dart';

abstract class AppInfo {
  static bool isDebug = true;
  static String httpProxy;
  static String token;
  static String userAgent;
  static String brandName;
  static String appChannel;
  static String version;
  static String deviceId;
  static String locale;
  static String apiBaseUrl;
  static String h5BaseUrl;
  static String staticBaseUrl;
  static String userIdentity = '';

  static bool get isLoggedIn {
    return token != null && token.isNotEmpty;
  }

  static void config(Map appInfo) {
    final oldLocale = locale;
    isDebug = appInfo['isDebug'] ?? isDebug;
    httpProxy = appInfo['httpProxy'] ?? httpProxy;
    token = appInfo['token'] ?? token;
    brandName = appInfo['brandName'] ?? brandName;
    appChannel = appInfo['appChannel'] ?? appChannel;
    locale = appInfo['locale'] ?? locale;
    version = appInfo['version'] ?? version;
    deviceId = appInfo['deviceId'] ?? deviceId;
    h5BaseUrl = appInfo['h5BaseUrl'] ?? h5BaseUrl;
    userIdentity = appInfo['userIdentity'] ?? '';

    if (isDebug) {
      staticBaseUrl = 'https://statics-test.seanla.top';
    } else {
      staticBaseUrl = 'https://statics.kreditme.id';
    }
    if (appInfo['apiBaseUrl'] != null) {
      apiBaseUrl = appInfo['apiBaseUrl'];
      LpHttp().configBaseUrl(apiBaseUrl);
    }
    if (appInfo['userAgent'] != null) {
      userAgent = appInfo['userAgent'] + ' Flutter';
    }
    if (oldLocale != locale) {
      clearBaseI18nCache();
    }
  }
}
