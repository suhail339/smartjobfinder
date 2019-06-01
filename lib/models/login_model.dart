import 'package:flutter/material.dart';
class LoginData {
  String message;
  bool success;
  Body body;

  LoginData({this.message, this.success, this.body});

  LoginData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    if (this.body != null) {
      data['body'] = this.body.toJson();
    }
    return data;
  }
}

class Body {
  Avatar avatar;
  List<dynamic> jobs;
  String sId;
  String name;
  String email;
  String password;
  String createdAt;
  String updatedAt;
  int iV;

  Body(
      {this.avatar,
      this.jobs,
      this.sId,
      this.name,
      this.email,
      this.password,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Body.fromJson(Map<String, dynamic> json) {
    avatar =
        json['avatar'] != null ? new Avatar.fromJson(json['avatar']) : null;
    if (json['jobs'] != null) {
      jobs = new List<dynamic>();
      json['jobs'].forEach((v) {
        jobs.add(new Body.fromJson(v));
      });
    }
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.avatar != null) {
      data['avatar'] = this.avatar.toJson();
    }
    if (this.jobs != null) {
      data['jobs'] = this.jobs.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Avatar {
  bool exists;
  String value;

  Avatar({this.exists, this.value});

  Avatar.fromJson(Map<String, dynamic> json) {
    exists = json['exists'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exists'] = this.exists;
    data['value'] = this.value;
    return data;
  }
}