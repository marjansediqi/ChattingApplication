import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
 final String? uid;
 DatabaseService({this.uid});

 final CollectionReference userCollection = FirebaseFirestore.instance.collection("users");
 final CollectionReference groupsCollection = FirebaseFirestore.instance.collection("groups");

 //saving data
 Future savingUserData(String fullName ,String email) async{
  return await userCollection.doc(uid).set({
   "fullName": fullName,
   "email": email,
   "groups": [],
   "profilePic" : "",
   "uid":uid,
  });

 }

 //getting user data
Future gettingUserData(String email) async{
  QuerySnapshot snapshot = await userCollection.where("email", isEqualTo: email).get();
  return snapshot;
}

//get user groups
getUserGroups() async{
  return userCollection.doc(uid).snapshots();
}

//creating a group
Future createGroup(String userName,String id,String groupName) async{
  DocumentReference documentReference = await groupsCollection.add({
   "groupName":groupName,
   "groupIcon":"",
  "admin":"${id}_$userName",
  "members":[],
  "groupId":"",
  "resentMassage": "",
   "recentMassageSender":"",
  });
}
}