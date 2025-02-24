import 'package:elevate_c2_mon/config/constants.dart';
import 'package:elevate_c2_mon/core/api_manager/api_manager.dart';
import 'package:elevate_c2_mon/core/api_manager/api_result.dart';
import 'package:elevate_c2_mon/features/categories/data/models/category_model.dart';
import 'package:elevate_c2_mon/features/categories/domain/entities/category_entity.dart';
import 'package:injectable/injectable.dart';

import '../contract/datasource_contract.dart';

@Singleton(as: DataSourceContract)
class RemoteDataSourceImpl implements DataSourceContract {
  ApiManager apiManager;
  RemoteDataSourceImpl(this.apiManager);
  @override
  Future<List<CategoryModel>> getCategories() async {
    final res =
        await apiManager.getData(endpoint: AppConstants.getCategoriesEndpoint);
         // Response<dynamic>, exp
    final resBody = res.data;
    CategoryResponse categoryResponse =
        CategoryResponse.fromJson(resBody ?? {});
    return categoryResponse.data;
  }
}
