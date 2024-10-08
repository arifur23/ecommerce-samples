import 'package:ecommerce_samples/Data/dataSources/data.dart';
import 'package:ecommerce_samples/Data/models/notification.dart';
import 'package:ecommerce_samples/Presentation/widgets/notification_widget.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  late List<Notifications> notifications;

  @override
  void initState() {
    notifications = Data.notifications;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(.7)),),
        centerTitle: true,
      ),
      body: Container(
        width: size.width,
        color: Colors.white,
        child: ListView(
          shrinkWrap: true,
          children:
            List.generate(notifications.length, (index){
            return NotificationWidget(notification: notifications[index]);
          }).toList(),
        ),
      ),
    );
  }
}
