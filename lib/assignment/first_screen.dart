import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_firebase/assignment/first_screen_controller.dart';
import 'package:ecommerce_firebase/assignment/second_screen.dart';
import 'package:get/get.dart';

import '../utils/export.dart';

class FirstScreen extends GetView<FirstScreenController> {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Match List')),
      body: StreamBuilder<QuerySnapshot>(
          stream: controller.collection.snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  Get.to(()=>SecondScreen(
                    groupA: snapshot.data!.docs[index]['groupA']??'',
                    groupB: snapshot.data!.docs[index]['groupB']??'',
                    groupAScore: snapshot.data!.docs[index]['groupAScore']??'',
                    groupBScore: snapshot.data!.docs[index]['groupBScore']??'',
                    remainingTime: snapshot.data!.docs[index]['remainingTime']??'',
                    totalTime: snapshot.data!.docs[index]['totalTime']??'',
                  ));
                },
                title: Text(
                    '${snapshot.data!.docs[index]['groupA']} VS ${snapshot.data!.docs[index]['groupB']}'),
                trailing: Icon(Icons.arrow_forward),
              ),
            );
          }),
    );
  }
}
