import 'package:Queszz/data/repositories/leadboard_repository.dart';
import 'package:Queszz/data/usecases/load_leadboard_impl.dart';
import 'package:Queszz/data/usecases/update_leadboard_impl.dart';
import 'package:Queszz/domain/usecases/load_leadboard.dart';
import 'package:Queszz/domain/usecases/update_leadboard.dart';
import 'package:Queszz/external/datasources/leadboard_remote_datasource_impl.dart';
import 'package:Queszz/external/services/database.dart';
import 'package:Queszz/infra/datasources/leadboard_remote_datasource.dart';
import 'package:Queszz/infra/repositories/leadboard_repository_impl.dart';
import 'package:Queszz/presentation/viewmodels/leadboard_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sqflite/sqflite.dart';

LeadboardViewModel makeLeadboardViewModel() {
  Database database = DatabaseHelper().database;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  LeadboardRemoteDatasource leadboardRemoteDatasource =
      LeadboardRemoteDatasourceImpl(database: database, firestore: firestore);

  LeadboardRepository leadboardRepository = LeadboardRepositoryImpl(
    leadboardRemoteDatasource,
  );

  UpdateLeadboard updateLeadboard = UpdateLeadboardImpl(
    leadboardRepository,
  );

  LoadLeadboard loadLeadboard = LoadLeadboardImpl(
    leadboardRepository,
  );

  LeadboardViewModel leadboardViewModel = LeadboardViewModel(
    updateLeadboard: updateLeadboard,
    loadLeadboard: loadLeadboard,
  );

  return leadboardViewModel;
}
