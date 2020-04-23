import 'package:network_search/model/entities/network.dart';
import 'package:network_search/model/repositories/network_repository.dart';

class GetNetworkList {
  GetNetworkList(this._repository);

  final NetworkRepository _repository;

  Future<List<Network>> execute() => _repository.getNetworkList();
}
