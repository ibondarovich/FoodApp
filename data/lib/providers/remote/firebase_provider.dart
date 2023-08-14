import 'package:core/core.dart';
import 'package:data/entity/category_entity/category_entity.dart';
import 'package:data/entity/dish_entity/dish_entity.dart';
import 'package:data/entity/order_entity/order_entity.dart';
import 'package:data/entity/user_entity/user_entity.dart';
import 'package:data/providers/remote/remote_provider.dart';

class FirebaseProvider implements RemoteProvider {
  final FirebaseFirestore _firebaseInstance;
  final FirebaseAuth _firebaseAuthInstance;
  final GoogleSignIn _googleSignIn;

  FirebaseProvider({
    required FirebaseFirestore firebaseInstance,
    required FirebaseAuth firebaseAuthInstance,
    required GoogleSignIn googleSignIn,
  })  : _firebaseInstance = firebaseInstance,
        _firebaseAuthInstance = firebaseAuthInstance,
        _googleSignIn = googleSignIn;

  @override
  Future<List<DishEntity>> fetchAllDishes() async {
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

  @override
  Future<String> createUserWithEmailAndPassword(UserEntity userEntity) async {
    final UserCredential result =
        await _firebaseAuthInstance.createUserWithEmailAndPassword(
      email: userEntity.email,
      password: userEntity.password,
    );
    final String uid = result.user?.uid ?? '';
    return uid;
  }

  @override
  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount?.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication?.accessToken,
      idToken: googleSignInAuthentication?.idToken,
    );
    final UserCredential userCredential =
        await _firebaseAuthInstance.signInWithCredential(credential);
    final String uid = userCredential.user?.uid ?? '';
    return uid;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuthInstance.signOut();
    await _googleSignIn.signOut();
  }

  @override
  Future<String> signIn(UserEntity userEntity) async {
    final UserCredential userCredential =
        await _firebaseAuthInstance.signInWithEmailAndPassword(
      email: userEntity.email,
      password: userEntity.password,
    );
    final String uid = userCredential.user?.uid ?? '';
    return uid;
  }

  @override
  Future<void> addOrder(OrderEntity orderEntity, String uid) async {
    final CollectionReference<Map<String, dynamic>> response = _firebaseInstance
        .collection(StringConstants.firebaseUser)
        .doc(uid)
        .collection(StringConstants.firebaseOrder);
    final Map<String, dynamic> json = orderEntity.toJson();
    response.doc(orderEntity.id.toString()).set(json);
  }

  @override
  Future<List<OrderEntity>> fetchOrders(String uid) async {
    final QuerySnapshot<Map<String, dynamic>> response = await _firebaseInstance
        .collection(StringConstants.firebaseUser)
        .doc(uid)
        .collection(StringConstants.firebaseOrder)
        .get();

    final List<OrderEntity> result = response.docs
        .map(
          (QueryDocumentSnapshot<Map<String, dynamic>> doc) =>
              OrderEntity.fromJson(
            doc.data(),
          ),
        )
        .toList();

    return result;
  }

  @override
  Future<List<CategoryEntity>> fetchCategories() async {
    final CollectionReference<Map<String, dynamic>> dishesCollection =
        _firebaseInstance.collection(
      StringConstants.firebaseCategory,
    );

    final QuerySnapshot<Map<String, dynamic>> response =
        await dishesCollection.get();

    final List<CategoryEntity> result = response.docs
        .map(
          (doc) => CategoryEntity.fromJson(
            doc.data(),
          ),
        )
        .toList();

    return result;
  }
}
