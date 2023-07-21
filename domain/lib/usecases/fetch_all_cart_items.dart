import 'package:domain/domain.dart';

class FetchAllCartItemsUseCase
    implements UseCase<NoParams, List<CartItemModel>> {
  final CartRepository cartRepository;

  FetchAllCartItemsUseCase({
    required this.cartRepository,
  });

  @override
  List<CartItemModel> execute(NoParams input) {
    return cartRepository.fetchAllCartItems();
  }
}
