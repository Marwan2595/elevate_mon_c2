import 'package:elevate_c2_mon/features/categories/data/models/category_model.dart';

abstract class DataSourceContract {
  Future<List<CategoryModel>> getCategories();
}
