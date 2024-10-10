import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardPage extends StatefulWidget {
  DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  void initState() {
    super.initState();
    loadDashboard();
  }

  void loadDashboard() {}
  //final players = <Player>[].obs;
  var playersDashboard = <String>['abdo', 'sayed', 'ahmed'].obs;

  var nameSortedAsc = false;

  var scoreSortedAsc = false;

  @override
  Widget build(BuildContext context) {
    // final base = Get.arguments as List<String>;
    // players.value = base;
    // playersMaster = base;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.indigo,
                  Colors.purple,
                ],
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Obx(() {
                    return ListView.separated(
                        itemCount: playersDashboard.length,
                        // addAutomaticKeepAlives: false,
                        // cacheExtent: Get.height / 4,
                        itemBuilder: (ctx, index) => ListTile(
                              title: Text(
                                playersDashboard[index],
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                              // trailing: Text(
                              //   players[index].score.toString(),
                              //   style: TextStyle(fontSize: 32, color: Colors.red),
                              // ),
                            ),
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider());
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
