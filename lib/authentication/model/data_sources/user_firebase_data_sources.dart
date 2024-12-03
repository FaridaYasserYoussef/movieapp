import 'package:movieapp/authentication/model/data_models/user_model.dart';
import 'package:movieapp/authentication/model/data_sources/user_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class UserFirebaseDataSource extends UserDataSource{

  static CollectionReference<UserModel> getUserCollection(){
    return FirebaseFirestore.instance.collection("users").
    withConverter(fromFirestore: (snapshot, _)=>UserModel.fromJson(snapshot.data() ??{}), toFirestore: (value, _)=> value.toJson());

  }
  @override
 Future<UserModel?> login(String email, String password) async{
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    UserModel? user = await getUser(userCredential.user!.uid);
    return user;
  }

  @override
  Future<UserModel> signup(UserModel user, String password) async{
   UserCredential userCredential =  await FirebaseAuth.instance.createUserWithEmailAndPassword(email: user.email!, password: password);
   user.uId  = userCredential.user!.uid;
   await createUser(user);
   return user;
  }

  createUser(UserModel user) async{
    await getUserCollection().doc(user.uId).set(user);

  }

 Future<UserModel?> getUser(String uid) async{
   DocumentSnapshot<UserModel> userModelSnapshot =   await getUserCollection().doc(uid).get();
   UserModel? user = userModelSnapshot.data();
  return user;
  }

  @override
  Future<void> logout() async{
    FirebaseAuth.instance.signOut();
  }

}