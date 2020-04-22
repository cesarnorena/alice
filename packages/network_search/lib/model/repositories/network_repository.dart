import '../entities/network.dart';

abstract class NetworkRepository {
  Future<List<Network>> getNetworkList();
}
