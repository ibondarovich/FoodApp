import 'package:core/core.dart';
import 'package:data/entity/dish_entity/dish_entity.dart';
import 'package:data/providers/remote/remote_provider.dart';

class FirebaseProvider implements RemoteProvider {
  final FirebaseFirestore _firebaseInstance;
  FirebaseProvider({
    required firebaseInstance,
  }) : _firebaseInstance = firebaseInstance;

  @override
  Future<List<DishEntity>> getAllDishes() async {
    final dishesCollection = _firebaseInstance.collection(
      StringConstants.firebaseTableName,
    );

    final QuerySnapshot<Map<String, dynamic>> response = await dishesCollection
        .doc(StringConstants.firebaseDocumentName)
        .collection(StringConstants.firebaseCollectionName)
        .get();

    final List<DishEntity> result = response.docs
        .map(
          (doc) => DishEntity.fromJson(
            doc.data(),
          ),
        )
        .toList();

    return result;
  }
}