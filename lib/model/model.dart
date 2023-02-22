import 'dart:convert';

Welcome9 welcome9FromJson(String str) => Welcome9.fromJson(json.decode(str));

String welcome9ToJson(Welcome9 data) => json.encode(data.toJson());

class Welcome9 {
  Welcome9({
    this.statuscode,
    this.data,
    this.statusMessage,
  });

  int statuscode;
  Data data;
  String statusMessage;

  factory Welcome9.fromJson(Map<String, dynamic> json) => Welcome9(
        statuscode: json["statuscode"],
        data: Data.fromJson(json["data"]),
        statusMessage: json["statusMessage"],
      );

  Map<String, dynamic> toJson() => {
        "statuscode": statuscode,
        "data": data.toJson(),
        "statusMessage": statusMessage,
      };
}

class Data {
  Data({
    this.record,
  });

  Record record;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        record: Record.fromJson(json["record"]),
      );

  Map<String, dynamic> toJson() => {
        "record": record.toJson(),
      };
}

class Record {
  Record({
    this.blocks,
    this.id,
    this.lineItems,
    this.po,
    this.podate,
  });

  List<Block> blocks;
  String id;
  List<LineItem> lineItems;
  String po;
  DateTime podate;

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        blocks: List<Block>.from(json["blocks"].map((x) => Block.fromJson(x))),
        id: json["id"],
        lineItems: List<LineItem>.from(
            json["LineItems"].map((x) => LineItem.fromJson(x))),
        po: json["po"],
        podate: DateTime.parse(json["podate"]),
      );

  Map<String, dynamic> toJson() => {
        "blocks": List<dynamic>.from(blocks.map((x) => x.toJson())),
        "id": id,
        "LineItems": List<dynamic>.from(lineItems.map((x) => x.toJson())),
        "po": po,
        "podate":
            "${podate.year.toString().padLeft(4, '0')}-${podate.month.toString().padLeft(2, '0')}-${podate.day.toString().padLeft(2, '0')}",
      };
}

class Block {
  Block({
    this.label,
    this.fields,
  });

  String label;
  List<Field> fields;

  factory Block.fromJson(Map<String, dynamic> json) => Block(
        label: json["label"],
        fields: List<Field>.from(json["fields"].map((x) => Field.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "fields": List<dynamic>.from(fields.map((x) => x.toJson())),
      };
}

class Field {
  Field({
    this.name,
    this.value,
    this.label,
    this.uitype,
    this.editable,
    this.type,
    this.id,
  });

  String name;
  String value;
  String label;
  String uitype;
  bool editable;
  Type type;
  String id;

  factory Field.fromJson(Map<String, dynamic> json) => Field(
        name: json["name"],
        value: json["value"] == null ? null : json["value"],
        label: json["label"],
        uitype: json["uitype"],
        editable: json["editable"],
        type: Type.fromJson(json["type"]),
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value == null ? null : value,
        "label": label,
        "uitype": uitype,
        "editable": editable,
        "type": type.toJson(),
        "id": id == null ? null : id,
      };
}

class Type {
  Type({
    this.defaultValue,
  });

  DefaultValue defaultValue;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        defaultValue: json["defaultValue"] == null
            ? null
            : DefaultValue.fromJson(json["defaultValue"]),
      );

  Map<String, dynamic> toJson() => {
        "defaultValue": defaultValue == null ? null : defaultValue.toJson(),
      };
}

class DefaultValue {
  DefaultValue({
    this.value,
    this.label,
  });

  String value;
  String label;

  factory DefaultValue.fromJson(Map<String, dynamic> json) => DefaultValue(
        value: json["value"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "label": label,
      };
}

class LineItem {
  LineItem({
    this.productid,
    this.productname,
    this.quantity,
    this.comment,
    this.remarksByEng,
    this.replacedDate,
    this.dateOfSubmiss,
    this.collectImmidiately,
    this.failPaSbQty,
    this.failPaPaStatus,
    this.excludedQty,
    this.excludedQtyRem,
    this.pendingQtyToSub,
    this.rcvdQtyTrValidate,
    this.rcvdQtyValidated,
    this.vendorNameLabel,
    this.vendorName,
    this.pendingDays,
    this.salesorderCrQty,
    this.soCreatableQty,
    this.totalExcludedQty,
    this.totExcludedQtyRem,
    this.totalFailPaSbQty,
    this.pendingQtyForValidation,
    this.submittedQtyLog,
    this.lineitemId,
    this.productName,
  });

