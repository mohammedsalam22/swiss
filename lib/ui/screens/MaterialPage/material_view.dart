import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/Material/material_cubit.dart';
import 'details_page.dart';
import 'material_info.dart';

class Materials extends StatefulWidget {
  const Materials({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MaterialsState();
}

class MaterialsState extends State<Materials> {
  final List<String> images = [];
  List material = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<ProducCubit>(context, listen: false).getMaterial();
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            'Materials page',
            style: TextStyle(fontWeight: FontWeight.w500),
          )),
        ),
        body: BlocBuilder<ProducCubit, ProducState>(
          builder: (context, state) {
            if (state.status == ProducStatus.loading) {
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
            if (BlocProvider.of<ProducCubit>(context).material == null) {
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
            material = BlocProvider.of<ProducCubit>(context).material['data'][0]
                ['items'];
            Map metaa = BlocProvider.of<ProducCubit>(context).material['meta'];
            print(material);
            return Column(
              children: [
                Expanded(
                  flex: 22,
                  child: ListView.builder(
                    itemCount: material.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Card(
                          surfaceTintColor: Colors.white,
                          shadowColor: Colors.black45,
                          color: Colors.white,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0))),
                          elevation: 7,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 12, right: 0, left: 0, bottom: 12),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 10),
                                  child: ClipOval(
                                      clipBehavior: Clip.antiAlias,
                                      child: Image.asset(
                                        'assets/img_1.png',
                                        fit: BoxFit.contain,
                                      )),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          material[index]['name'],
                                          // ignore: prefer_const_constructors
                                          style: TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Text(
                                            material[index]['quantity']
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Row(
                                      children: [
                                        Text(
                                          'Source ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17),
                                        ),
                                        Text(
                                          '', //material[index].name,
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 17),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 40,
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => Details(
                                        id: material[index]['id'],
                                      ),
                                    ));
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.info,
                                    color: Colors.red,
                                    size: 26,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                BlocBuilder<ProducCubit, ProducState>(
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
                              await BlocProvider.of<ProducCubit>(context)
                                  .apiCalled(metaa['links']['first']);
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
            );
          },
        ));
  }
}
