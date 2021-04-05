class ScanAlgorithm {
  static List<Object> scan(
      List<int> arr, int head, int diskSize, String direction) {
    print(arr.toString());
    print(direction);
    int seekCount = 0;
    int distance, curTrack;
    List<int> left = [];
    List<int> right = [];
    List<int> seekSequence = [];

    if (direction == 'left') {
      left.add(0);
    } else if (direction == 'right') {
      right.add(diskSize - 1);
    }

    for (int i = 0; i < arr.length; i++) {
      if (arr[i] < head) {
        left.add(arr[i]);
      }
      if (arr[i] > head) {
        right.add(arr[i]);
      }
    }

    left.sort();
    right.sort();

    for (int j = 0; j < 2; j++) {
      if (direction == 'left') {
        for (int i = left.length - 1; i >= 0; i--) {
          curTrack = left[i];
          seekSequence.add(curTrack);
          distance = (curTrack - head).abs();
          seekCount += distance;
          head = curTrack;
          print(seekCount.toString());
        }

        direction = 'right';
      } else if (direction == 'right') {
        for (int i = 0; i < right.length; i++) {
          curTrack = right[i];
          seekSequence.add(curTrack);
          distance = (curTrack - head).abs();
          seekCount += distance;
          head = curTrack;
        }
        direction = 'left';
      }
    }
    var ans = [seekCount, seekSequence];

    print(seekCount.toString());
    return ans;
  }
}
