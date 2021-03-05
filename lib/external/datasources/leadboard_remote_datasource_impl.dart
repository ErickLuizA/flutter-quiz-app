import 'package:Queszz/domain/entities/statistics.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'package:Queszz/domain/helpers/exceptions.dart';
import 'package:Queszz/domain/usecases/update_leadboard.dart';
import 'package:Queszz/infra/datasources/leadboard_remote_datasource.dart';

class LeadboardRemoteDatasourceImpl implements LeadboardRemoteDatasource {
  final Database database;
  final FirebaseFirestore firestore;

  LeadboardRemoteDatasourceImpl({
    @required this.database,
    @required this.firestore,
  });

  @override
  Future<void> update(UpdateLeadboardParams params) async {
    try {
      final result = await database.query('Statistics');

      final statistic = Statistics.fromMap(result.first);

      final leadboardColl = firestore.collection('leadboard');

      return await leadboardColl.doc(params.firebaseId).set(statistic.toMap());
    } catch (e) {
      throw ServerException();
    }
  }
}
