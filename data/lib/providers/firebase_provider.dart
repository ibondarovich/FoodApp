import 'package:core/core.dart';
import 'package:data/providers/provider.dart';
import 'package:data/entity/dish_entity.dart';

class FirebaseProvider implements Provider {
  final CollectionReference _dishes;
  FirebaseProvider({required dishes}) : _dishes = dishes;

  @override
  Future<List<DishEntity>> getAllDishes() async {
    final QuerySnapshot<Map<String, dynamic>> response = await _dishes
        .doc(StringConstants.firebaseDocumentName)
        .collection(StringConstants.firebaseCollectionName)
        .get();
    final List<DishEntity> result =
        response.docs.map((doc) => DishEntity.fromJson(doc.data())).toList();
    return result;
  }
}
