import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
          .order(PlayerHistory.c_createdAt, ascending: false)
          .withConverter(PlayerHistory.converter);
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: kDefaultFontSize),
                    child: Divider(thickness: 0.5),
                  ),
                  Expanded(
                    child: Obx(() {
                      return ListView.separated(
                          itemCount: playerHistory.length,
                          // addAutomaticKeepAlives: false,
                          // cacheExtent: Get.height / 4,
                          itemBuilder: (ctx, index) => ListTile(
                                title: Text(
                                  '${(playerHistory[index].score) * 10}',
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                                trailing: Text(
                                  formatUtcToLocal(playerHistory[index]
                                      .createdAt
                                      .toString()),
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

  String formatUtcToLocal(String utcDateTimeString) {
    // Parse the UTC string into DateTime
    DateTime utcDateTime = DateTime.parse(utcDateTimeString).toUtc();

    // Convert UTC to Local time
    DateTime localDateTime = utcDateTime.toLocal();

    // Format the local DateTime to a readable string format, e.g., "yyyy-MM-dd HH:mm:ss"
    // String formattedLocalTime =
    //     localDateTime.toString(); // Customize this as per your need

    final formatDate = DateFormat("dd-MM-yyyy [H:mm]").format(localDateTime);
    return formatDate;
  }
}
