class Student {
  int id;
  String firstName;
  String lastName;
  int grade;
  String _status;
  String _imageURL;

  Student.withId(int id, String firstName, String lastName, int grade) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  Student(String firstName, String lastName, int grade) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  Student.withoutInfo() {}

  void setImageURL(String url) {
    this._imageURL = url;
  }

  void set setGrade(int grade) {
    this.grade = grade;
  }

  String get getImageURL {
    return this._imageURL;
  }

  String get getStatus {
    String message = "";
    if (this.grade >= 50) {
      message = "Geçti";
    } else if (this.grade >= 40) {
      message = "Bütünlemeye kaldı";
    } else {
      message = "Kaldı";
    }
    return message;
  }
}
