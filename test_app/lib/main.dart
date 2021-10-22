import 'package:flutter/material.dart';
import 'package:test_app/models/student.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  String mesaj = "Student Tracking System";
  List<Student> students = [
    Student("Ahmet", "Demir", 85),
    Student("Mehmet", "Yazıcı", 45),
    Student("Alihan", "Ataş", 20),
  ];
//.setImageURL("https://picsum.photos/id/237/200/300")
  Student s = new Student("Berke", "Yavaş", 78);
  s.setImageURL("https://picsum.photos/id/237/200/300");
  var ogrenciler = ["Ahmet", "Hüzeyfe", "Demir"];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: buildBody(context),
    );
  }

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("Sınav sonucu"),
      content: Text(mesaj),
    );

    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    students[index].firstName + " " + students[index].lastName,
                  ),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Sınavdan aldığı not: " +
                            students[index].grade.toString(),
                      ),
                      Text(
                        "[" + students[index].getStatus + "]",
                      ),
                    ],
                  ),
                  trailing: buildStatusIcon(
                    students[index].getStatus,
                  ),
                  leading: students[index].getImageURL != null
                      ? CircleAvatar(
                          backgroundImage:
                              NetworkImage(students[index].getImageURL),
                        )
                      : CircleAvatar(
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          backgroundColor: Color(0xFF47b881),
                        )
                  /*CircleAvatar(
                    backgroundImage:
                        NetworkImage("https://picsum.photos/id/237/200/300"),
                  )*/
                  ,
                  onTap: () {
                    print(students[index].firstName +
                        " " +
                        students[index].lastName);
                  },
                );
              }),
        ),
        Center(
          child: ElevatedButton(
            child: Text("Sonucu gör"),
            onPressed: () {
              var mesaj = "waiting";
              mesajGoster(context, mesaj);
            },
          ),
        ),
      ],
    );
  }

  Widget buildStatusIcon(String status) {
    if (status == "Geçti") {
      return Icon(Icons.done);
    } else if (status == "Bütünlemeye kaldı") {
      return Icon(Icons.warning);
    } else {
      return Icon(Icons.clear);
    }
  }
}
