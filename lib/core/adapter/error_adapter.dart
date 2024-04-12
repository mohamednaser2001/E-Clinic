

class ErrorAdapter {
  Map<String, dynamic> errors;

  ErrorAdapter({required this.errors});

  // get errors in map and convert it to one string to display it to users.
  String adaptErrors(){
    String e='';
    errors.forEach((key, value) {
      e+= '${value[0]}\n';
    });

    return e.trim();
  }
}