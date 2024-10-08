import 'package:ecommerce_samples/Data/models/notification.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class NotificationWidget extends StatefulWidget {
  final Notifications notification;

  const NotificationWidget({super.key, required this.notification});

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    DateTime time = DateTime.parse(widget.notification.time!);
    String dateSlug ="${time.year.toString()}-${time.month.toString().padLeft(2,'0')}-${time.day.toString().padLeft(2,'0')}";

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          if(widget.notification.isSeen == false){
            setState(() {
              widget.notification.isSeen = true;
            });
          }else{
            setState(() {
              widget.notification.isSeen = false;
            });
          }
        },
        child: Container(
          height: size.height * .15,
          width: size.width - 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: widget.notification.isSeen! ? Colors.redAccent.withOpacity(.3) : Colors.red.withOpacity(.8)),
          child: Column(
            children: [
              Container(
                height: 35,
                color: Colors.white.withOpacity(.7),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(widget.notification.title.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(dateSlug.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    child: Center(
                      child: Text(widget.notification.body.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

