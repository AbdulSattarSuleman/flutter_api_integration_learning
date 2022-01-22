/// Count : "30"
/// skuCategoryDetail : [{"SKUCatId":21,"Name":"All stationary ","Remarks":"","ImageUrl1":"https://www.dubaisuperstore.com.pk/Images/Uploaded/1983Cat_download.jpg","Active":"1","SKUDeptId":"13"},{"SKUCatId":19,"Name":"Automotive ","Remarks":"","ImageUrl1":"https://www.dubaisuperstore.com.pk/Images/Uploaded/1981Cat_download (2).jpg","Active":"1","SKUDeptId":"7"},{"SKUCatId":12,"Name":"Bath & Body","Remarks":"","ImageUrl1":"https://www.dubaisuperstore.com.pk/Images/Uploaded/1972Cat_bath and bod.jpg","Active":"1","SKUDeptId":"4"},{"SKUCatId":10,"Name":"Beverages ","Remarks":"","ImageUrl1":"https://www.dubaisuperstore.com.pk/Images/Uploaded/351Cat_Beverages.jpg","Active":"1","SKUDeptId":"1"},{"SKUCatId":2,"Name":"Breakfast","Remarks":"","ImageUrl1":"https://www.dubaisuperstore.com.pk/Images/Uploaded/1967Cat_breakfast.jpg","Active":"1","SKUDeptId":"1"},{"SKUCatId":28,"Name":"candy chocolates","Remarks":"","ImageUrl1":"https://www.dubaisuperstore.com.pk/","Active":"1","SKUDeptId":"1"},{"SKUCatId":15,"Name":"Cooling Heating ","Remarks":"","ImageUrl1":"https://www.dubaisuperstore.com.pk/Images/Uploaded/1960Cat_download.jpg","Active":"1","SKUDeptId":"3"},{"SKUCatId":22,"Name":"crockery ","Remarks":"","ImageUrl1":"https://www.dubaisuperstore.com.pk/Images/Uploaded/2207Cat_ttttt.jpg","Active":"1","SKUDeptId":"14"},{"SKUCatId":13,"Name":"Desserts","Remarks":"","ImageUrl1":"https://www.dubaisuperstore.com.pk/Images/Uploaded/1961Cat_tdfgdfgfd.jpg","Active":"1","SKUDeptId":"3"},{"SKUCatId":4,"Name":"Diapering & Potty","Remarks":"","ImageUrl1":"https://www.dubaisuperstore.com.pk/Images/Uploaded/3601Cat_Diapers-small.jpg","Active":"1","SKUDeptId":"3"},{"SKUCatId":7,"Name":"Feeding","Remarks":"","ImageUrl1":"https://www.dubaisuperstore.com.pk/Images/Uploaded/3600Cat_feeding.jpg","Active":"1","SKUDeptId":"8"},{"SKUCatId":3,"Name":"Food Staples","Remarks":"","ImageUrl1":"https://www.dubaisuperstore.com.pk/Images/Uploaded/1970Cat_foooooood.jpg","Active":"1","SKUDeptId":"1"},{"SKUCatId":18,"Name":"Fragrances","Remarks":"","ImageUrl1":"https://www.dubaisuperstore.com.pk/Images/Uploaded/1974Cat_frag.jpg","Active":"1","SKUDeptId":"5"},{"SKUCatId":24,"Name":"Fresh products","Remarks":"","ImageUrl1":"https://www.dubaisuperstore.com.pk/","Active":"1","SKUDeptId":"1"},{"SKUCatId":25,"Name":"Frozen","Remarks":"","ImageUrl1":"https://www.dubaisuperstore.com.pk/Images/Uploaded/3603Cat_kns.jpg","Active":"1","SKUDeptId":"1"},{"SKUCatId":31,"Name":"fruits & Vegitables ","Remarks":"","ImageUrl1":"https://www.dubaisuperstore.com.pk/Images/Uploaded/5142Cat_images (2).jpg","Active":"1","SKUDeptId":"15"},{"SKUCatId":5,"Name":"Hair care","Remarks":"","ImageUrl1":"https://www.dubaisuperstore.com.pk/","Active":"1","SKUDeptId":"4"},{"SKUCatId":23,"Name":"house hold","Remarks":"","ImageUrl1":"https://www.dubaisuperstore.com.pk/Images/Uploaded/2208Cat_rrrr.jpg","Active":"1","SKUDeptId":"14"},{"SKUCatId":30,"Name":"Ice creams","Remarks":"","ImageUrl1":"https://www.dubaisuperstore.com.pk/Images/Uploaded/4759Cat_download (1).jpg","Active":"1","SKUDeptId":"1"},{"SKUCatId":32,"Name":"Imported Items","Remarks":"","ImageUrl1":"https://www.dubaisuperstore.com.pk/Images/Uploaded/6114Cat_download.jpg","Active":"1","SKUDeptId":"16"},{"SKUCatId":1,"Name":"Ketchups, Pickles & Murabas","Remarks":"","ImageUrl1":"https://www.dubaisuperstore.com.pk/Images/Uploaded/1971Cat_ketchup.jpg","Active":"1","SKUDeptId":"1"},{"SKUCatId":8,"Name":"Laundry & House Hold","Remarks":"","ImageUrl1":"https://www.dubaisuperstore.com.pk/Images/Uploaded/3599Cat_Laundary-Care.jpg","Active":"1","SKUDeptId":"5"},{"SKUCatId":17,"Name":"Medical Equipment","Remarks":"","ImageUrl1":"https://www.dubaisuperstore.com.pk/Images/Uploaded/1980Cat_asdsfsdfsdf.jpg","Active":"1","SKUDeptId":"11"},{"SKUCatId":9,"Name":"Men","Remarks":"","ImageUrl1":"https://www.dubaisuperstore.com.pk/Images/Uploaded/1964Cat_mens.jpg","Active":"1","SKUDeptId":"3"},{"SKUCatId":11,"Name":"Personal Care","Remarks":"","ImageUrl1":"https://www.dubaisuperstore.com.pk/Images/Uploaded/1965Cat_personal care.jpg","Active":"1","SKUDeptId":"3"},{"SKUCatId":20,"Name":"Plastic","Remarks":"","ImageUrl1":"https://www.dubaisuperstore.com.pk/Images/Uploaded/1976Cat_fsddbcb.jpg","Active":"1","SKUDeptId":"6"},{"SKUCatId":6,"Name":"Skin Care","Remarks":"","ImageUrl1":"https://www.dubaisuperstore.com.pk/Images/Uploaded/3602Cat_Skin-Care.jpg","Active":"1","SKUDeptId":"4"},{"SKUCatId":14,"Name":"Small Kitchen Appliances","Remarks":"","ImageUrl1":"https://www.dubaisuperstore.com.pk/Images/Uploaded/1977Cat_download (1).jpg","Active":"1","SKUDeptId":"6"},{"SKUCatId":16,"Name":"Snacks","Remarks":"","ImageUrl1":"https://www.dubaisuperstore.com.pk/Images/Uploaded/1966Cat_ghfghgjgh.jpg","Active":"1","SKUDeptId":"3"},{"SKUCatId":29,"Name":"Toys and birthday","Remarks":"","ImageUrl1":"https://www.dubaisuperstore.com.pk/","Active":"1","SKUDeptId":"3"}]

