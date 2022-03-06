//
//
class XspeedltAlgo {
  //
  // List of items
  List<int> items = <int>[1, 6, 3, 8, 4, 1, 6, 8, 9, 5, 2, 5, 7, 7, 3];
  //
  // List of boxes (Empty at the beginning)
  List<int> boxes = <int>[];
  //
  // Box (Empty at the beginning)
  int box = 0;
  //
  List<int> sortAlgorithm() {
    //
    // Sum of itemsList
    final int itemSum = items.fold(0, (int p, int c) => p + c);
    //
    // Function run until the sum of the two lists is equal
    while (boxes.fold(0, (int p, int c) => p + c) < itemSum) {
      //
      // If box is equal to 10 --> Add it into list of boxes
      if (box == 10) {
        boxes.add(box);
      } else {
        //
        // 1. Find fit article with current box
        final int takedItem = items.firstWhere((int e) => e + box <= 10);
        //
        // 2. Put it into box
        box = box + takedItem;
        //
        // 3. Remove it from items list
        items.removeWhere((int e) => e == takedItem);
      }
    }
    // Uncomment me to show result in console
    // print(boxes);
    return boxes;
  }
}
