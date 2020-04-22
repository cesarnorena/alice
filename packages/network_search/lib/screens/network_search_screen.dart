import 'package:flutter/material.dart';

class NetworkSearchScreen extends StatefulWidget {
  const NetworkSearchScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NetworkSearchState();
  }
}

class _NetworkSearchState extends State<NetworkSearchScreen> {
  List<String> _networkList = ['First element'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(),
            Expanded(
              child: ListView.builder(
                itemCount: _networkList.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Text(
                      _networkList[index],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
