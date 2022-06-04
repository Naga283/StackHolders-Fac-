import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:rxdart/rxdart.dart';

import 'FirebaseProvider.dart';

class QuestionsListBloc {
  FirebaseProvider firebaseProvider =FirebaseProvider();

  bool showIndicator = false;
  List<DocumentSnapshot> documentList=[];

  BehaviorSubject<List<DocumentSnapshot>> questionController = BehaviorSubject<List<DocumentSnapshot>>();

  BehaviorSubject<bool> showIndicatorController= BehaviorSubject<bool>();

  Stream get getShowIndicatorStream => showIndicatorController.stream;

  Stream<List<DocumentSnapshot>> get questionStream => questionController.stream;

/*This method will automatically fetch first 10 elements from the document list */
  Future fetchFirstList() async {
    try {
      documentList = await firebaseProvider.fetchFirstList();
      print(documentList);
      questionController.sink.add(documentList);
      try {
        if (documentList.length == 0) {
          questionController.sink.addError("No Data Available");
        }
      } catch (e) {}
    } on SocketException {
      questionController.sink.addError(SocketException("No Internet Connection"));
    } catch (e) {
      print(e.toString());
      questionController.sink.addError(e);
    }
  }

/*This will automatically fetch the next 10 elements from the list*/
  fetchNextMovies() async {
    try {
      updateIndicator(true);
      List<DocumentSnapshot> newDocumentList =
          await firebaseProvider.fetchNextList(documentList);
      documentList.addAll(newDocumentList);
      questionController.sink.add(documentList);
      try {
        if (documentList.length == 0) {
          questionController.sink.addError("No Data Available");
          updateIndicator(false);
        }
      } catch (e) {
        updateIndicator(false);
      }
    } on SocketException {
      questionController.sink.addError(SocketException("No Internet Connection"));
      updateIndicator(false);
    } catch (e) {
      updateIndicator(false);
      print(e.toString());
      questionController.sink.addError(e);
    }
  }

/*For updating the indicator below every list and paginate*/
  updateIndicator(bool value) async {
    showIndicator = value;
    showIndicatorController.sink.add(value);
  }

  void dispose() {
    questionController.close();
    showIndicatorController.close();
  }
}
