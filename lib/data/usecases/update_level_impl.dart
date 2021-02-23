import 'package:Queszz/data/repositories/levels_repository.dart';
import 'package:dartz/dartz.dart';

import 'package:Queszz/domain/helpers/failures.dart';
import 'package:Queszz/domain/usecases/update_level.dart';

class UpdateLevelImpl implements UpdateLevel {
  final LevelsRepository levelsRepository;

  UpdateLevelImpl(this.levelsRepository);

  @override
  Future<Either<Failure, void>> update(UpdateLevelParams params) async {
    return await levelsRepository.updateLevel(params);
  }
}
