class ArticleModel {
  String? articleId;
  String? articleFsn;
  String? articleNum;
  String? articleName;
  String? articleAttribute;
  String? articlePrice;
  String? articleYear;
  String? articleRecieveDate;
  String? articleSpypriceid;
  String? articleSpypricename;
  String? articleRegister;
  String? articleTypeid;
  String? articleTypename;
  String? articleCategoryid;
  String? articleCategoryname;
  String? articleGroupid;
  String? articleGroupname;
  String? articleMethodId;
  String? articleBuyId;
  String? articleBuyName;
  String? articleBudgetId;
  String? articleDeclineId;
  String? articleDeclineName;
  String? articleVendorId;
  String? articleVendorName;
  String? articleDebSubsubId;
  String? articleDebSubsubName;
  String? articleCarTypeId;
  String? articleCarTypeName;
  String? articleCarNumber;
  String? articleSerialNo;
  String? articleStatusId;
  String? articleModelId;
  String? articleColorId;
  String? articleBrandId;
  String? articleSizeId;
  String? articleUnitId;
  String? articleImg;
  String? articleImgName;
  String? storeId;

  ArticleModel(
      {this.articleId,
      this.articleFsn,
      this.articleNum,
      this.articleName,
      this.articleAttribute,
      this.articlePrice,
      this.articleYear,
      this.articleRecieveDate,
      this.articleSpypriceid,
      this.articleSpypricename,
      this.articleRegister,
      this.articleTypeid,
      this.articleTypename,
      this.articleCategoryid,
      this.articleCategoryname,
      this.articleGroupid,
      this.articleGroupname,
      this.articleMethodId,
      this.articleBuyId,
      this.articleBuyName,
      this.articleBudgetId,
      this.articleDeclineId,
      this.articleDeclineName,
      this.articleVendorId,
      this.articleVendorName,
      this.articleDebSubsubId,
      this.articleDebSubsubName,
      this.articleCarTypeId,
      this.articleCarTypeName,
      this.articleCarNumber,
      this.articleSerialNo,
      this.articleStatusId,
      this.articleModelId,
      this.articleColorId,
      this.articleBrandId,
      this.articleSizeId,
      this.articleUnitId,
      this.articleImg,
      this.articleImgName,
      this.storeId});

  ArticleModel.fromJson(Map<String, dynamic> json) {
    articleId = json['article_id'];
    articleFsn = json['article_fsn'];
    articleNum = json['article_num'];
    articleName = json['article_name'];
    articleAttribute = json['article_attribute'];
    articlePrice = json['article_price'];
    articleYear = json['article_year'];
    articleRecieveDate = json['article_recieve_date'];
    articleSpypriceid = json['article_spypriceid'];
    articleSpypricename = json['article_spypricename'];
    articleRegister = json['article_register'];
    articleTypeid = json['article_typeid'];
    articleTypename = json['article_typename'];
    articleCategoryid = json['article_categoryid'];
    articleCategoryname = json['article_categoryname'];
    articleGroupid = json['article_groupid'];
    articleGroupname = json['article_groupname'];
    articleMethodId = json['article_method_id'];
    articleBuyId = json['article_buy_id'];
    articleBuyName = json['article_buy_name'];
    articleBudgetId = json['article_budget_id'];
    articleDeclineId = json['article_decline_id'];
    articleDeclineName = json['article_decline_name'];
    articleVendorId = json['article_vendor_id'];
    articleVendorName = json['article_vendor_name'];
    articleDebSubsubId = json['article_deb_subsub_id'];
    articleDebSubsubName = json['article_deb_subsub_name'];
    articleCarTypeId = json['article_car_type_id'];
    articleCarTypeName = json['article_car_type_name'];
    articleCarNumber = json['article_car_number'];
    articleSerialNo = json['article_serial_no'];
    articleStatusId = json['article_status_id'];
    articleModelId = json['article_model_id'];
    articleColorId = json['article_color_id'];
    articleBrandId = json['article_brand_id'];
    articleSizeId = json['article_size_id'];
    articleUnitId = json['article_unit_id'];
    articleImg = json['article_img'];
    articleImgName = json['article_img_name'];
    storeId = json['store_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['article_id'] = this.articleId;
    data['article_fsn'] = this.articleFsn;
    data['article_num'] = this.articleNum;
    data['article_name'] = this.articleName;
    data['article_attribute'] = this.articleAttribute;
    data['article_price'] = this.articlePrice;
    data['article_year'] = this.articleYear;
    data['article_recieve_date'] = this.articleRecieveDate;
    data['article_spypriceid'] = this.articleSpypriceid;
    data['article_spypricename'] = this.articleSpypricename;
    data['article_register'] = this.articleRegister;
    data['article_typeid'] = this.articleTypeid;
    data['article_typename'] = this.articleTypename;
    data['article_categoryid'] = this.articleCategoryid;
    data['article_categoryname'] = this.articleCategoryname;
    data['article_groupid'] = this.articleGroupid;
    data['article_groupname'] = this.articleGroupname;
    data['article_method_id'] = this.articleMethodId;
    data['article_buy_id'] = this.articleBuyId;
    data['article_buy_name'] = this.articleBuyName;
    data['article_budget_id'] = this.articleBudgetId;
    data['article_decline_id'] = this.articleDeclineId;
    data['article_decline_name'] = this.articleDeclineName;
    data['article_vendor_id'] = this.articleVendorId;
    data['article_vendor_name'] = this.articleVendorName;
    data['article_deb_subsub_id'] = this.articleDebSubsubId;
    data['article_deb_subsub_name'] = this.articleDebSubsubName;
    data['article_car_type_id'] = this.articleCarTypeId;
    data['article_car_type_name'] = this.articleCarTypeName;
    data['article_car_number'] = this.articleCarNumber;
    data['article_serial_no'] = this.articleSerialNo;
    data['article_status_id'] = this.articleStatusId;
    data['article_model_id'] = this.articleModelId;
    data['article_color_id'] = this.articleColorId;
    data['article_brand_id'] = this.articleBrandId;
    data['article_size_id'] = this.articleSizeId;
    data['article_unit_id'] = this.articleUnitId;
    data['article_img'] = this.articleImg;
    data['article_img_name'] = this.articleImgName;
    data['store_id'] = this.storeId;
    return data;
  }
}
