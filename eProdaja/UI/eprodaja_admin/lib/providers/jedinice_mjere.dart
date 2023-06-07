import 'dart:convert';

import 'package:eprodaja_admin/models/product.dart';
import 'package:eprodaja_admin/models/search_result.dart';
import 'package:eprodaja_admin/providers/base_provider.dart';
import 'package:eprodaja_admin/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../models/jedinice_mjere.dart';

class JediniceMjereProvider extends BaseProvider<JediniceMjere> {
  JediniceMjereProvider(): super("JediniceMjere");

  @override
  JediniceMjere fromJson(data) {
    // TODO: implement fromJson
    return JediniceMjere.fromJson(data);
  }


}