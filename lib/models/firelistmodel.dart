class FireListmodel {
  String? fire_id;
  String? fire_num;
  String? fire_name;
  String? fire_size;
  String? fire_color;
  String? fire_location;
  String? fire_qty;
  String? fire_unit;
  String? active;
  String? fire_img;
  String? fire_year;
  String? user_id;

  FireListmodel({
    this.fire_id,
    this.fire_num,
    this.fire_name,
    this.fire_size,
    this.fire_color,
    this.fire_location,
    this.fire_qty,
    this.fire_unit,
    this.active,
    this.fire_img,
    this.fire_year,
    this.user_id,
  });

  FireListmodel.fromJson(Map<String, dynamic> json) {
    // id: map['id'] == null ? '' : map['id'],
    fire_id = json['fire_id'] == null ? '' : json['fire_id'];
    fire_num = json['fire_num'] == null ? '' : json['fire_num'];
    fire_name = json['fire_name'] == null ? '' : json['fire_name'];
    fire_size =
        json['fire_size'] == null ? '' : json['fire_size'];
    fire_color =
        json['fire_color'] == null ? '' : json['fire_color'];
    fire_location = json['fire_location'] == null ? '' : json['fire_location'];
    fire_qty = json['fire_qty'] == null
        ? ''
        : json['fire_qty'];
    fire_unit =
        json['fire_unit'] == null ? '' : json['fire_unit'];
    active =
        json['active'] == null ? '' : json['active'];
    fire_img =
        json['fire_img'] == null ? '' : json['fire_img'];
    fire_year =
        json['fire_year'] == null ? '' : json['fire_year'];
    user_id = json['user_id'] == null ? '' : json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fire_id'] = this.fire_id;
    data['fire_num'] = this.fire_num;
    data['fire_name'] = this.fire_name;
    data['fire_size'] = this.fire_size;
    data['fire_color'] = this.fire_color;
    data['fire_location'] = this.fire_location;
    data['fire_qty'] = this.fire_qty;
    data['fire_unit'] = this.fire_unit;
    data['active'] = this.active;
    data['fire_img'] = this.fire_img;
    data['fire_year'] = this.fire_year;
    data['user_id'] = this.user_id;
    return data;
  }

  void add(FireListmodel firelistmodel) {}
}
