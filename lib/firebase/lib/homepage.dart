import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


import '../../screens/addingQuestions/bloc/bloc.dart';

class FireHome extends StatefulWidget {
  @override
  _FireHomeState createState() => _FireHomeState();
}

class _FireHomeState extends State<FireHome> {
   QuestionsListBloc? movieListBloc;
 
  ScrollController controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieListBloc = QuestionsListBloc();
    movieListBloc!.fetchFirstList();
    controller.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Firebase firestore pagination"),),
      body: StreamBuilder<List<DocumentSnapshot>>(
        stream: movieListBloc!.questionStream,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              shrinkWrap: true,
              controller: controller,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                          child: Text(snapshot.data![index]["Question"].toString())),
                      title: Text(snapshot.data![index]["Question"]),
                    ),
                  ),
                );
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  void _scrollListener() {
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      print("at the end of list");
      movieListBloc!.fetchNextMovies();
    }
  }
}
