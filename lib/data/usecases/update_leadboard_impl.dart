import 'package:Queszz/data/repositories/leadboard_repository.dart';
import 'package:Queszz/domain/helpers/failures.dart';
import 'package:Queszz/domain/usecases/update_leadboard.dart';
import 'package:dartz/dartz.dart';

class UpdateLeadboardImpl implements UpdateLeadboard {
  final LeadboardRepository _leadboardRepository;

  UpdateLeadboardImpl(this._leadboardRepository);

  @override
  Future<Either<Failure, void>> update(UpdateLeadboardParams params) async {
    return await _leadboardRepository.update(params);
  }
}
