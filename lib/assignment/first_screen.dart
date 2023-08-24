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
                  QueryDocumentSnapshot<Object?> data =
                      snapshot.data!.docs[index];
                  Get.to(() => SecondScreen(
                        groupA: data['groupA'],
                        groupB: data['groupB'],
                        groupAScore: data['groupAScore'],
                        groupBScore: data['groupBScore'],
                        remainingTime: data['remainingTime'],
                        totalTime: data['totalTime'],
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
