import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app_using_firebase/util/get_user_details.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final user = FirebaseAuth.instance.currentUser!;

  List<String> docIDs  = [];
  int cpt = 0;

  Future getDocid() async {
    docIDs.clear();
    await FirebaseFirestore.instance.collection('users').get().then((snapshot) {
      snapshot.docs.forEach((doc) {
        //print( cpt + doc.reference);
        print('$cpt: ${doc.reference.id}');
        docIDs.add(doc.reference.id);
        cpt++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(user.email!, style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: Colors.deepPurple[300],
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Data of users collection',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
            ),

            Expanded(child: FutureBuilder(
              future: getDocid(),
              builder: (context, snapshot) {
              return ListView.builder(
                itemCount: docIDs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: ListTile(
                      title: GetUserDetails(documentId: docIDs[index]),

                      tileColor: Colors.yellow[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),

                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          FirebaseFirestore.instance.collection('users').doc(docIDs[index]).delete();
                          setState(() {
                            docIDs.removeAt(index);
                          });
                        },
                      ),
                      leading: Icon(Icons.person, size: 40,),
                      subtitle: Text('Document ID: ${docIDs[index]}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),),
                    ),
                  );
                },
              );
            },) )

          ],
        ),
      ),
    );
  }
}
