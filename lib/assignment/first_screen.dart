import 'package:ecommerce_firebase/assignment/first_screen_controller.dart';
import 'package:ecommerce_firebase/assignment/second_screen.dart';

import '../utils/export.dart';

class FirstScreen extends GetView<FirstScreenController> {
  const FirstScreen({super.key});

  void showMyDialog() {
    Get.bottomSheet(Container(
      color: AppColor.kWhiteColor,
      child: ListView(
        children: [
          const SizedBox(height: kTooSmallSize),
          CustomTextField(
            size: kTooSmallSize,
            hintText: 'GroupA',
            label: 'GroupA',
            controller: controller.groupAController,
          ),
          const SizedBox(height: kTooSmallSize),
          CustomTextField(
            size: kTooSmallSize,
            hintText: 'GroupASore',
            label: 'GroupASore',
            controller: controller.groupAScoreController,
          ),
          const SizedBox(height: kTooSmallSize),
          CustomTextField(
            size: kTooSmallSize,
            hintText: 'GroupB',
            label: 'GroupB',
            controller: controller.groupBController,
          ),
          const SizedBox(height: kTooSmallSize),
          CustomTextField(
            size: kTooSmallSize,
            hintText: 'GroupBScore',
            label: 'GroupBScore',
            controller: controller.groupBScoreController,
          ),
          const SizedBox(height: kTooSmallSize),
          CustomTextField(
            size: kTooSmallSize,
            hintText: 'Ramaining time',
            label: 'Ramaining time',
            controller: controller.remainingTimeController,
          ),
          const SizedBox(height: kTooSmallSize),
          CustomTextField(
            size: kTooSmallSize,
            hintText: 'Total time',
            label: 'Total time',
            controller: controller.totalTimeController,
          ),
          const SizedBox(height: kTooSmallSize),
          Row(
            children: [
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("Cancel"),
              ),
              const SizedBox(width: 30),
              ElevatedButton(
                onPressed: () {
                  controller.addFootballScore();
                },
                child: const Text("Add"),
              ),
              const SizedBox(width: 30),
            ],
          ),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match List'),
        actions: [
          IconButton(
            onPressed: () {
              showMyDialog();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
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
