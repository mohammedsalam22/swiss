import 'package:flutter/material.dart';
import 'package:swis_warehouse/ui/screens/DiaryPage/request_warrant.dart';

class diary extends StatefulWidget {
  const diary({super.key});

  @override
  State<diary> createState() => _diaryState();
}

class _diaryState extends State<diary> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [_tabBarContainer(), _tabBarViewer()],
        ),
      ),
    );
  }

  Expanded _tabBarViewer() {
    return Expanded(
      child: TabBarView(children: [
        const RequestWarrant(),
        Container(
          color: Colors.white,
        ),
      ]),
    );
  }

  Container _tabBarContainer() {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5))),
      width: double.infinity,
      child: const Column(
        children: [
          TabBar(
            padding: EdgeInsets.symmetric(horizontal: 10),
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(
                child: Text(
                  'Send',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  'Receive',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
