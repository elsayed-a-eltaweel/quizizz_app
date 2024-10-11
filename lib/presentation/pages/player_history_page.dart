import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizizz_app/main.dart';
import 'package:quizizz_app/models/model.dart';

class PlayerHistoryPage extends StatefulWidget {
  PlayerHistoryPage({super.key});

  @override
  State<PlayerHistoryPage> createState() => _PlayerHistoryPageState();
}

class _PlayerHistoryPageState extends State<PlayerHistoryPage> {
  var playerHistory = <PlayerHistory>[].obs;
  final player = Get.arguments as PlayerDashboard;

  @override
  void initState() {
    super.initState();
    loadPlayerHistory();
  }

  Future<void> loadPlayerHistory() async {
    final playerId = player.id;
    if (playerId != null) {
      final tempPlayerHistory = await supabase.player_history
          .select()
          .eq(PlayerHistory.c_playerId, playerId)
          .withConverter(PlayerHistory.converter);

      print(tempPlayerHistory);
      playerHistory.value = tempPlayerHistory;
    }
  }

  // @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text.rich(TextSpan(
                      text: player.name,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: Colors.white),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultFontSize),
                    child: const Divider(thickness: 0.5),
                  ),
                  Expanded(
                    child: Obx(() {
                      return ListView.separated(
                          itemCount: playerHistory.length,
                          // addAutomaticKeepAlives: false,
                          // cacheExtent: Get.height / 4,
                          itemBuilder: (ctx, index) => ListTile(
                                title: Text(
                                  playerHistory[index].score.toString(),
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                                trailing: Text(
                                  playerHistory[index].createdAt.toString(),
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                              ),
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider());
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
