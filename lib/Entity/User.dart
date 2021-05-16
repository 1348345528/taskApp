class User {
  String id;
  String delFlag;
  String code;
  String name;
  Null orgId;
  Null orgName;
  String displayName;
  String password;
  String mobile;
  String email;
  String avatar;
  String type;
  String status;
  String active;
  String displayEn;
  String workPlace;
  String phone;
  String tell;

  User(
      {this.id,
        this.delFlag,
        this.code,
        this.name,
        this.orgId,
        this.orgName,
        this.displayName,
        this.password,
        this.mobile,
        this.email,
        this.avatar,
        this.type,
        this.status,
        this.active,
        this.displayEn,
        this.workPlace,
        this.phone,
        this.tell});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    delFlag = json['delFlag'];
    code = json['code'];
    name = json['name'];
    orgId = json['orgId'];
    orgName = json['orgName'];
    displayName = json['displayName'];
    password = json['password'];
    mobile = json['mobile'];
    email = json['email'];
    avatar = json['avatar'];
    type = json['type'];
    status = json['status'];
    active = json['active'];
    displayEn = json['displayEn'];
    workPlace = json['workPlace'];
    phone = json['phone'];
    tell = json['tell'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['delFlag'] = this.delFlag;
    data['code'] = this.code;
    data['name'] = this.name;
    data['orgId'] = this.orgId;
    data['orgName'] = this.orgName;
    data['displayName'] = this.displayName;
    data['password'] = this.password;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    data['type'] = this.type;
    data['status'] = this.status;
    data['active'] = this.active;
    data['displayEn'] = this.displayEn;
    data['workPlace'] = this.workPlace;
    data['phone'] = this.phone;
    data['tell'] = this.tell;
    return data;
  }
}