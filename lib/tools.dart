extension ListExtension<Widget> on List<Widget> {
  List<Widget> reverse(bool condition) {
    return condition ? reversed.toList() : this;
  }
}
