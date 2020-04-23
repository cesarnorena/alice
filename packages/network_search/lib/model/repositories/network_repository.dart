import 'package:network_search/model/entities/network.dart';

abstract class NetworkRepository {
  Future<List<Network>> getNetworkList();
}
