import 'package:elevate_c2_mon/core/api_manager/api_result.dart';
import 'package:elevate_c2_mon/features/categories/domain/entities/category_entity.dart';
import 'package:elevate_c2_mon/features/categories/domain/repo/category_repo_contract.dart';
import 'package:elevate_c2_mon/features/categories/domain/usecase/get_category_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'get_category_usecase_test.mocks.dart';

@GenerateMocks([CategoryRepoContract])
void main() {
  late GetCategoriesUseCase getCategoriesUseCase;
  late MockCategoryRepoContract mockCategoryRepo;
  setUpAll(() {
    mockCategoryRepo = MockCategoryRepoContract();
    getCategoriesUseCase = GetCategoriesUseCase(categoryRepo: mockCategoryRepo);
  });

  test("Test get categories success case", () async {
    //Arrange
    //1- define -> ApiResult<List<CategoryEntity>>
    //2- define what happens when a function inside the mock is called
    //1
    provideDummy<ApiResult<List<CategoryEntity>>>(
      ApiSuccessResult(<CategoryEntity>[]),
    );
    //2
    when(mockCategoryRepo.getCategories())
        .thenAnswer((_) async => ApiSuccessResult<List<CategoryEntity>>([]));
    //Act
    final result = await getCategoriesUseCase.call();
    //Assert
    expect(result, isA<ApiSuccessResult<List<CategoryEntity>>>());
    verify(mockCategoryRepo.getCategories()).called(1);
  });

  test("Test get categories error case", () async {
    //Arrange
    //1- define -> ApiResult<List<CategoryEntity>>
    //2- define what happens when a function inside the mock is called
    //1
    provideDummy<ApiResult<List<CategoryEntity>>>(
      ApiErrorResult("error"),
    );
    //2
    when(mockCategoryRepo.getCategories())
        .thenAnswer((_) async => ApiErrorResult<List<CategoryEntity>>("error"));
    //Act
    final result = await getCategoriesUseCase.call();
    //Assert
    expect(result, isA<ApiErrorResult<List<CategoryEntity>>>());
    verify(mockCategoryRepo.getCategories()).called(1);
  });
}
