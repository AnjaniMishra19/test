class User {
  String firstName;
  String lastName;
  String age;

  User({
    this.firstName,
    this.lastName,
    this.age,
  });

  static List<User> getUsers() {
    return <User>[
      User(firstName: 'Ak', lastName: 'sss', age: '22'),
      User(firstName: 'Sk', lastName: 'mmm', age: '23'),
      User(firstName: 'pk', lastName: 'nnn', age: '24'),
      User(firstName: 'Lk', lastName: 'lll', age: '25'),
      User(firstName: 'Uk', lastName: 'kkk', age: '26'),
      User(firstName: 'zk', lastName: 'ppp', age: '27'),
    ];
  }
}
