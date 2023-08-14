import 'package:data/entity/category_entity/category_entity.dart';
import 'package:data/mappers/category_mapper.dart';
import 'package:data/providers/remote/remote_provider.dart';
import 'package:domain/models/category_model.dart';
import 'package:domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final RemoteProvider _remoteProvider;

  CategoryRepositoryImpl({
    required RemoteProvider remoteProvider,
  }) : _remoteProvider = remoteProvider;

  @override
  Future<List<CategoryModel>> fetchCategories() async {
    final List<CategoryEntity> response =
        await _remoteProvider.fetchCategories();
    return response
        .map((CategoryEntity entity) => CategoryMapper.toModel(entity))
        .toList();
  }
}
