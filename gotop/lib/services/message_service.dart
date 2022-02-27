import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gotop/models/message_model.dart';
import 'package:gotop/models/product_model.dart';
import 'package:gotop/models/user_model.dart';

class MessageService {
  //=== message saved to firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  //== message showing on live chat
  Stream<List<MessageModel>>? getMessageByUserId({int? userId}) {
    try {
      return firestore
          .collection('message')
          .where('userId', isEqualTo: userId)
          .snapshots()
          .map((QuerySnapshot list) {
        var result = list.docs.map<MessageModel>((DocumentSnapshot message) {
          print(message.data());
          return MessageModel.fromJson(message.data() as Map<String, dynamic>);
        }).toList();

        //=== SORTING MESSAGE OLD TOP TO NEW BOTTOM
        result.sort(
          (MessageModel a, MessageModel b) =>
              a.createdAt!.compareTo(b.createdAt!),
        );
        return result;
      });
    } catch (e) {
      throw Exception(e);
    }
  }

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
        'isFromUser': isFromUser,
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
