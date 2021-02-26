import 'package:Queszz/domain/entities/statistics.dart';
import 'package:Queszz/domain/helpers/failures.dart';
import 'package:dartz/dartz.dart';

abstract class LoadStatistics {
  Future<Either<Failure, Statistics>> load();
}
