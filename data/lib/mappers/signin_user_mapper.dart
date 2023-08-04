import 'package:data/entity/user_entity/user_entity.dart';
import 'package:domain/domain.dart';

abstract class UserMapper {
  static UserModel toModel(UserEntity entity) {
    return UserModel(
      email: entity.email,
      password: entity.password,
    );
  }

  static UserEntity toEntity(UserModel model) {
    return UserEntity(
      email: model.email,
      password: model.password,
    );
  }
}
