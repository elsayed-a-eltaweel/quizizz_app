import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quizizz_app/main.dart';
import 'package:quizizz_app/models/model.dart';
import 'package:quizizz_app/presentation/pages/dash_board_page.dart';
import 'package:quizizz_app/presentation/pages/question_page.dart';
import 'package:quizizz_app/presentation/widgets/gradient_button.dart';

class HomePage extends StatelessWidget {
  final playerNameCtrl = TextEditingController();
  final file = GetStorage();

  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height / (100 / 40),
            color: Colors.white,
          ),
          Container(
            width: Get.width,
            height: Get.height / (100 / 40),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.indigo,
                  Colors.purple,
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(70),
              ),
            ),
            child: Center(
              child: Image.asset(
                "assets/images/books.png",
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: Get.width,
              height: Get.height / (100 / 60),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.purple,
                    Colors.indigo,
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: Get.width,
              height: Get.height / (100 / 60),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(70),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(height: Get.height / (100 / 7)),
                    TextField(
                      controller: playerNameCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Enter your Name...',
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      ),
                    ),
                    const SizedBox(height: 32),
                    GradientButton(
                        buttonText: 'Play',
                        onTap: () async {
                          if (playerNameCtrl.text.isEmpty) {
                            Fluttertoast.showToast(
                                msg: "Please enter your name...",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.TOP,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.white,
                                textColor: Colors.black,
                                fontSize: 16.0);
                          } else {
                            var players = await supabase.player
                                .select()
                                .eq(Player.c_name, playerNameCtrl.text)
                                .withConverter(Player.converter);

                            if (players.isEmpty) {
                              players = await supabase.player
                                  .insert(
                                      Player.insert(name: playerNameCtrl.text))
                                  .select()
                                  .withConverter(Player.converter);
                            }
                            final playerHistory = await supabase.player_history
                                .select()
                                .eq(PlayerHistory.c_playerId, players.first.id)
                                .order(PlayerHistory.c_createdAt,
                                    ascending: false)
                                .limit(1)
                                .withConverter(PlayerHistory.converter);

                            file.write('player', players.first);
                            file.write(
                                'player_history',
                                playerHistory.isNotEmpty
                                    ? playerHistory.first
                                    : null);

                            Get.to(() => QuestionPage(),
                                arguments: playerHistory.isNotEmpty
                                    ? playerHistory.first
                                    : null);
                          }
                        }),
                    GradientButton(
                        buttonText: 'Leaderboard',
                        onTap: () {
                          Get.to(DashBoardPage());
                        })
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