class SuperStoreModel {
  SuperStoreModel({
      String? count, 
      List<SkuCategoryDetail>? skuCategoryDetail,}){
    _count = count;
    _skuCategoryDetail = skuCategoryDetail;
}

  SuperStoreModel.fromJson(dynamic json) {
    _count = json['Count'];
    if (json['skuCategoryDetail'] != null) {
      _skuCategoryDetail = [];
      json['skuCategoryDetail'].forEach((v) {
        _skuCategoryDetail?.add(SkuCategoryDetail.fromJson(v));
      });
    }
  }
  String? _count;
  List<SkuCategoryDetail>? _skuCategoryDetail;

  String? get count => _count;
  List<SkuCategoryDetail>? get skuCategoryDetail => _skuCategoryDetail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Count'] = _count;
    if (_skuCategoryDetail != null) {
      map['skuCategoryDetail'] = _skuCategoryDetail?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// SKUCatId : 21
/// Name : "All stationary "
/// Remarks : ""
/// ImageUrl1 : "https://www.dubaisuperstore.com.pk/Images/Uploaded/1983Cat_download.jpg"
/// Active : "1"
/// SKUDeptId : "13"

class SkuCategoryDetail {
  SkuCategoryDetail({
      int? sKUCatId, 
      String? name, 
      String? remarks, 
      String? imageUrl1, 
      String? active, 
      String? sKUDeptId,}){
    _sKUCatId = sKUCatId;
    _name = name;
    _remarks = remarks;
    _imageUrl1 = imageUrl1;
    _active = active;
    _sKUDeptId = sKUDeptId;
}

  SkuCategoryDetail.fromJson(dynamic json) {
    _sKUCatId = json['SKUCatId'];
    _name = json['Name'];
    _remarks = json['Remarks'];
    _imageUrl1 = json['ImageUrl1'];
    _active = json['Active'];
    _sKUDeptId = json['SKUDeptId'];
  }
  int? _sKUCatId;
  String? _name;
  String? _remarks;
  String? _imageUrl1;
  String? _active;
  String? _sKUDeptId;

  int? get sKUCatId => _sKUCatId;
  String? get name => _name;
  String? get remarks => _remarks;
  String? get imageUrl1 => _imageUrl1;
  String? get active => _active;
  String? get sKUDeptId => _sKUDeptId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['SKUCatId'] = _sKUCatId;
    map['Name'] = _name;
    map['Remarks'] = _remarks;
    map['ImageUrl1'] = _imageUrl1;
    map['Active'] = _active;
    map['SKUDeptId'] = _sKUDeptId;
    return map;
  }

}