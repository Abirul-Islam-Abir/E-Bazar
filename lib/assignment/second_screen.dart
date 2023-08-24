import '../utils/export.dart';

class SecondScreen extends StatelessWidget {
  final String groupA,
      groupB,
      groupAScore,
      groupBScore,
      totalTime,
      remainingTime;

  const SecondScreen(
      {super.key,
      required this.groupA,
      required this.groupB,
      required this.groupAScore,
      required this.groupBScore,
      required this.totalTime,
      required this.remainingTime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultSize),
          child: Card(
            elevation: 10,
            child: SizedBox(
              height: 150,
              width: Get.width,
              child: Column(
                children: [
                  Text('$groupA VS $groupB',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColor.kRedColor)),
                  Text('$groupAScore : $groupBScore',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColor.kBlueColor)),
                  Text('Time: $remainingTime',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColor.kPurpleColor)),
                  Text('Total Time: $totalTime',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColor.kPurpleColor)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
