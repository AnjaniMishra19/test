class DropdownList {
  final String name;

  DropdownList(this.name);

  static List<DropdownList> dropdownlist() {
    return <DropdownList>[
      DropdownList("English"),
      DropdownList("Hindi"),
      DropdownList("Maths")
    ];
  }
}
