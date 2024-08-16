import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swis_warehouse/ui/screens/LabelPage/receiving_label/product.dart';

import '../../../../bloc/Transiction_info/transiction_info_cubit.dart';

class ReceivedLabel extends StatefulWidget {
  const ReceivedLabel({super.key, required this.id});

  final int id;

  @override
  State<ReceivedLabel> createState() => _ReceivedLabelState();
}

class _ReceivedLabelState extends State<ReceivedLabel> {
  Map details = {};

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<TransictionInfoCubit>(context, listen: false)
          .getinfo(widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: SafeArea(
          child: BlocBuilder<TransictionInfoCubit, TransictionInfoState>(
            builder: (context, state) {
              if (state.status == TransictionInfoStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                );
              }
              if (BlocProvider.of<TransictionInfoCubit>(context).material ==
                  null) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                );
              }
              details = BlocProvider.of<TransictionInfoCubit>(context)
                  .material['data'];
              return SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.grey.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildImage(context),
                      buildProductstList(),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15))),
                        height: 500,
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                            left: 10, right: 0, top: 10, bottom: 10),
                        margin:
                            const EdgeInsets.only(top: 10, right: 10, left: 10),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 0),
                                      child: Text(
                                        'Code #',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Text(
                                      details['code'],
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 19,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 71),
                                      child: Text(
                                        details['status'],
                                        style: const TextStyle(
                                          color: Colors.indigo,
                                          fontSize: 19,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 5),
                                ),
                                Text(
                                  '${details['date']}&id:${details['transaction_id']}',
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
                                            details['notes'],
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
                                          'status',
                                          style: TextStyle(
                                              fontSize: 19,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          width: 250,
                                          child: Text(
                                            details['status'],
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
                                const SizedBox(
                                  height: 10,
                                ),
                                const Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'DriverName',
                                          style: TextStyle(
                                              fontSize: 19,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          width: 250,
                                          child: Text(
                                            'Emmett Nienow',
                                            style: TextStyle(
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
                                const Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.drive_eta,
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
                                        Text(
                                          'vehicle_number',
                                          style: TextStyle(
                                              fontSize: 19,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          width: 250,
                                          child: Text(
                                            'Tempore commodi et.',
                                            style: TextStyle(
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
                                const Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.add_call,
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
                                        Text(
                                          'national_id',
                                          style: TextStyle(
                                              fontSize: 19,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          width: 250,
                                          child: Text(
                                            'Vitae laborum qui.',
                                            style: TextStyle(
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
                                const Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.account_balance_sharp,
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
                                        Text(
                                          'transportation_company_name',
                                          style: TextStyle(
                                              fontSize: 19,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          width: 250,
                                          child: Text(
                                            'Vitae laborum qui.',
                                            style: TextStyle(
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
                              ],
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }

  Container buildTextFieldsContainer() {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      height: 360,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: buildTextFormField('WarrentNum'),
                ),
                Expanded(
                  child: buildTextFormField('PhoneNum'),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: buildTextFormField('Wieght'),
                ),
                Expanded(
                  child: buildTextFormField('Recieved date'),
                ),
              ],
            ),
            buildTextFormField('Drivers name'),
            Row(
              children: [
                Expanded(
                  child: buildTextFormField('Company name'),
                ),
                Expanded(
                  child: buildTextFormField('Drivers Id'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildProductstList() {
    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ListView.builder(
        itemCount: details.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 220,
            child: Card(
              elevation: 2,
              surfaceTintColor: Colors.white,
              color: Colors.white,
              child: ListTile(
                leading: Image.asset(
                  'assets/img_1.png',
                  width: 80,
                ),
                subtitle: const Row(
                  children: [
                    Text('Quantity: 5'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Container buildImage(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 100, right: 100),
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: ClipOval(
        child: Image.asset('assets/logo.png'),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          )),
      title: const Text(
        'Receiving Warrant',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
      ),
    );
  }

  buildTextFormField(String labeltext) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1, style: BorderStyle.solid, color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            labelText: labeltext,
            border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            filled: true,
            fillColor: Colors.white),
      ),
    );
  }
}
