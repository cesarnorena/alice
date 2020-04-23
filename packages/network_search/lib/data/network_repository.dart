import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:network_search/model/entities/network.dart';
import 'package:network_search/model/repositories/network_repository.dart';

class DefaultNetworkRepository extends NetworkRepository {
  DefaultNetworkRepository(this._assetBundle);

  final AssetBundle _assetBundle;

  @override
  Future<List<Network>> getNetworkList() async {
    final json = await _assetBundle
        .loadString('packages/network_search/assets/networks.json');
    final List list = jsonDecode(json);
    return list.map((it) => Network.fromJson(it)).toList();
  }
}
