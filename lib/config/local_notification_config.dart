import 'package:dbclientapp/config/path_provider_config.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:open_file/open_file.dart';

const ANDROID_NOTIFICATION_DOWNLOAD_CHANEL_ID = '1';
const ANDROID_NOTIFICATION_DOWNLOAD_CHANEL_NAME = 'Download Concluido';
const ANDROID_NOTIFICATION_DOWNLOAD_CHANEL_DESCRIPTION =
    'Notification showed when download file was completed';

class LocalNotificationConfig {
  static final LocalNotificationConfig _localNotificationConfig =
      LocalNotificationConfig._internal();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  factory LocalNotificationConfig() {
    return _localNotificationConfig;
  }

  LocalNotificationConfig._internal() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/launcher_icon');

    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

  Future selectNotification(String payload) async {
    if (payload == null) return;

    if (payload.endsWith('.csv')) {
      OpenFile.open('${await PathProviderConfig.localPath}/$payload',
          type: 'application/vnd.ms-excel');
    }

    if (payload.endsWith('.json')) {
      OpenFile.open('${await PathProviderConfig.localPath}/$payload',
          type: 'text/plain');
    }
  }

  showNotification(String filename) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      ANDROID_NOTIFICATION_DOWNLOAD_CHANEL_ID,
      ANDROID_NOTIFICATION_DOWNLOAD_CHANEL_NAME,
      ANDROID_NOTIFICATION_DOWNLOAD_CHANEL_DESCRIPTION,
      importance: Importance.high,
      priority: Priority.high,
    );

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: null,
    );

    await flutterLocalNotificationsPlugin.show(0, 'Download Concluido!',
        'Download file $filename was concluded!', platformChannelSpecifics,
        payload: filename);
  }
}
