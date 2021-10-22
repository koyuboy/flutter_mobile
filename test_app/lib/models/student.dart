class Student {
  String firstName;
  String lastName;
  int grade;
  String _status;
  String _imageURL;

  Student(String firstName, String lastName, int grade) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    this._imageURL = "https://picsum.photos/id/237/200/300";
  }

  void set setImageURL(String url) {
    this._imageURL = url;
  }

  String get getImageURL{
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
