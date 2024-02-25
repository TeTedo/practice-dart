# [니꼴라스 dart 기본강의](https://nomadcoders.co/dart-for-beginners/lobby)

# 기본

```dart
void main() {
  String name = "hihi";
  name = "11";

  var name2 = "tetedo";
  name2 = "hihi";

  final name3 = 'cant modified';
  final name4 = 'const2';

  const name5 = 'const';

  dynamic name6 = 'dynamic name';
  name6 = 2;
  name6 = false;

  late final String lateName;
  // do something, go to api;
  lateName = 'lateName';

  String? nullSafety = 'hi';
  nullSafety = null;

  if (nullSafety is String) {
    nullSafety.toLowerCase();
  }

  nullSafety?.toLowerCase();
}

```

# 자료형

```dart
void main() {
  String name = 'nico';
  bool alive = true;
  int age = 12;
  double money = 69.99;

  num x = 12;
  x = 1.23;
}
```

## List

```dart
void main() {
  var giveMeFive = true;

  var numbers = [
    1,
    2,
    3,
    4,
    if (giveMeFive) 5,
  ];
  numbers.add(44);

  List<int> numbers2 = [
    1,
    2,
    3,
    4,
  ];
  numbers2.add(55);

  print(numbers);
  print(numbers2);
}
```

## String Interpolation

```dart
void main() {
  var name = 'nico';
  var age = 10;
  var greeting = 'Hello everyone, my name is $name and I\'m ${age + 2}';

  print(greeting);
}
```

## collection for

```dart
void main() {
  var oldFreinds = ['nico', 'lynn'];
  var newFriends = [
    'lewis',
    'ralph',
    'darren',
    for (var friend in oldFreinds) "new $friend",
  ];

  print(newFriends);
}
```

## Map

```dart
void main() {
  var player = {
    'name': 'nico',
    'xp': 10.99,
    'superpower': false,
  };

  Map<int, bool> trueFalse = {
    1: true,
    2: false,
    3: true,
  };

  Map<List<int>, bool> exapmels = {
    [1, 2, 3, 5]: true,
  };
}

```

## Set

```dart
void main() {
  Set<int> numbers = {1, 2, 3, 4};
  numbers.add(1);

  print(numbers);
}
```

# Function

## 정의

```dart
void sayHello(String name) {
  print('hello $name nice to meet you');
}

String sayHello2(String name) => 'hello $name nice to meet you';

num plus(num a, num b) => a + b;

void main() {
  sayHello('tetedo');

  print(sayHello2('tetedo'));
}
```

## named parameters

```dart
String sayHello({
  String name = 'tetedo',
  int age = 5,
  String country = '',
}) {
  return "Hello $name, you are $age, and you come from $country";
}

String sayHello2({
  String? name,
  required int age,
  String country = '',
}) {
  return "Hello $name, you are $age, and you come from $country";
}

void main() {
  sayHello(
    age: 20,
    country: 'korea',
    name: 'tetedo',
  );

  sayHello();

  print(sayHello2(age: 22));
}
```

## Optional parameters

```dart
String sayHello(String name, int age, [String? country = 'korea']) =>
    'Hello $name, you are $age years old from $country';

void main() {
  var result = sayHello('tetedo', 12);

  print(result);
}
```

## qq operator

```dart
String capitalizeName(String? name) => name?.toUpperCase() ?? 'anon';

void main() {
  capitalizeName('tetedo');
  capitalizeName(null);

  String? name;
  name ??= 'tetedo'; // name이 null이라면 tetedo 할당

  print(name);
}
```

## Typedef

```dart
typedef ListOfInts = List<int>;

ListOfInts reverseListOfNumbers(ListOfInts list) {
  var reversed = list.reversed;
  return reversed.toList();
}

typedef UserInfo = Map<String, String>;
String sayHi(UserInfo userInfo) {
  return 'Hi ${userInfo['name']}';
}

void main() {
  var result = reverseListOfNumbers([1, 2, 3]);
  print(result);

  var result2 = sayHi({"name": "this is name"});
  print(result2);
}
```

# Class

## 사용법

```dart
class Player {
  late final String name;
  late int xp;

  Player(String name, int xp) {
    this.name = name;
    this.xp = xp;
  }

  void sayHello() {
    print('Hi My name is $name'); // this는 쓰지 않는게 권장
    print('Hi My name is ${this.name}');
  }
}

class Player2 {
  final String name;
  int xp;

  Player2(this.name, this.xp);

  void sayHello() {
    print('Hi My name is $name'); // this는 쓰지 않는게 권장
    print('Hi My name is ${this.name}');
  }
}

void main() {
  var player = Player("tetedo", 1500);
  print(player.name);

  player.sayHello();

  var player2 = Player2("ohoh", 3000);
  player2.sayHello();
}
```

## named constructor parameters

