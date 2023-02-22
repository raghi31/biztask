import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import './editscreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String stringResponse;
  Map mapResponse;
  var itemcount;
  Future apicall() async {
    http.Response response;
    response = await http.get(Uri.parse(
        'http://crm.bemlindia.in/beml/modules/Mobile/v1/fetchRecordWithGrouping?module=FailedParts&access_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyaWQiOiIzMjgifQ.SXPWzlEmHo39siKEzn9f34m2Cgz4jM4dxg68AWEEguU&useruniqueid=328&record=57x621425'));

    if (response.statusCode == 200) {
      setState(() {
        stringResponse = response.body;
        mapResponse = jsonDecode(stringResponse);
        itemcount = mapResponse['data']['record']['LineItems'].length;
      });
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  editproduct() {
    Get.to(const EditScreen(), arguments: {'mapResponse': mapResponse});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biz API Task'),
      ),
      body: Column(children: [
        mapResponse.isNullOrBlank
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                            '${mapResponse['data']['record']['blocks'][0]['fields'][12]['label']}:${mapResponse['data']['record']['blocks'][0]['fields'][12]['value']}'),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                            '${mapResponse['data']['record']['blocks'][0]['fields'][15]['label']}:${mapResponse['data']['record']['blocks'][0]['fields'][15]['value']}'),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                            '${mapResponse['data']['record']['blocks'][0]['fields'][16]['label']}:${mapResponse['data']['record']['blocks'][0]['fields'][16]['value']}'),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                            '${mapResponse['data']['record']['blocks'][0]['fields'][14]['label']}:${mapResponse['data']['record']['blocks'][0]['fields'][14]['value']}'),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                            '${mapResponse['data']['record']['blocks'][0]['fields'][13]['label']}:${mapResponse['data']['record']['blocks'][0]['fields'][13]['value']}'),
                      ],
                    ),
                    Expanded(
                      flex: 1,
                      child: ListView.builder(
                        itemCount: itemcount,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              children: [
                                Text('Part Number' +
                                    ' : ' +
                                    mapResponse['data']['record']['LineItems']
                                        [index]['productname']),
                                Text('Description' +
                                    ' : ' +
                                    mapResponse['data']['record']['LineItems']
                                        [index]['comment']),
                                Text('replaced_date' +
                                    ' : ' +
                                    mapResponse['data']['record']['LineItems']
                                        [index]['replaced_date']),
                                Text('pending_days' +
                                    ' : ' +
                                    mapResponse['data']['record']['LineItems']
                                        [index]['pending_days']),
                                // Text(mapResponse['data']['record']['LineItems'][index]
                                //         ['submitted_qty_log'][0]['quantity']
                                //     .toString()),
                                // Text(mapResponse['data']['record']['LineItems'][index]
                                //     ['submitted_qty_log']['date_of_submiss']),
                                Text('remarks_by_eng' +
                                    ' : ' +
                                    mapResponse['data']['record']['LineItems']
                                        [index]['remarks_by_eng']),
                                Text('pending_qty_to_sub' +
                                    ' : ' +
                                    mapResponse['data']['record']['LineItems']
                                        [index]['pending_qty_to_sub']),
                                Text('rcvd_qty_validated' +
                                    ' : ' +
                                    mapResponse['data']['record']['LineItems']
                                        [index]['rcvd_qty_validated']),
                                Text('pending_qty_for_validation' +
                                    ' : ' +
                                    mapResponse['data']['record']['LineItems']
                                        [index]['pending_qty_for_validation']),
                                Text('excluded_qty' +
                                    ' : ' +
                                    mapResponse['data']['record']['LineItems']
                                        [index]['excluded_qty']),
                                Text('Status' +
                                    ' : ' +
                                    mapResponse['data']['record']['LineItems']
                                        [index]['fail_pa_pa_status']),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: editproduct,
        // tooltip: 'Increment',
        child: const Icon(Icons.edit),
      ),
    );
  }
}
