import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizizz_app/main.dart';
import 'package:quizizz_app/models/model.dart';
import 'package:quizizz_app/presentation/pages/player_history_page.dart';

class DashBoardPage extends StatefulWidget {
  DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  var playersDashboard = <PlayerDashboard>[].obs;

  @override
  void initState() {
    super.initState();
    loadDashboard();
  }

  Future<void> loadDashboard() async {
    final loadPlayersDashboard = await supabase.player_dashboard
        .select()
        .order(PlayerDashboard.c_score, ascending: false)
        .withConverter(PlayerDashboard.converter);
    playersDashboard.value = loadPlayersDashboard;
  }

  //final players = <Player>[].obs;

  var nameSortedAsc = false;

  var scoreSortedAsc = false;

  @override
  Widget build(BuildContext context) {
    // final base = Get.arguments as List<String>;
    // players.value = base;
    // playersMaster = base;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.indigo,
                  Colors.purple,
                ],
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: kDefaultFontSize),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text('Dashboard',
                          style: TextStyle(color: Colors.white, fontSize: 32)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: kDefaultFontSize),
                    child: Divider(thickness: 0.5),
                  ),
                  Expanded(
                    child: Obx(() {
                      return ListView.separated(
                          itemCount: playersDashboard.length,
                          // addAutomaticKeepAlives: false,
                          // cacheExtent: Get.height / 4,
                          itemBuilder: (ctx, index) => ListTile(
                                onTap: () {
                                  Get.to(PlayerHistoryPage(),
                                      arguments: playersDashboard[index]);
                                },
                                title: Text(
                                  playersDashboard[index].name.toString(),
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                                trailing: Text(
                                  '${(playersDashboard[index].score)! * 10}',
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider());
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
