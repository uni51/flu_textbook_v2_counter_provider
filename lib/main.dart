import 'package:flutter/material.dart';
import 'package:counter_provider/count_page.dart';
import 'package:counter_provider/count_page2.dart';
import 'package:counter_provider/count_page3.dart';
import 'package:counter_provider/count_page4.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'demo',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // 選択中フッターメニューのインデックスを一時保存する用変数
  int selectedIndex = 0;

  // 切り替える画面のリスト
  List<Widget> display = [CountPage(), CountPage2(), CountPage3(), CountPage4()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Counter Provider Demo')),
        body: display[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          // 3つ以上表示する場合はこの設定が必要となる
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '01'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_none), label: '02'),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: '03'),
            BottomNavigationBarItem(icon: Icon(Icons.access_alarm), label: '04'),
          ],
          // 現在選択されているフッターメニューのインデックス
          currentIndex: selectedIndex,
          // フッター領域の影
          elevation: 0,
          // フッターメニュータップ時の処理
          onTap: (int index) {
            selectedIndex = index;
            setState(() {});
          },
          // 選択中フッターメニューの色
          fixedColor: Colors.blue,
        ));
  }
}
