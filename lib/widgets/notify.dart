import 'package:flutter/material.dart';
import '../model/model.dart';

class Notify extends StatefulWidget {
  var mapResponse;
  var index;
  final Function submittable;

  Notify(this.mapResponse, this.index, this.submittable);

  @override
  State<Notify> createState() => _NotifyState();
}

// mixin index {}

class _NotifyState extends State<Notify> {
  final _formKey = GlobalKey<FormState>();
  // List<DupResponse> duplicate = [];
  void _trySubmit(qty, ctx, index) {
    final isValid = _formKey.currentState.validate();
    // FocusScope.of(ctx).unfocus();
    if (isValid) {
      _formKey.currentState.save();
      widget.submittable(qty, widget.mapResponse['lineitem_id'],
          widget.mapResponse['productname'], index);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<DupResponse> dupResponse = [];

    return Column(
      children: [
        Text(widget.mapResponse['productname']),
        Text(widget.mapResponse['comment']),
        Text(widget.mapResponse['replaced_date']),
        Text(widget.mapResponse['pending_days']),
        // Text(mapResponse[
        //         ['submitted_qty_log'][0]['quantity']
        //     .toString()),
        // Text(mapResponse
        //     ['submitted_qty_log']['date_of_submiss']),
        Text(widget.mapResponse['remarks_by_eng']),
        Text(widget.mapResponse['pending_qty_to_sub']),
        Text(widget.mapResponse['rcvd_qty_validated']),
        Text(widget.mapResponse['pending_qty_for_validation']),
        Text(widget.mapResponse['excluded_qty']),
        Text(widget.mapResponse['fail_pa_pa_status']),

        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                key: ValueKey(widget.index),
                decoration:
                    const InputDecoration(labelText: 'Submitted quantity'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  double max = double.parse(widget.mapResponse['quantity']);
                  int maxqty = max.toInt();

                  if (value.isEmpty ||
                      int.parse(value) == 0 ||
                      int.parse(value) > maxqty) {
                    return 'Submitted quantity should be greater than 0';
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  _trySubmit(value, context, widget.index);
                },
                onChanged: (value) {
                  // final user = DupResponse(
                  //     value,
                  //     widget.mapResponse['lineitem_id'],
                  //     widget.mapResponse['productname']);

                  _trySubmit(value, context, widget.index);
                },
              ),
              TextFormField(
                key: const ValueKey('remarks'),
                decoration: const InputDecoration(
                    labelText: 'Remarks by service engineer'),
                keyboardType: TextInputType.text,
                onFieldSubmitted: (value) {
                  // enteredQty = int.parse(value);
                  // _trySubmit(enteredQty, context, uid);
                },
              ),
              TextFormField(
                key: const ValueKey('submitdate'),
                decoration:
                    const InputDecoration(labelText: 'Date of Submission'),
                keyboardType: TextInputType.datetime,
                onFieldSubmitted: (value) {
                  // enteredQty = int.parse(value);
                  // _trySubmit(enteredQty, context, uid);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
