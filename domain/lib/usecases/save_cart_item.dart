import 'package:domain/domain.dart';

class SaveCartItemUseCase implements FutureUseCase<CartItemModel, void>{
  final CartRepository cartRepository;

  SaveCartItemUseCase({
    required this.cartRepository,
  });

  @override
  Future<void> execute(CartItemModel input) {
    return cartRepository.saveCartItem(input);
  }
}