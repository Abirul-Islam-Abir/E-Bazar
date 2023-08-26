import 'package:ecommerce_firebase/assignment/first_screen_controller.dart';
import 'package:ecommerce_firebase/assignment/second_screen.dart';

import '../utils/export.dart';

class FirstScreen extends GetView<FirstScreenController> {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Match List')),
      body: StreamBuilder<QuerySnapshot>(
          stream: controller.collection.snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  QueryDocumentSnapshot<Object?> data =
                      snapshot.data!.docs[index];
                  NotificationService().showNotification(
                      1,
                      '${data['groupA']} VS ${data['groupB']} ',
                      'RemainingTime: ${data['remainingTime']}',
                      'remainingTime: ${data['remainingTime']}');
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
                trailing: const Icon(Icons.arrow_forward),
              ),
            );
          }),
    );
  }
}
