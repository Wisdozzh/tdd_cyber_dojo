class OneHundredDoors {
  static List<int> init(int num) {

    List<int> init = List(num);
    init.fillRange(0, num, 0);
//    List<int> init = List();
//    for (int i = 0; i < num; i++) {
//      init.add(0);
//    }
    return init;
  }

  static int toggle(int i) {
    return i == 0 ? 1 : 0;
  }

  static List<int> through(List<int> init, int time) {
    if (time != 0) {
      for (int i = 0; i < init.length; i++) {
        if ((i + 1) % time == 0) {
          init[i] = toggle(init[i]);
        }
      }
      time--;
      through(init, time);
    }
    return init;
  }
}
