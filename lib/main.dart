import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FlutterLocalNotificationsPlugin? local;

  @override
  void initState() {
    var and = const AndroidInitializationSettings('icon');
    var i = const IOSInitializationSettings();
    var initial = InitializationSettings(android: and, iOS: i);
    local = FlutterLocalNotificationsPlugin();
    local!.initialize(initial);
    super.initState();
  }

  Future show() async {
    var detail = const AndroidNotificationDetails('channelId', 'Local',
        channelDescription: 'Description of Notification',
        importance: Importance.high);
    var ios = const IOSNotificationDetails();
    var gene = NotificationDetails(android: detail, iOS: ios);
    await local!.show(0, 'Local', 'Notification Pushed', gene);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('No Image Found'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.notifications),
        onPressed: () => show(),
      ),
    );
  }
}
