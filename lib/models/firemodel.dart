class Firemodel {
  String? fire_check_id;
  String? fire_num;
  String? fire_name;
  String? fire_check_color;
  String? fire_check_location;
  String? check_date;
  String? fire_check_injection;
  String? fire_check_joystick;
  String? fire_check_body;
  String? fire_check_gauge;
  String? fire_check_drawback;
  String? user_id;

  Firemodel({
    this.fire_check_id,
    this.fire_num,
    this.fire_name,
    this.fire_check_color,
    this.fire_check_location,
    this.check_date,
    this.fire_check_injection,
    this.fire_check_joystick,
    this.fire_check_body,
    this.fire_check_gauge,
    this.fire_check_drawback,
    this.user_id,
  });

  Firemodel.fromJson(Map<String, dynamic> json) {
    // id: map['id'] == null ? '' : map['id'],
    fire_check_id = json['fire_check_id'] == null ? '' : json['fire_check_id'];
    fire_num = json['fire_num'] == null ? '' : json['fire_num'];
    fire_name = json['fire_name'] == null ? '' : json['fire_name'];
    fire_check_color =
        json['fire_check_color'] == null ? '' : json['fire_check_color'];
    fire_check_location =
        json['fire_check_location'] == null ? '' : json['fire_check_location'];
    check_date = json['check_date'] == null ? '' : json['check_date'];
    fire_check_injection = json['fire_check_injection'] == null
        ? ''
        : json['fire_check_injection'];
    fire_check_joystick =
        json['fire_check_joystick'] == null ? '' : json['fire_check_joystick'];
    fire_check_body =
        json['fire_check_body'] == null ? '' : json['fire_check_body'];
    fire_check_gauge =
        json['fire_check_gauge'] == null ? '' : json['fire_check_gauge'];
    fire_check_drawback =
        json['fire_check_drawback'] == null ? '' : json['fire_check_drawback'];
    user_id = json['user_id'] == null ? '' : json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fire_check_id'] = this.fire_check_id;
    data['fire_num'] = this.fire_num;
    data['fire_name'] = this.fire_name;
    data['fire_check_color'] = this.fire_check_color;
    data['fire_check_location'] = this.fire_check_location;
    data['check_date'] = this.check_date;
    data['fire_check_injection'] = this.fire_check_injection;
    data['fire_check_joystick'] = this.fire_check_joystick;
    data['fire_check_body'] = this.fire_check_body;
    data['fire_check_gauge'] = this.fire_check_gauge;
    data['fire_check_drawback'] = this.fire_check_drawback;
    data['user_id'] = this.user_id;
    return data;
  }

  void add(Firemodel firemodel) {}
}
