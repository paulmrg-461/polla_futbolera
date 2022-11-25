import 'package:flutter/material.dart';
import 'package:polla_futbolera/data/services/api_world_cup/api_world_cup_requests_service.dart';
import 'package:polla_futbolera/domain/entities/match_entity.dart';

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
        body: Text('TOla')
        // FutureBuilder<List<MatchEntity>>(
        //     future: ApiWordCupRequestsService.getScores(),
        //     builder: (context, snapshot) {
        //       if (snapshot.hasData) {
        //         return ListView.builder(
        //           itemCount: snapshot.data!.length,
        //           itemBuilder: (context, index) {
        //             final MatchEntity match = snapshot.data![index];
        //             return Row(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: [
        //                 Text(match.homeTeamEn!),
        //                 Text('${match.homeScore} - ${match.awayScore}'),
        //                 Text(match.awayTeamEn!),
        //               ],
        //             );
        //           },
        //         );
        //       }
        //       if (snapshot.hasError) {
        //         return Center(
        //           child: Text('Ha ocurrido un error al traer los marcadores.'),
        //         );
        //       }
        //       return const Center(child: CircularProgressIndicator.adaptive());
        //     }),
        );
  }
}
