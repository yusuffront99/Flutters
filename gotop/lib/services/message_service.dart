import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gotop/models/product_model.dart';
import 'package:gotop/models/user_model.dart';

class MessageService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addMessage({
    UserModel? user,
    bool? isFromUser,
    String? message,
    ProductModel? product,
  }) async {
    try {
      firestore.collection('message').add({
        'userId': user?.id,
        'userName': user?.name,
        'userImage': user?.profilePhotoUrl,
        'isFromUser': true,
        'message': message,
        'product':
            product is UninitializedProductModel ? {} : product!.toJson(),
        'createdAt': DateTime.now().toString(),
        'updatedAt': DateTime.now().toString(),
      }).then(
        (value) => print('successfully sent!'),
      );
    } catch (e) {
      throw Exception('Failed to send');
    }
  }
}
