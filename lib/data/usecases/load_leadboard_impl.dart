import 'package:Queszz/data/repositories/leadboard_repository.dart';
import 'package:Queszz/domain/usecases/load_leadboard.dart';

class LoadLeadboardImpl implements LoadLeadboard {
  final LeadboardRepository _leadboardRepository;

  LoadLeadboardImpl(this._leadboardRepository);

  @override
  Stream load() {
    return _leadboardRepository.load();
  }
}
