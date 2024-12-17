import 'package:flutter/material.dart';

void main() {
  runApp(Notes());
}

class Notes extends StatefulWidget {
  Notes({
    super.key,
  });

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  TextEditingController name_controller = TextEditingController();
  TextEditingController description_controller = TextEditingController();
  TextEditingController date_controller = TextEditingController();

  List<Map<String, dynamic>> notes = [
    {"name": "ahmad", "description": "teacher", "Time": "20/02/2000"},
    {"name": "zaki", "description": "teacher", "Time": "20/02/2001"}
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context) {
        return Scaffold(
            appBar: AppBar(
              title: Text('Notes'),
              centerTitle: true,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.yellow,
                      title: Text(
                        'keep notes',
                      ),
                      content: Container(
                        color: Colors.yellow,
                        height: 250,
                        width: 50,
                        child: Column(
                          children: [
                            Textfields(
                              Controller: name_controller,
                              hintText: "Enter name",
                            ),
                            Textfields(
                              Controller: description_controller,
                              hintText: "Enter description",
                            ),
                            Textfields(
                              Controller: date_controller,
                              hintText: 'Enter Time',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      setState(() {
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: Text("cancel")),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        // notes[]=_controller.text;
                                        notes.add({
                                          'name': name_controller.text,
                                          'description':
                                              description_controller.text,
                                          'Time': date_controller.text
                                        });
                                      });
                                    },
                                    icon: Icon(Icons.save))
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Icon(Icons.add),
            ),
            body: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        Container(
                          width: 200,
                          height: 300,
                          color: Colors.red,
                        );
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.blue,
                      ),
                      width: 70,
                      height: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(notes[index]['name']),
                          Text(notes[index]['description']),
                          Text(notes[index]['Time'])
                        ],
                      ),
                    ),
                  );
                }));
      }),
    );
  }
}

class Textfields extends StatelessWidget {
  String hintText;
  final Controller;
  Textfields({super.key, required this.Controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      controller: Controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}

// class Containers extends StatefulWidget {
   
    
//   Containers({super.key,
  
  
//   });

//   @override
//   State<Containers> createState() => _ContainersState();
// }

// class _ContainersState extends State<Containers> {
//   @override
//   Widget build(BuildContext context) {
//     return  
//   }
// }