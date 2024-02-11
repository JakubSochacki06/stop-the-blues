class Answer {
  final String text;
  final int value;
  bool isSelected;

  Answer({required this.text, required this.value, this.isSelected = false});

  void selectAnswer(){
    isSelected = !isSelected;
  }
}