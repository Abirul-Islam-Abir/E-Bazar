import 'package:cloud_firestore/cloud_firestore.dart';import 'package:firebase_messaging/firebase_messaging.dart';import 'package:get/get.dart';import '../local notification service/local_notification_service.dart';class FcmMessagingController extends GetxController {  var serverKey =      'AAAAg55L9D8:APA91bEJzSxsFZ0cejUcpqoLGcOW1hKBPjqcE7a9VzUfGqdkQBZKbwyGyMug0p8eNdnKf30EW_WQI1DWMtpLcdPbSdEUGAO2CmT8zj2h9icM2Af7P5ovDus20-03TF-KtuqLUMNVtTeC';  fcmPermissionRequest() async {    FirebaseMessaging messaging = FirebaseMessaging.instance;    NotificationSettings settings = await messaging.requestPermission(      alert: true,      announcement: false,      badge: true,      carPlay: false,      criticalAlert: false,      provisional: false,      sound: true,    );  }  Future getInitialMessage() async {    FirebaseMessaging.instance.getInitialMessage().then((message) =>        NotificationService().showNotification(            1,            '${message!.notification!.title}',            '${message.notification!.body}',            'Its an another payload'));  }  Future onForegroundApp() async {    FirebaseMessaging.onMessage.listen((RemoteMessage message) {      if (message.notification != null) {        NotificationService().showNotification(            1,            '${message.notification!.title}',            '${message.notification!.body}',            'Its an another payload');        /*print('onForegroundApp: ${message.notification!.title}');        print('onForegroundApp: ${message.notification!.body}');*/      }    });  }  Future onOpenedApp() async {    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {      if (message.notification != null) {        NotificationService().showNotification(            1,            '${message.notification!.title}',            '${message.notification!.body}',            'Its an another payload');      }    });  }  Future getToken() async {    String? token = await FirebaseMessaging.instance.getToken();    if (token != null) {      // appTokenStoreToDB(token);    }    print('here have tokens:$token');  }  Future appTokenStoreToDB(tokens) async {    FirebaseFirestore.instance        .collection('Users')        .doc()        .set({'tokens': tokens});  }  @override  void onInit() {    fcmPermissionRequest();    getInitialMessage();    onForegroundApp();    onOpenedApp();    getToken();    super.onInit();  }}