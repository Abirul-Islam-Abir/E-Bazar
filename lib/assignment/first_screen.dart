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
          SizedBox(height: kTooSmallSize),
          CustomTextField(
            size: kTooSmallSize,
            hintText: 'GroupA',
            label: 'GroupA',
            controller: controller.groupAController,
          ),
          SizedBox(height: kTooSmallSize),
          CustomTextField(
            size: kTooSmallSize,
            hintText: 'GroupASore',
            label: 'GroupASore',
            controller: controller.groupAScoreController,
          ),
          SizedBox(height: kTooSmallSize),
          CustomTextField(
            size: kTooSmallSize,
            hintText: 'GroupB',
            label: 'GroupB',
            controller: controller.groupBController,
          ),
          SizedBox(height: kTooSmallSize),
          CustomTextField(
            size: kTooSmallSize,
            hintText: 'GroupBScore',
            label: 'GroupBScore',
            controller: controller.groupBScoreController,
          ),
          SizedBox(height: kTooSmallSize),
          CustomTextField(
            size: kTooSmallSize,
            hintText: 'Ramaining time',
            label: 'Ramaining time',
            controller: controller.remainingTimeController,
          ),
          SizedBox(height: kTooSmallSize),
          CustomTextField(
            size: kTooSmallSize,
            hintText: 'Total time',
            label: 'Total time',
            controller: controller.totalTimeController,
          ),
          SizedBox(height: kTooSmallSize),
          Row(
            children: [
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("Cancel"),
              ),
              SizedBox(width: 30),
              ElevatedButton(
                onPressed: () {
                  controller.addFootballScore();
                },
                child: Text("Add"),
              ),
              SizedBox(width: 30),
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
            icon: Icon(Icons.add),
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
