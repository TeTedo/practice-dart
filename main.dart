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
