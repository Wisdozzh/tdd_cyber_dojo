import 'package:flutter_test/flutter_test.dart';
import 'package:fluttert_dd_cyber_dojo/one_hundred_doors.dart';

main() {
  group('100 doors which are open, which are closed', () {
    void printResult(List<int> doors) {
      print('*******************');
      for(int i = 0; i < 10; i ++) {
        String str = '';
        for(int j = 0; j < 10; j ++) {
          str += ' ${doors[i * 10 + j]}';
        }
        print(str);
      }
    }

    test('100 doors in a row  all initially closed', () {
      List<int> doors = OneHundredDoors.init(100);
      Iterable<int> iterable = doors.where((element) => element == 0);
      expect(iterable.length, 100);
      printResult(doors);
    });

    test('if the dooe is closed , you open it；if it is open, you close it', () {
      int toggled = OneHundredDoors.toggle(1);
      expect(toggled, 0);
      int toggled1 = OneHundredDoors.toggle(0);
      expect(toggled1, 1);
    });

    test('the first time through, visit every door', () {
      List<int> throughted =
          OneHundredDoors.through(OneHundredDoors.init(100), 1);
      Iterable<int> iterable = throughted.where((element) => element == 1);
      expect(iterable.length, 100);
      printResult(throughted);
    });

    test('the second time you only visit every 2nd door #2, #4, #6, ...', () {
      List<int> throughted =
          OneHundredDoors.through(OneHundredDoors.init(100), 2);
      expect(throughted[2 - 1], 0);
      expect(throughted[4 - 1], 0);
      expect(throughted[6 - 1], 0);
      expect(throughted[100 - 1], 0);
      printResult(throughted);
    });
    test('the second time you only visit every 3nd door #3, #6, #9, ...', () {
      List<int> throughted =
          OneHundredDoors.through(OneHundredDoors.init(100), 3);
      expect(throughted[3 - 1], 0);
      expect(throughted[6 - 1], 1);
      expect(throughted[9 - 1], 0);
      expect(throughted[99 - 1], 0);
      printResult(throughted);
    });
    test('100 doors 100 times', () {
      List<int> throughted =
          OneHundredDoors.through(OneHundredDoors.init(100), 100);
      printResult(throughted);
      print('结果：');
      for(int i = 0 ; i < throughted.length; i ++) {
        if (throughted[i] == 1) {
          print('第${i + 1}扇门 是打开的！');
        }
      }
    });
  });
}
