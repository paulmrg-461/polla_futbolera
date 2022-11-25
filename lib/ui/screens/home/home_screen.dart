import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:polla_futbolera/data/services/api_world_cup/api_world_cup_requests_service.dart';
import 'package:polla_futbolera/data/services/firestore/match/match_firestore_service.dart';
import 'package:polla_futbolera/domain/entities/match_entity.dart';
import 'package:polla_futbolera/ui/shared/custom_error_message.dart';
import 'package:polla_futbolera/ui/themes/main_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [
          IconButton(
              onPressed: () =>
                  ApiWordCupRequestsService.uploadNewScoresToFirestore(),
              icon: const Icon(Icons.cloud_upload_rounded))
        ]),
        body: StreamBuilder(
            stream: MatchFirestoreService.getFinishedMatches(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<MatchEntity>> snapshot) {
              if (snapshot.hasError) {
                return const CustomErrorMessage(
                    textMessage:
                        'Ha ocurrido un error al cargar las resultados. Por favor intenta nuevamente.');
              }

              if (snapshot.hasData) {
                final List<MatchEntity> matchesList = snapshot.data!.docs
                    .map((DocumentSnapshot<MatchEntity> document) {
                  final MatchEntity match = document.data()!;
                  return match;
                }).toList();

                final List<Padding> widgetList = matchesList
                    .map((match) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Text(
                                match.homeTeamEn!,
                                textAlign: TextAlign.right,
                              )),
                              Container(
                                width: 22,
                                height: 18,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(match.homeFlag!))),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                    '${match.homeScore}-${match.awayScore}'),
                              ),
                              Container(
                                width: 22,
                                height: 18,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(match.awayFlag!))),
                              ),
                              Expanded(
                                  child: Text(
                                match.awayTeamEn!,
                                textAlign: TextAlign.left,
                              )),
                            ],
                          ),
                        ))
                    .toList();

                return SingleChildScrollView(
                  child: Column(
                    children: widgetList,
                  ),
                );
              }

              return const Center(
                  child: CircularProgressIndicator.adaptive(
                backgroundColor: MainTheme.primaryColor,
              ));
            }));
  }
}