  String productid;
  String productname;
  String quantity;
  String comment;
  String remarksByEng;
  DateTime replacedDate;
  DateTime dateOfSubmiss;
  String collectImmidiately;
  String failPaSbQty;
  String failPaPaStatus;
  String excludedQty;
  String excludedQtyRem;
  String pendingQtyToSub;
  String rcvdQtyTrValidate;
  String rcvdQtyValidated;
  String vendorNameLabel;
  String vendorName;
  String pendingDays;
  String salesorderCrQty;
  String soCreatableQty;
  String totalExcludedQty;
  List<dynamic> totExcludedQtyRem;
  String totalFailPaSbQty;
  String pendingQtyForValidation;
  List<SubmittedQtyLog> submittedQtyLog;
  String lineitemId;
  String productName;

  factory LineItem.fromJson(Map<String, dynamic> json) => LineItem(
        productid: json["productid"],
        productname: json["productname"],
        quantity: json["quantity"],
        comment: json["comment"],
        remarksByEng: json["remarks_by_eng"],
        replacedDate: DateTime.parse(json["replaced_date"]),
        dateOfSubmiss: DateTime.parse(json["date_of_submiss"]),
        collectImmidiately: json["collect_immidiately"],
        failPaSbQty: json["fail_pa_sb_qty"],
        failPaPaStatus: json["fail_pa_pa_status"],
        excludedQty: json["excluded_qty"],
        excludedQtyRem: json["excluded_qty_rem"],
        pendingQtyToSub: json["pending_qty_to_sub"],
        rcvdQtyTrValidate: json["rcvd_qty_tr_validate"],
        rcvdQtyValidated: json["rcvd_qty_validated"],
        vendorNameLabel: json["vendor_name_Label"],
        vendorName: json["vendor_name"],
        pendingDays: json["pending_days"],
        salesorderCrQty: json["salesorder_cr_qty"],
        soCreatableQty: json["so_creatable_qty"],
        totalExcludedQty: json["total_excluded_qty"],
        totExcludedQtyRem:
            List<dynamic>.from(json["tot_excluded_qty_rem"].map((x) => x)),
        totalFailPaSbQty: json["total_fail_pa_sb_qty"],
        pendingQtyForValidation: json["pending_qty_for_validation"],
        submittedQtyLog: List<SubmittedQtyLog>.from(
            json["submitted_qty_log"].map((x) => SubmittedQtyLog.fromJson(x))),
        lineitemId: json["lineitem_id"],
        productName: json["product_name"],
      );

  Map<String, dynamic> toJson() => {
        "productid": productid,
        "productname": productname,
        "quantity": quantity,
        "comment": comment,
        "remarks_by_eng": remarksByEng,
        "replaced_date":
            "${replacedDate.year.toString().padLeft(4, '0')}-${replacedDate.month.toString().padLeft(2, '0')}-${replacedDate.day.toString().padLeft(2, '0')}",
        "date_of_submiss":
            "${dateOfSubmiss.year.toString().padLeft(4, '0')}-${dateOfSubmiss.month.toString().padLeft(2, '0')}-${dateOfSubmiss.day.toString().padLeft(2, '0')}",
        "collect_immidiately": collectImmidiately,
        "fail_pa_sb_qty": failPaSbQty,
        "fail_pa_pa_status": failPaPaStatus,
        "excluded_qty": excludedQty,
        "excluded_qty_rem": excludedQtyRem,
        "pending_qty_to_sub": pendingQtyToSub,
        "rcvd_qty_tr_validate": rcvdQtyTrValidate,
        "rcvd_qty_validated": rcvdQtyValidated,
        "vendor_name_Label": vendorNameLabel,
        "vendor_name": vendorName,
        "pending_days": pendingDays,
        "salesorder_cr_qty": salesorderCrQty,
        "so_creatable_qty": soCreatableQty,
        "total_excluded_qty": totalExcludedQty,
        "tot_excluded_qty_rem":
            List<dynamic>.from(totExcludedQtyRem.map((x) => x)),
        "total_fail_pa_sb_qty": totalFailPaSbQty,
        "pending_qty_for_validation": pendingQtyForValidation,
        "submitted_qty_log":
            List<dynamic>.from(submittedQtyLog.map((x) => x.toJson())),
        "lineitem_id": lineitemId,
        "product_name": productName,
      };
}

class SubmittedQtyLog {
  SubmittedQtyLog({
    this.quantity,
    this.dateOfSubmiss,
  });

  int quantity;
  DateTime dateOfSubmiss;

  factory SubmittedQtyLog.fromJson(Map<String, dynamic> json) =>
      SubmittedQtyLog(
        quantity: json["quantity"],
        dateOfSubmiss: DateTime.parse(json["date_of_submiss"]),
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "date_of_submiss":
            "${dateOfSubmiss.year.toString().padLeft(4, '0')}-${dateOfSubmiss.month.toString().padLeft(2, '0')}-${dateOfSubmiss.day.toString().padLeft(2, '0')}",
      };
}

class DupResponse {
  var submitqty;
  var lineitem_id;
  var product_name;
  var index;
  DupResponse(this.submitqty, this.lineitem_id, this.product_name, this.index);
}