```dart
class Player {
  late final String name;
  late int xp;
  String team;
  int age;

  Player({
    required this.name,
    required this.xp,
    required this.team,
    required this.age,
  });

  void sayHello() {
    print('Hi My name is $name');
  }
}

void main() {
  var player = Player(
    name: "tetedo",
    xp: 1500,
    team: "red",
    age: 20,
  );
  print(player.name);

  player.sayHello();

  var player2 = Player(
    name: "ohoh",
    age: 3000,
    team: "blue",
    xp: 30,
  );
  player2.sayHello();
}

```

## named constructor

```dart
class Player {
  late final String name;
  late int xp, age;
  String team;

  Player({
    required this.name,
    required this.xp,
    required this.team,
    required this.age,
  });

  Player.createBluePlayer({
    required String name,
    required int age,
  })  : this.age = age,
        this.name = name,
        this.team = 'blue',
        this.xp = 0;

  Player.createRedPlayer(String name, int age)
      : this.age = age,
        this.name = name,
        this.team = 'red',
        this.xp = 0;

  void sayHello() {
    print('Hi My name is $name');
  }
}

void main() {
  var player = Player.createBluePlayer(
    name: "tetedo",
    age: 20,
  );
  print(player.name);

  player.sayHello();

  var player2 = Player.createRedPlayer("ohoh", 20);
  player2.sayHello();
}
```

# Example

```dart
class Player {
  late final String name;
  late int xp;
  String team;

  Player.fromJson(Map<String, dynamic> playerJson)
      : name = playerJson['name'],
        xp = playerJson['xp'],
        team = playerJson['team'];

  void sayHello() {
    print('Hi My name is $name');
  }
}

void main() {
  var apiData = [
    {
      "name": "tetedo",
      "team": "blue",
      "xp": 0,
    },
    {
      "name": "violet",
      "team": "red",
      "xp": 0,
    },
    {
      "name": "zozo",
      "team": "blue",
      "xp": 0,
    },
  ];

  apiData.forEach((playerJson) {
    var player = Player.fromJson(playerJson);
    player.sayHello();
  });
}
```

## Cascade Notation

```dart
class Player {
  late String name;
  late int xp;
  String team;

  Player({
    required this.name,
    required this.xp,
    required this.team,
  });

  void sayHello() {
    print('Hi My name is $name');
  }
}

void main() {
  var tetedo = Player(name: "tetedo", xp: 1500, team: 'blue')
    ..xp = 2000
    ..team = 'red'
    ..sayHello();

  var chch = tetedo
    ..name = 'chch'
    ..xp = 2000
    ..team = 'red'
    ..sayHello();
}
```

## Enums

```dart
enum Team { red, blue }

enum XPLevel { beginner, medium, pro }

class Player {
  late String name;
  late XPLevel xp;
  Team team;

  Player({
    required this.name,
    required this.xp,
    required this.team,
  });

  void sayHello() {
    print('Hi My name is $name');
  }
}

void main() {
  var tetedo = Player(name: "tetedo", xp: XPLevel.beginner, team: Team.blue)
    ..xp = XPLevel.pro
    ..team = Team.red
    ..sayHello();
}
```

## Abstract classes

```dart
abstract class Human {
  void walk();
}

enum Team { red, blue }

enum XPLevel { beginner, medium, pro }

class Player extends Human {
  late String name;
  late XPLevel xp;
  Team team;

  Player({
    required this.name,
    required this.xp,
    required this.team,
  });

  void sayHello() {
    print('Hi My name is $name');
  }

  void walk() {
    print('Im walking');
  }
}

class Coach extends Human {
  void walk() {
    print('Coach walking');
  }
}

void main() {
  var tetedo = Player(name: "tetedo", xp: XPLevel.beginner, team: Team.blue)
    ..xp = XPLevel.pro
    ..team = Team.red
    ..sayHello()
    ..walk();
}
```

## Inheritance

```dart
class Human {
  final String name;
  Human(this.name);
  void sayHello() {
    print('Hi my name is $name');
  }
}

class Player extends Human {
  final Team team;

  Player({
    required this.team,
    required String name,
  }) : super(name);

  @override
  void sayHello() {
    super.sayHello();
    print('Im $team team');
  }
}

enum Team { blue, red }

void main() {
  var player = Player(
    team: Team.red,
    name: 'tetedo',
  );

  player.sayHello();
}
```

## Mixins

```dart
mixin class Strong {
  final double strengthLevel = 1500.88;
}

mixin class QuickRunner {
  void runQuick() {
    print('ruuuuuuun!');
  }
}

mixin Tall {
  final double height = 1.99;
}

class Player extends QuickRunner with Strong, Tall {
  final Team team;

  Player({
    required this.team,
  });

  @override
  void runQuick() {
    print("run!");
  }
}

class Horse with Strong, QuickRunner {}

enum Team { blue, red }

void main() {
  var player = Player(
    team: Team.red,
  );

  print(player.height);
  player.runQuick();
}
```
