import 'package:flutter/material.dart';
import 'package:network_search/model/entities/network.dart';

class NetworkListWidget extends StatelessWidget {
  const NetworkListWidget(this.networkList);

  final List<Network> networkList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: networkList.length,
      itemBuilder: (context, index) {
        return NetworkItem(networkList[index].name);
      },
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
    );
  }
}

class NetworkItem extends StatefulWidget {
  const NetworkItem(this.name);

  final String name;

  @override
  State<StatefulWidget> createState() => NetworkItemState();
}

class NetworkItemState extends State<NetworkItem>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    final curve = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInQuart,
    );
    animation = Tween<double>(begin: 0, end: 1).animate(curve);
    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: Text(
              widget.name,
            ),
          ),
          Divider(color: Colors.grey)
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
