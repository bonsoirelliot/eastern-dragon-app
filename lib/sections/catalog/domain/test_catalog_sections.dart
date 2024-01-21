import 'package:eastern_dragon/sections/catalog/data/catalog_item_model.dart';
import 'package:eastern_dragon/sections/catalog/data/catalog_section_model.dart';

class TestCatalogSections {
  static final items = [
    CatalogItemModel(
      id: 1,
      name: 'Обед №5',
      compound: 'Рис, горячее, салат',
      weights: '200/300/200',
      price: 350,
      image: 'https://i.ibb.co/GC9sGPw/Rectangle-2.png',
    ),
    CatalogItemModel(
      id: 2,
      name: 'Не Обед №5',
      compound: 'Рис, горячее, салат',
      weights: '200/300/200',
      price: 350,
      image: 'https://i.ibb.co/GC9sGPw/Rectangle-2.png',
    ),
    CatalogItemModel(
      id: 3,
      name: 'Еда какая-то',
      compound: 'Рис, горячее, салат',
      weights: '200/300/200',
      price: 350,
      image: 'https://i.ibb.co/GC9sGPw/Rectangle-2.png',
    ),
    CatalogItemModel(
      id: 4,
      name: 'Обед',
      compound: 'Рис, горячее, салат',
      weights: '200/300/200',
      price: 350,
      image: 'https://i.ibb.co/GC9sGPw/Rectangle-2.png',
    ),
  ];

  static final sections = <CatalogSectionModel>[
    CatalogSectionModel(
      id: 0,
      name: 'Обеды',
      items: items,
    ),
    CatalogSectionModel(
      id: 1,
      name: 'Готовые блюда',
      items: items,
    ),
    CatalogSectionModel(
      id: 2,
      name: 'Напитки',
      items: items,
    ),
    CatalogSectionModel(
      id: 3,
      name: 'Магазин',
      items: items,
    ),
  ];
}
