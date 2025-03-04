import 'package:flutter/material.dart';
import 'package:swis_warehouse/ui/screens/LabelPage/receiving_label/qr_page.dart';
import 'package:swis_warehouse/ui/screens/LabelPage/sending_label/view.dart';

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
          children: [
            Container(height: 30,width: double.infinity,),
            _tabBarContainer(), _tabBarViewer()],
        ),
      ),
    );
  }

  Expanded _tabBarViewer() {
    return Expanded(
      child: TabBarView(children: [
        const CreateTransiction(),
        QRScanner()
        //QrPage(),
      ]),
    );
  }

  Container _tabBarContainer() {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5))),
      width: double.infinity,
      child: const Column(
        children: [
          TabBar(
            padding: EdgeInsets.symmetric(horizontal: 10),
            indicatorColor: Colors.red,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(
                child: Text(
                  'Send',
                  style: TextStyle(color: Colors.blueGrey),
                ),
              ),
              Tab(
                child: Text(
                  'Receive',
                  style: TextStyle(color: Colors.blueGrey),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
