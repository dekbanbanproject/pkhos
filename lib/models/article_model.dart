class ArticleModel {
  String? articleId;
  String? articleNum;
  String? articleName;
  String? articlePrice;
  String? articleYear;
  String? articleRecieveDate;
  String? articleTypeid;
  String? articleTypename;
  String? articleCategoryid;
  String? articleCategoryname;
  String? articleGroupid;
  String? articleGroupname;
  String? articleStatusId;
  String? articleImg;
  String? articleImgName;
  String? storeId;
  String? cctv;
  String? cctvLocation;
  String? cctvLocationDetail;
  String? cctvType;
  String? cctvCode;
  String? cctvMonitor;
  String? cctvStatus;
  
  ArticleModel(
      {this.articleId,
      this.articleNum,
      this.articleName,
      this.articlePrice,
      this.articleYear,
      this.articleRecieveDate,
      this.articleTypeid,
      this.articleTypename,
      this.articleCategoryid,
      this.articleCategoryname,
      this.articleGroupid,
      this.articleGroupname,
      this.articleStatusId,
      this.articleImg,
      this.articleImgName,
      this.storeId,
      this.cctv,
      this.cctvLocation,
      this.cctvLocationDetail,
      this.cctvType,
      this.cctvCode,
      this.cctvMonitor,
      this.cctvStatus});

  ArticleModel.fromJson(Map<String, dynamic> json) {
      // id: map['id'] == null ? '' : map['id'], 
    articleId = json['article_id'] == null ? '' : json['article_id'];
    articleNum = json['article_num']== null ? '' : json['article_num'];
    articleName = json['article_name']== null ? '' : json['article_name'];
    articlePrice = json['article_price']== null ? '' : json['article_price'];
    articleYear = json['article_year']== null ? '' : json['article_year'];
    articleRecieveDate = json['article_recieve_date']== null ? '' : json['article_recieve_date'];
    articleTypeid = json['article_typeid']== null ? '' : json['article_typeid'];
    articleTypename = json['article_typename']== null ? '' : json['article_typename'];
    articleCategoryid = json['article_categoryid']== null ? '' : json['article_categoryid'];
    articleCategoryname = json['article_categoryname']== null ? '' : json['article_categoryname'];
    articleGroupid = json['article_groupid']== null ? '' : json['article_groupid'];
    articleGroupname = json['article_groupname']== null ? '' : json['article_groupname'];
    articleStatusId = json['article_status_id']== null ? '' : json['article_status_id'];
    articleImg = json['article_img']== null ? '' : json['article_img'];
    articleImgName = json['article_img_name']== null ? '' : json['article_img_name'];
    storeId = json['store_id']== null ? '' : json['store_id'];
    cctv = json['cctv']== null ? '' : json['cctv'];
    cctvLocation = json['cctv_location']== null ? '' : json['cctv_location'];
    cctvLocationDetail = json['cctv_location_detail']== null ? '' : json['cctv_location_detail'];
    cctvType = json['cctv_type']== null ? '' : json['cctv_type'];
    cctvCode = json['cctv_code']== null ? '' : json['cctv_code'];
    cctvMonitor = json['cctv_monitor']== null ? '' : json['cctv_monitor'];
    cctvStatus = json['cctv_status']== null ? '' : json['cctv_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['article_id'] = this.articleId;
    data['article_num'] = this.articleNum;
    data['article_name'] = this.articleName;
    data['article_price'] = this.articlePrice;
    data['article_year'] = this.articleYear;
    data['article_recieve_date'] = this.articleRecieveDate;
    data['article_typeid'] = this.articleTypeid;
    data['article_typename'] = this.articleTypename;
    data['article_categoryid'] = this.articleCategoryid;
    data['article_categoryname'] = this.articleCategoryname;
    data['article_groupid'] = this.articleGroupid;
    data['article_groupname'] = this.articleGroupname;
    data['article_status_id'] = this.articleStatusId;
    data['article_img'] = this.articleImg;
    data['article_img_name'] = this.articleImgName;
    data['store_id'] = this.storeId;
    data['cctv'] = this.cctv;
    data['cctv_location'] = this.cctvLocation;
    data['cctv_location_detail'] = this.cctvLocationDetail;
    data['cctv_type'] = this.cctvType;
    data['cctv_code'] = this.cctvCode;
    data['cctv_monitor'] = this.cctvMonitor;
    data['cctv_status'] = this.cctvStatus;
    return data;
  }

  void add(ArticleModel articleModel) {}
}
