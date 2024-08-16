import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/TransictionStatus/transiction_status_cubit.dart';
import '../LabelPage/receiving_label/received_label.dart';
import '../MaterialPage/details_page.dart';

class TransictionStatusScreen extends StatefulWidget {
  const TransictionStatusScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TransictionStatusScreenState();
}

class TransictionStatusScreenState extends State<TransictionStatusScreen> {
  final List<String> images = [];
  List material = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<TransictionStatusCubit>(context, listen: false)
          .gettransiction();
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            'Transiction page',
            style: TextStyle(fontWeight: FontWeight.w500),
          )),
        ),
        body: BlocBuilder<TransictionStatusCubit, TransictionStatusState>(
          builder: (context, state) {
            if (state.status == TransictionStatus.loading) {
              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                  ),
                  const Center(
                      child: CircularProgressIndicator(
                    color: Colors.red,
                    strokeWidth: 1,
                  )),
                ],
              );
            }
            if (BlocProvider.of<TransictionStatusCubit>(context).material ==
                null) {
              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                  ),
                  const Center(
                      child: CircularProgressIndicator(
                    color: Colors.black,
                    strokeWidth: 1,
                  )),
                ],
              );
            }
            material = BlocProvider.of<TransictionStatusCubit>(context)
                .material['data'][0]['transaction'];
            Map metaa = BlocProvider.of<TransictionStatusCubit>(context)
                .material['meta'];

            print(material);
            return Container(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 10),
              child: Column(
                children: [
                  Expanded(
                    flex: 15,
                    child: ListView.builder(
                      itemCount: material.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black38),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15))),
                          height: 300,
                          width: 250,
                          padding: const EdgeInsets.only(
                              left: 10, right: 0, top: 10, bottom: 10),
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Text(
                                          'Code #',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Text(
                                        material[index]['code'],
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 19,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 5),
                                  ),
                                  Text(
                                    material[index]['date'],
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 19,
                                    ),
                                  ),
                                  const Text(
                                      '  ....................................................................................'),
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.note_sharp,
                                          color: Colors.black45,
                                          size: 35,
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Labels Note',
                                            style: TextStyle(
                                                fontSize: 19,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            width: 250,
                                            child: Text(
                                              material[index]['notes'],
                                              style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                color: Colors.grey,
                                                fontSize: 19,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Text(
                                      '  ....................................................................................'),
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.info_rounded,
                                          color: Colors.black45,
                                          size: 35,
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'transaction_type',
                                            style: TextStyle(
                                                fontSize: 19,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            width: 250,
                                            child: Text(
                                              material[index]
                                                  ['transaction_type'],
                                              style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                color: Colors.grey,
                                                fontSize: 19,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Text(
                                      '  ....................................................................................'),
                                  Row(
                                    children: [
                                      OutlinedButton(
                                          onPressed: () {},
                                          child: Text(
                                              ' status ${material[index]['status']} ')),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      OutlinedButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ReceivedLabel(
                                                            id: material[index]
                                                                ['id'])));
                                          },
                                          child: const Text(
                                            'View Details',
                                            style: TextStyle(color: Colors.red),
                                          ))
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  BlocBuilder<TransictionStatusCubit, TransictionStatusState>(
                    builder: (context, state) {
                      return Expanded(
                        flex: 1,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: metaa['count'],
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () async {
                                await BlocProvider.of<TransictionStatusCubit>(
                                        context)
                                    .transictionapiCalled(
                                        metaa['links']['first']);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black38),
                                ),
                                child: Text(
                                  metaa['current_page'].toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ));
  }
}
