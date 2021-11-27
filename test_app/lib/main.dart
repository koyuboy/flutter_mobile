import 'package:flutter/material.dart';
import 'package:test_app/models/student.dart';
import 'package:test_app/screens/student_add.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mesaj = "Student Tracking System";

  Student selectedStudent = Student.withId(0, "", "", 0);

  List<Student> students = [
    Student.withId(1, "Ahmet Hüzeyfe", "Demir", 85),
    Student.withId(2, "Mehmet", "Yazıcı", 45),
    Student.withId(3, "Alihan", "Ataş", 20),
  ];

  Student berke = Student.withId(4, "Berke", "Yavaş", 78);

  var ogrenciler = ["Ahmet", "Hüzeyfe", "Demir"];

  @override
  Widget build(BuildContext context) {
    if (!students.contains(berke)) {
      students.add(berke);
      berke.setImageURL("https://picsum.photos/id/237/200/300");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: buildBody(context),
    );
  }

  void mesajGoster(BuildContext context, String title, String mesaj) {
    var alert = AlertDialog(
      title: Text(title),
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
                    setState(() {
                      selectedStudent = students[index];
                    });
                  },
                );
              }),
        ),
        selectedStudent.firstName == "" && selectedStudent.firstName == ""
            ? SizedBox.shrink()
            : Text("Seçili öğrenci : " +
                selectedStudent.firstName +
                " " +
                selectedStudent.lastName),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 3,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreen,
                ),
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        "Yeni Öğrenci",
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StudentAdd(students)));

                  /*
                  var mesaj = "Yeni öğrenci " + selectedStudent.firstName + " " + selectedStudent.lastName +  " eklendi!";
                  mesajGoster(context, "İşlem Tamamlandı", mesaj);
                  */
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 3,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.amberAccent,
                ),
                child: Row(
                  children: [
                    Icon(Icons.update),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        "Güncelle",
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    
                  });
                  var mesaj = "Öğrenci " +
                      selectedStudent.firstName +
                      " " +
                      selectedStudent.lastName +
                      " güncellendi!";
                  mesajGoster(context, "İşlem Tamamlandı", mesaj);
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent,
                ),
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text("Sil"),
                    ),
                  ],
                ),
                onPressed: () {
                  var deletedStudent = selectedStudent.firstName +
                      " " +
                      selectedStudent.lastName;
                  setState(() {
                    students.remove(selectedStudent);
                    selectedStudent = emptySelectedStudent();
                  });
                  var mesaj = "Öğrenci " + deletedStudent + " silindi!";
                  mesajGoster(context, "İşlem Tamamlandı", mesaj);
                },
              ),
            ),
          ],
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

  Student emptySelectedStudent() {
    return Student.withId(0, "", "", 0);
  }
}
