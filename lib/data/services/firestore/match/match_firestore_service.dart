import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:polla_futbolera/domain/entities/match_entity.dart';

class MatchFirestoreService {
  static CollectionReference matches =
      FirebaseFirestore.instance.collection('matches');

  static Future<bool> insertNewMatchesToFirestore(MatchEntity matchEntity) =>
      matches
          .doc(matchEntity.sId)
          .set(matchEntity.toJson())
          .then((value) => true)
          .catchError((err) => false);

  static Stream<QuerySnapshot<MatchEntity>> getFinishedMatches() => matches
      .where('finished', isEqualTo: true)
      .withConverter<MatchEntity>(
          fromFirestore: (snapshot, _) =>
              MatchEntity.fromJson(snapshot.data()!),
          toFirestore: (matches, _) => matches.toJson())
      .snapshots();
}
