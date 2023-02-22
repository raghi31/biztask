import 'dart:convert';
import 'package:biztask/model/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './widgets/notify.dart';
import 'package:http/http.dart' as http;

class EditScreen extends StatefulWidget {
  const EditScreen({Key key}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final mapResponse = Get.arguments['mapResponse'];

  // final _formKey = GlobalKey<FormState>();
  List<DupResponse> duplicate = [];

  void _trysubmit() {
    duplicate.forEach((element) {
      if (element.lineitem_id ==
              mapResponse['data']['record']['LineItems'][element.index]
                  ['lineitem_id'] &&
          element.product_name ==
              mapResponse['data']['record']['LineItems'][element.index]
                  ['product_name']) {
        if (int.parse(element.submitqty) == 0 ||
            int.parse(element.submitqty).isBlank) {
          //
        } else {
          Postapicall();
        }
      }
    });
    Get.back();
  }

  void _submittable(submitqty, lineitem_id, product_name, index) {
    // DupResponse(submitqty, lineitem_id, product_name);
    setState(() {
      duplicate.add(DupResponse(submitqty, lineitem_id, product_name, index));
      var qty = submitqty;
      var _id = lineitem_id;
      var name = product_name;
    });
  }

  Future Postapicall() async {
    http.Response response;
    final url = Uri.parse(
        'http://crm.bemlindia.in/bemlquality/modules/Mobile/v1/saveRecord?module=FailedParts&access_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyaWQiOiIzMjgifQ.SXPWzlE mHo39siKEzn9f34m2Cgz4jM4dxg68AWEEguU&useruniqueid=328&record=57x621425');
    response = await http.post(url,
        body: jsonEncode({
          "LineItems": [
            {
              "productname": "130969850184",
              "productid": "14x618384",
              "lineitem_id": "618775",
              "fail_pa_sb_qty": "1",
              "remarks_by_eng": "submitted by SE",
              "date_of_submiss": "2022-12-23"
            },
            {
              "productname": "130969850184",
              "productid": "14x618384",
              "lineitem_id": "618776",
              "fail_pa_sb_qty": "2",
              "remarks_by_eng": "submitted by SE",
              "date_of_submiss": "2022-12-23"
            }
          ]
        }));

    if (response.statusCode == 200) {
      // setState(() {
      //   stringResponse = response.body;
      //   mapResponse = jsonDecode(stringResponse);
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    var itemcount = mapResponse['data']['record']['LineItems'].length;

    // void addUserData(DupResponse user) {
    //   setState(() {
    //     duplicate.add(user);
    //   });
    // }

    // int maxqty = double.parse(mapResponse['data']['record']['LineItems'][index]
    //             ['quantity']
    //         .toString())
    //     .toInt();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit product details'),
      ),
      body: Column(children: [
        Column(
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
          ],
        ),
        // Column(
        //   children: [
        //     Text(mapResponse['data']['record']['LineItems']['productname']),
        //     Text(mapResponse['data']['record']['LineItems']['replaced_date']),
        //     Text(mapResponse['data']['record']['LineItems']['pending_days']),
        //     Text(mapResponse['data']['record']['LineItems']['submitted_qty_log']
        //             [0]['quantity']
        //         .toString()),
        //     // Text(mapResponse
        //     //     ['submitted_qty_log']['date_of_submiss']),
        //     Text(mapResponse['data']['record']['LineItems']['remarks_by_eng']),
        //     Text(mapResponse['data']['record']['LineItems']
        //         ['pending_qty_to_sub']),
        //     Text(mapResponse['data']['record']['LineItems']
        //         ['rcvd_qty_validated']),
        //     Text(mapResponse['data']['record']['LineItems']
        //         ['pending_qty_for_validation']),
        //     Text(mapResponse['data']['record']['LineItems']['excluded_qty']),
        //     Text(mapResponse['data']['record']['LineItems']
        //         ['fail_pa_pa_status']),

        //     Form(
        //       key: _formKey,
        //       child: Column(
        //         children: [
        //           TextFormField(
        //             key: const ValueKey('qty'),
        //             decoration:
        //                 const InputDecoration(labelText: 'Submitted quantity'),
        //             keyboardType: TextInputType.number,
        //             validator: (value) {
        //               if (value.isEmpty || int.parse(value) == 0
        //                   // int.parse(value) > maxqty
        //                   ) {
        //                 return 'Submitted quantity should be greater than 0';
        //               }
        //               return null;
        //             },
        //           ),
        //           TextFormField(
        //             key: const ValueKey('remarks'),
        //             decoration: const InputDecoration(
        //                 labelText: 'Remarks by service engineer'),
        //             keyboardType: TextInputType.text,
        //             validator: (remarks) {
        //               // if (!remarks.isEmpty) {
        //               //   return 'Submitted quantity should be greater than 0';
        //               // }
        //               // return null;
        //             },
        //             onFieldSubmitted: (value) {
        //               // enteredQty = int.parse(value);
        //               // _trySubmit(enteredQty, context, uid);
        //             },
        //           ),
        //           TextFormField(
        //             key: const ValueKey('submitdate'),
        //             decoration:
        //                 const InputDecoration(labelText: 'Date of Submission'),
        //             keyboardType: TextInputType.datetime,
        //             validator: (qty) {
        //               // if (!qty.isEmpty) {
        //               //   return 'Submitted quantity should be greater than 0';
        //               // }
        //               // return null;
        //             },
        //             onFieldSubmitted: (value) {
        //               // enteredQty = int.parse(value);
        //               // _trySubmit(enteredQty, context, uid);
        //             },
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        Expanded(
          flex: 1,
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Card(
                  child: Notify(
                      mapResponse['data']['record']['LineItems'][index],
                      index,
                      _submittable));
            },
          ),
        ),
        ElevatedButton(
          onPressed: _trysubmit,
          child: const Text('Submit'),
        ),
      ]),
    );
  }
}
