import 'package:core/core.dart';
import 'package:data/entity/dish_entity/dish_entity.dart';
import 'package:data/mappers/dish_mapper.dart';
import 'package:data/providers/local/local_provider.dart';
import 'package:data/providers/remote/remote_provider.dart';
import 'package:domain/domain.dart';

class DishRepositoryImpl implements DishRepository{
  final RemoteProvider _remoteProvider;
  final LocalProvider _localProvider;
  final NetworkInfo _networkInfo;

  DishRepositoryImpl({
    required remoteProvider,
    required localProvier,
    required networkInfo,
  })  : _remoteProvider = remoteProvider,
        _localProvider = localProvier,
        _networkInfo = networkInfo;

  @override
  Future<List<DishModel>> fetchAllDishes() async{
    if(await _networkInfo.isConnected){
      final List<DishEntity> result = await _remoteProvider.getAllDishes();
      await _localProvider.saveAllDishes(result);   
      return result.map((item) => DishMapper.toModel(item)).toList();
    } else {
      final List<DishEntity> result = _localProvider.getAllDishes();
      return result.map((item) => DishMapper.toModel(item)).toList();
    } 
  }
}