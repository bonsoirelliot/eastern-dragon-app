import 'package:eastern_dragon/sections/catalog/data/catalog_section_model.dart';
import 'package:flutter/material.dart';

class CatalogSectionWithKeyModel {
  final CatalogSectionModel model;

  final GlobalKey key;

  CatalogSectionWithKeyModel({
    required this.model,
    required this.key,
  });
}
