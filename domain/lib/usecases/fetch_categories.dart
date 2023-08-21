import 'package:domain/domain.dart';

class FetchCategoriesUseCase
    extends FutureUseCase<NoParams, List<CategoryModel>> {
  final CategoryRepository _categoryRepository;

  FetchCategoriesUseCase({
    required CategoryRepository categoryRepository,
  }) : _categoryRepository = categoryRepository;

  @override
  Future<List<CategoryModel>> execute(NoParams input) async {
    return await _categoryRepository.fetchCategories();
  }
}
