import 'dart:convert';

class ArticleModel {
  final String article_id;
  final String article_fsn;
  final String article_num;
  final String article_name;
  final String article_attribute;
  final String article_price;
  final String article_year;
  final String article_img;
  final String article_img_name;
  final String store_id;
  final String cctv;
  final String cctv_location;
  final String cctv_location_detail;
  final String cctv_type;
  final String cctv_code;
  final String cctv_monitor;
  final String cctv_status;

  ArticleModel({
    required this.article_id,
    required this.article_fsn,
    required this.article_num,
    required this.article_name,
    required this.article_attribute,
    required this.article_price,
    required this.article_year,
    required this.article_img,
    required this.article_img_name,
    required this.store_id,
    required this.cctv,
    required this.cctv_location,
    required this.cctv_location_detail,
    required this.cctv_type,
    required this.cctv_code,
    required this.cctv_monitor,
    required this.cctv_status,
  });
  ArticleModel copyWith({
    String? article_id,
    String? article_fsn,
    String? article_num,
    String? article_name,
    String? article_attribute,
    String? article_price,
    String? article_year,
    String? article_img,
    String? article_img_name,
    String? store_id,
    String? cctv,
    String? cctv_location,
    String? cctv_location_detail,
    String? cctv_type,
    String? cctv_code,
    String? cctv_monitor,
    String? cctv_status,
  }) {
    return ArticleModel(
      article_id: article_id ?? this.article_id,
      article_fsn: article_fsn ?? this.article_fsn,
      article_num: article_num ?? this.article_num,
      article_name: article_name ?? this.article_name,
      article_attribute: article_attribute ?? this.article_attribute,
      article_price: article_price ?? this.article_price,
      article_year: article_year ?? this.article_year,
      article_img: article_img ?? this.article_img,
      article_img_name: article_img_name ?? this.article_img_name,
      store_id: store_id ?? this.store_id,
      cctv: cctv ?? this.cctv,
      cctv_location: cctv_location ?? this.cctv_location,
      cctv_location_detail: cctv_location_detail ?? this.cctv_location_detail,
      cctv_type: cctv_type ?? this.cctv_type,
      cctv_code: cctv_code ?? this.cctv_code,
      cctv_monitor: cctv_monitor ?? this.cctv_monitor,
      cctv_status: cctv_status ?? this.cctv_status,
    );
  }

  Map<String, dynamic> toMap() {
    return{
      'article_id': article_id,
      'article_fsn': article_fsn,
      'article_num': article_num,
      'article_name': article_name,
      'article_attribute': article_attribute,
      'article_price': article_price,
      'article_year': article_year,
      'article_img': article_img,
      'article_img_name': article_img_name,
      'store_id': store_id,
      'cctv': cctv,
      'cctv_location': cctv_location,
      'cctv_location_detail': cctv_location_detail,
      'cctv_type': cctv_type,
      'cctv_code': cctv_code,
      'cctv_monitor': cctv_monitor,
      'cctv_status': cctv_status,
    };
  }

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      article_id: map['article_id'] == null ? '' : map['article_id'],
      article_fsn: map['article_fsn'] == null ? '' : map['article_fsn'],
      article_num: map['article_num'] == null ? '' : map['article_num'],
      article_name: map['article_name'] == null ? '' : map['article_name'],
      article_attribute:
          map['article_attribute'] == null ? '' : map['article_attribute'],
      article_price: map['article_price'] == null ? '' : map['article_price'],
      article_year: map['article_year'] == null ? '' : map['article_year'],
      article_img: map['article_img'] == null ? '' : map['article_img'],
      article_img_name:
          map['article_img_name'] == null ? '' : map['article_img_name'],
      store_id: map['store_id'] == null ? '' : map['store_id'],
      cctv: map['cctv'] == null ? '' : map['cctv'],
      cctv_location: map['cctv_location'] == null ? '' : map['cctv_location'],
      cctv_location_detail: map['cctv_location_detail'] == null
          ? ''
          : map['cctv_location_detail'],
      cctv_type: map['cctv_type'] == null ? '' : map['cctv_type'],
      cctv_code: map['cctv_code'] == null ? '' : map['cctv_code'],
      cctv_monitor: map['cctv_monitor'] == null ? '' : map['cctv_monitor'],
      cctv_status: map['cctv_status'] == null ? '' : map['cctv_status'],
    );
  }
  String toJson() => json.encode(toMap());
  factory ArticleModel.fromJson(String source) =>
      ArticleModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ArticleModel(article_id: $article_id, article_fsn: $article_fsn, article_num: $article_num, article_name: $article_name, article_attribute: $article_attribute, article_price: $article_price, article_year: $article_year, article_img: $article_img, article_img_name: $article_img_name, store_id: $store_id, cctv: $cctv, cctv_location: $cctv_location, cctv_location_detail: $cctv_location_detail, cctv_type: $cctv_type, cctv_code: $cctv_code, cctv_monitor: $cctv_monitor, cctv_status: $cctv_status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ArticleModel && 
    other.article_id == article_id &&
        other.article_fsn == article_fsn &&
        other.article_num == article_num &&
        other.article_name == article_name &&
        other.article_attribute == article_attribute &&
        other.article_price == article_price &&
        other.article_year == article_year &&
        other.article_img == article_img &&
        other.article_img_name == article_img_name &&
        other.store_id == store_id &&
        other.cctv == cctv &&
        other.cctv_location == cctv_location &&
        other.cctv_location_detail == cctv_location_detail &&
        other.cctv_type == cctv_type &&
        other.cctv_code == cctv_code &&
        other.cctv_monitor == cctv_monitor &&
        other.cctv_status == cctv_status;
  }

  @override
  int get hashCode {
    return article_id.hashCode ^
        article_fsn.hashCode ^
        article_num.hashCode ^
        article_name.hashCode ^
        article_attribute.hashCode ^
        article_price.hashCode ^
        article_img.hashCode ^
        article_img_name.hashCode ^
        store_id.hashCode ^
        cctv.hashCode ^
        cctv_location.hashCode ^
        cctv_location_detail.hashCode ^
        cctv_type.hashCode ^
        cctv_code.hashCode ^
        cctv_monitor.hashCode ^
        cctv_status.hashCode;
  }
}
