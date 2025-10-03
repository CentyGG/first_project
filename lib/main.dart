import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter clicker game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  var clicks = 0;
  var firstboss_clicks = 0;
  var secondboss_clicks = 0;
  var currentBoss = 1;
  var firstBossHealth = 30;
  var secondBossHealth = 150;
  int get boss_clicks => currentBoss == 1 ? firstboss_clicks : secondboss_clicks;
  int get currentBossHealth => currentBoss == 1 ? firstBossHealth : secondBossHealth;
  int get remainingHealth => currentBossHealth - clicks;
  void onTap() {
    setState(() {
      clicks++;
      if (currentBoss == 1) {
        firstboss_clicks++;
      } else {
        secondboss_clicks++;
      }
    });
  }
  void resetGame() {
    setState(() {
      clicks = 0;
      firstboss_clicks = 0;
      secondboss_clicks = 0;
      firstBossHealth = 30;
      secondBossHealth = 150;
    });
  }
  void selectFirstBoss() {
    setState(() {
      resetGame();
      currentBoss = 1;
    });
  }
  void selectSecondBoss() {
    setState(() {
      resetGame();
      currentBoss = 2;
    });
  }


  @override
  Widget build(BuildContext context) {
    final isBossDefeated = remainingHealth <= 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Выбери босса',
              style: TextStyle(
                color: Colors.black
              ),
              textScaler: TextScaler.linear(3),
            )
          ,
          Padding(padding: EdgeInsets.all(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed:selectFirstBoss,
                  style: ElevatedButton.styleFrom(
                      elevation: currentBoss == 1 ? 10 : 0,
                      backgroundColor: Colors.white,
                      disabledBackgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                          side: BorderSide.none
                    )
                  ),
                  child: Image.asset('assets/images/new_1.jpg',width: 100, height: 140)),
                Padding(padding: EdgeInsets.all(50)),
                ElevatedButton(
                    onPressed: selectSecondBoss,
                    style: ElevatedButton.styleFrom(
                        elevation: currentBoss == 2 ? 10 : 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                          side: BorderSide.none
                        ),
                        backgroundColor: Colors.white,
                        disabledBackgroundColor: Colors.white
                    ),
                    child: Image.asset('assets/images/new_2.jpg',width: 70, height: 140)),
              ]

            ),
            Padding(padding: EdgeInsets.all(20)),
            Text(
              isBossDefeated
                  ? 'БОСС ПОВЕРЖЕН!'
                  : 'Осталось здоровья: $remainingHealth',
              style: TextStyle(
                color: isBossDefeated ? Colors.red : Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textScaler: const TextScaler.linear(2),
            ),
            Padding(padding: EdgeInsets.all(20)),
            Image.asset(
                currentBoss == 1
                    ? (remainingHealth <= 0 ? 'assets/images/defeated_1.jpg' : 'assets/images/new_1.jpg')
                    : (remainingHealth <= 0 ? 'assets/images/defeated_2.jpg' : 'assets/images/new_2.jpg'),
                width: 100,
                height: 240
            ),
            Padding(padding: EdgeInsets.all(30)),
            ElevatedButton(
              onPressed: isBossDefeated ? null : onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: isBossDefeated ? Colors.grey : Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
              child: Text(
                isBossDefeated ? 'ПОБЕДА!' : 'Кликнуть',
                textScaler: const TextScaler.linear(2),
                style: const TextStyle(color: Colors.white),
              ))]
        )
      ));
  }
}
