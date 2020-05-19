import 'package:e_learning_volkeno/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  
  final String uid;

  DatabaseService({
    this.uid
  });

  // connexion à la collection
  final CollectionReference collectionReference = Firestore.instance.collection('users');

  // insertion ou modification data user
  Future updateUserDataOrCreate(String fullname, String email) async {
    return await collectionReference.document(uid).setData({
      'prenom':fullname,
      'email':email      
    });
  }

  // select des infos users
  Stream<UserData> get userData{
    return collectionReference.document(uid).snapshots().map(_userdataFromSnapshot);
  }

  // userdata from snapshot
  UserData _userdataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      fullname: snapshot.data['prenom'],
      email: snapshot.data['email'],
    );
  }
}