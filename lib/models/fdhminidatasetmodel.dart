class Fdhminidatasetmodel {
  String? fdh_mini_dataset_id;
  String? service_date_time;
  String? cid;
  String? hcode;
  String? total_amout;
  String? invoice_number;
  String? vn;
  String? pttype;
  String? hn;
  String? ptname;
  String? vstdate;
  String? transaction_uid;
  String? id_booking;
  String? uuid_booking;

  Fdhminidatasetmodel({
    this.fdh_mini_dataset_id,
    this.service_date_time,
    this.cid,
    this.hcode,
    this.total_amout,
    this.invoice_number,
    this.vn,
    this.pttype,
    this.hn,
    this.ptname,
    this.vstdate,
    this.transaction_uid,
    this.id_booking,
    this.uuid_booking,
  });

  Fdhminidatasetmodel.fromJson(Map<String, dynamic> json) {
    // id: map['id'] == null ? '' : map['id'],
    fdh_mini_dataset_id =
        json['fdh_mini_dataset_id'] == null ? '' : json['fdh_mini_dataset_id'];
    service_date_time =
        json['service_date_time'] == null ? '' : json['service_date_time'];
    cid = json['cid'] == null ? '' : json['cid'];
    hcode = json['hcode'] == null ? '' : json['hcode'];
    total_amout = json['total_amout'] == null ? '' : json['total_amout'];
    invoice_number =
        json['invoice_number'] == null ? '' : json['invoice_number'];
    vn = json['vn'] == null ? '' : json['vn'];
    pttype = json['pttype'] == null ? '' : json['pttype'];
    hn = json['hn'] == null ? '' : json['hn'];
    ptname = json['ptname'] == null ? '' : json['ptname'];
    vstdate = json['vstdate'] == null ? '' : json['vstdate'];
    transaction_uid =
        json['transaction_uid'] == null ? '' : json['transaction_uid'];
    id_booking = json['id_booking'] == null ? '' : json['id_booking'];
    uuid_booking = json['uuid_booking'] == null ? '' : json['uuid_booking'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fdh_mini_dataset_id'] = this.fdh_mini_dataset_id;
    data['service_date_time'] = this.service_date_time;
    data['cid'] = this.cid;
    data['hcode'] = this.hcode;
    data['total_amout'] = this.total_amout;
    data['invoice_number'] = this.invoice_number;
    data['vn'] = this.vn;
    data['pttype'] = this.pttype;
    data['hn'] = this.hn;
    data['ptname'] = this.ptname;
    data['vstdate'] = this.vstdate;
    data['transaction_uid'] = this.transaction_uid;
    data['id_booking'] = this.id_booking;
    data['uuid_booking'] = this.uuid_booking;
    return data;
  }

  void add(Fdhminidatasetmodel fdhminidatasetModel) {}

 
}
