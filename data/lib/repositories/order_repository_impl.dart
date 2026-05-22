import 'package:data/entity/order_entity/order_entity.dart';
import 'package:data/mappers/order_mapper.dart';
import 'package:data/providers/local/user_data_provider.dart';
import 'package:data/providers/remote/remote_provider.dart';
import 'package:domain/domain.dart';
import 'package:domain/models/order_model.dart';

class OrderRepositoryImpl extends OrderRepository {
  final RemoteProvider _remoteProvider;
  final UserDataProvider _userDataProvider;

  OrderRepositoryImpl({
    required RemoteProvider remoteProvider,
    required UserDataProvider userDataProvider,
  })  : _remoteProvider = remoteProvider,
        _userDataProvider = userDataProvider;

  @override
  Future<List<OrderModel>> fetchOrders(String input) async {
    final List<OrderEntity> response = await _remoteProvider.fetchOrders(input);
    return response
        .map((OrderEntity entity) => OrderMapper.toModel(entity))
        .toList();
  }

  @override
  Future<void> saveOrder(OrderModel input) async {
    final String uid = _userDataProvider.fetchUserId();
    final OrderEntity model = OrderMapper.toEntity(input);
    await _remoteProvider.addOrder(model, uid);
  }
}
