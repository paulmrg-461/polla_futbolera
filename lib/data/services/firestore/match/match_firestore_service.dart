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
}
