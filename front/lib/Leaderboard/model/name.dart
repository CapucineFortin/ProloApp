enum Name {
  gryffindor,
  slytherin,
  hufflepuff,
  ravenclaw
}

extension NameExtension on Name {
  String stringify() {
    switch (this) {
      case Name.gryffindor:
        return "Gryffindor";
      case Name.slytherin:
        return "Slytherin";
      case Name.hufflepuff:
        return "Hufflepuff";
      case Name.ravenclaw:
        return "Ravenclaw";
      default:
        return "";
    }
  }
}