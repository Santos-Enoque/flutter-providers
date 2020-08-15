import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/report.dart';

class FireStoreService {
  Firestore _firestore = Firestore.instance;
  String collection = 'reports';
  var random = Random();

  Stream<List<Report>> getReports() {
    return _firestore
        .collection(collection)
        .orderBy('timeStamp', descending: true)
        .snapshots()
        .map((event) => event.documents.map((e) => Report.fromMap(e.data))
        .toList());
  }

  Future addReport()async{
    var temp = next(-15, 5);
    var line = (temp < -5) ? 'swix' : 'toko';
    var wax = (temp.isEven) ? 'red' : 'green';
    var dataMap = Map<String,dynamic>();
    dataMap['line'] = line;
    dataMap['wax'] = wax;
    dataMap['temp'] = temp;
    dataMap['timeStamp'] = DateTime.now().toIso8601String();

    return _firestore.collection(collection).add(dataMap);
  }

  int next(int min, int max) => min * random.nextInt(max - min);
}
