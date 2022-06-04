import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hackthon/Dashboard/dashboard.dart';
import 'package:hackthon/screens/printPage.dart';
import 'package:hackthon/screens/subjectQues.dart';
class OverAllPreview extends StatefulWidget {
  const OverAllPreview({ Key? key, required this.lead }) : super(key: key);

final String lead;

  @override
  State<OverAllPreview> createState() => _OverAllPreviewState();
}
class _OverAllPreviewState extends State<OverAllPreview> {
  var _site ;
  var val;
  bool vis = false;
  int d=0;
  var dataa;
  var controller = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    controller.addListener(_scrollListener);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // toolbarHeight: 100,
  //       shape: RoundedRectangleBorder(
  // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
  // ),
        title: Text("Preview"),
      ),
      
     
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection(widget.lead).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          dataa = snapshot.data?.docs;
          print(dataa);
          if (snapshot.data != null) {
            
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [

            Flexible(
              child: ListView.builder(
                controller: controller,
                itemCount: snapshot.hasData?snapshot.data!.docs.length:0,
        
                 itemBuilder: (BuildContext context, int index) { 
                  d = index;
                  return Card(
                    margin: EdgeInsets.only(left: 15,right: 15,bottom: 15,top: 10),
                    elevation: 6,
                   shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(20),
  ),
                    
                    child: Container(
                      margin: EdgeInsets.only(top: 20,left: 10,bottom: 10),
                      child: Column(children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text((index+1).toString()+") "+snapshot.data!.docs[index]["Question"]+" ?",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                          ),
                          
                        ),
                        SizedBox(height: 10,),
                        Divider(
                          thickness: 2,
                        ),
                        Container(
                           width: MediaQuery.of(context).size.width,
                           margin: EdgeInsets.only(left:20,top: 10),
                          child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               snapshot.data!.docs[index]["coreOptionVal"]=='1'? Text("a) "+snapshot.data!.docs[index]["Option1"],style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.green),
                          ):Text("a) "+snapshot.data!.docs[index]["Option1"],style: TextStyle(fontSize: 16),
                          ),
                               snapshot.data!.docs[index]["coreOptionVal"]=='2'?  Text("b) "+snapshot.data!.docs[index]["Option2"],style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.green),
                          ):Text("b) "+snapshot.data!.docs[index]["Option2"],style: TextStyle(fontSize: 16,),
                          ),
                           snapshot.data!.docs[index]["coreOptionVal"]=='3'? Text("c) "+snapshot.data!.docs[index]["Option3"],style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.green),
                          ):Text("c) "+snapshot.data!.docs[index]["Option3"],style: TextStyle(fontSize: 16),
                          ),
                               snapshot.data!.docs[index]["coreOptionVal"]=='4'?  Container(
                              
                                 child: Text("d) "+snapshot.data!.docs[index]["Option4"],style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.green),
                          ),
                               ):Text("d) "+snapshot.data!.docs[index]["Option4"],style: TextStyle(fontSize: 16),
                          ),
                            ],
                          ),
                        ),
                        
                       
                        ]),
                    ),
                  );
                 },
              ),
            ),
            TextButton(onPressed: (){
              print(snapshot.data!.docs[0]["Question"]);
             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PrintVal("Print", data: dataa,)));
            }, child: Text("Print"))
          ],
        );
         } 
         else {
            return Center(child: CircularProgressIndicator());
          }
        
         } )
    );
  }

 void _scrollListener() {
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      print("at the end of list");
      
      Future<List<DocumentSnapshot>> fetchNextList(
      List<DocumentSnapshot> documentList) async {
    return (await FirebaseFirestore.instance
            .collection(widget.lead)
            .startAfterDocument(documentList[documentList.length - 1])
            .limit(5)
            .get())
        .docs;
  }
    //  movieListBloc!.fetchNextMovies();
    }
  }
}