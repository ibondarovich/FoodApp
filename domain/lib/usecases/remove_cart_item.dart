import 'package:domain/domain.dart';

class RemoveCartItemUseCase extends UseCase<int, void>{
  final CartRepository _cartRepository;

  RemoveCartItemUseCase({
    required CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  @override
  void execute(int input) {
    return _cartRepository.removeCartItem(input);
  }
}