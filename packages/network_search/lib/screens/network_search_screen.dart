import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/network_search_bloc.dart';

class NetworkSearchScreen extends StatefulWidget {
  const NetworkSearchScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NetworkSearchState();
  }
}

class _NetworkSearchState extends State<NetworkSearchScreen> {
  List<String> _networkList = [
    'First element',
    'First element',
    'First element',
    'First element',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NetworkSearchBloc, NetworkSearchState>(
      builder: (bloc, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextField(),
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: _networkList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        child: Text(
                          _networkList[index],
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
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
