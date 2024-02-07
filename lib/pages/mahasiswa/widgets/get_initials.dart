String getInitials(String name) {
  List<String> nameSplit = name.split(" ");
  String initials = "";
  int numWords = 2; // You can adjust this value to set the number of initials displayed

  for (int i = 0; i < nameSplit.length && i < numWords; i++) {
    if (nameSplit[i].isNotEmpty) {
      initials += nameSplit[i][0];
    }
  }
  
  return initials.toUpperCase();
}
