import 'package:elevate_c2_mon/core/api_manager/api_result.dart';
import 'package:elevate_c2_mon/features/categories/domain/entities/category_entity.dart';
import 'package:elevate_c2_mon/features/categories/domain/repo/category_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesUseCase {
  CategoryRepoContract categoryRepo;
  GetCategoriesUseCase({required this.categoryRepo});
  Future<ApiResult<List<CategoryEntity>>> call() => categoryRepo.getCategories();
}
