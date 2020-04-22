import 'package:flutter/material.dart';

import '../model/entities/network.dart';

class NetworkListWidget extends StatelessWidget {
  const NetworkListWidget(this._networkList);

  final List<Network> _networkList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _networkList.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.symmetric(
            vertical: 8,
          ),
          child: Text(
            _networkList[index].name,
          ),
        );
      },
      separatorBuilder: (context, index) => Divider(
        color: Colors.grey,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
    );
  }
}
