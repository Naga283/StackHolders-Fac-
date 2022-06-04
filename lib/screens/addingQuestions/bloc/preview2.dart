import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hackthon/screens/addingQuestions/bloc/bloc.dart';
import 'package:hackthon/Dashboard/dashboard.dart';
import 'package:hackthon/screens/subjectQues.dart';
class Preview2 extends StatefulWidget {
  const Preview2({ Key? key, required this.lead }) : super(key: key);

final String lead;

  @override
  State<Preview2> createState() => _Preview2State();
}
class _Preview2State extends State<Preview2> {
  var _site ;
  var val;
  bool vis = false;
  int d=0;
   QuestionsListBloc? movieListBloc;
 
  ScrollController controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieListBloc = QuestionsListBloc();
    movieListBloc?.fetchFirstList();
    controller.addListener(_scrollListener);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preview"),
      ),
      
     
      body: StreamBuilder<List<DocumentSnapshot>>(
          stream: movieListBloc?.questionStream,
        builder: (context, snapshot) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: ListView.builder(
                //itemCount: snapshot.hasData?snapshot.data?.docs.length:0,
                itemCount: 5,
                 itemBuilder: (BuildContext context, int index) { 
                  d = index;
                  return Container(
                    margin: EdgeInsets.only(top: 20,left: 10),
                    child: Column(children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text((index+1).toString()+") "+snapshot.data?[index]["Question"]+" ?",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                         width: MediaQuery.of(context).size.width,
                         margin: EdgeInsets.only(left:20,top: 10),
                        child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             snapshot.data?[index]["coreOptionVal"]=='1'? Text("a) "+snapshot.data?[index]["Option1"],style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.green),
                        ):Text("a) "+snapshot.data?[index]["Option1"],style: TextStyle(fontSize: 16),
                        ),
                             snapshot.data?[index]["coreOptionVal"]=='2'?  Text("b) "+snapshot.data?[index]["Option2"],style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.green),
                        ):Text("b) "+snapshot.data?[index]["Option2"],style: TextStyle(fontSize: 16,),
                        ),
                         snapshot.data?[index]["coreOptionVal"]=='3'? Text("c) "+snapshot.data?[index]["Option3"],style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.green),
                        ):Text("c) "+snapshot.data?[index]["Option3"],style: TextStyle(fontSize: 16),
                        ),
                             snapshot.data?[index]["coreOptionVal"]=='4'?  Container(
                            
                               child: Text("d) "+snapshot.data?[index]["Option4"],style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.green),
                        ),
                             ):Text("d) "+snapshot.data?[index]["Option4"],style: TextStyle(fontSize: 16),
                        ),
                          ],
                        ),
                      ),
                      
                     
                      ]),
                  );
                 },
              ),
            ),
            TextButton(onPressed: (){
             
            }, child: Text("Next"))
          ],
        );
        },
        
      )
    );
  }

 void _scrollListener() {
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      print("at the end of list");
      movieListBloc?.fetchNextMovies();
    }
  }
}