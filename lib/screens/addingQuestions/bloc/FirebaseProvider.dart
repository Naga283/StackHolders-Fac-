import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseProvider {
  Future<List<DocumentSnapshot>> fetchFirstList() async {
    return (await FirebaseFirestore.instance
            .collection("AI")
            .orderBy("Question")
            .limit(5).get()
            ).docs
        ;
  }
  Future<List<DocumentSnapshot>> fetchNextList(
      List<DocumentSnapshot> documentList) async {
    return (await FirebaseFirestore.instance
            .collection("AI")
            .orderBy("Question")
            .startAfterDocument(documentList[documentList.length - 1])
            .limit(5)
            .get())
        .docs;
  }
}
