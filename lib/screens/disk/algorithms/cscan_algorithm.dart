class CscanAlgorithm {
  static List<Object> c_scan(
      List<int> arr, int head, int diskSize) {
    print(arr.toString());
    int seekCount = 0;
    int distance, curTrack;
    List<int> left = [];
    List<int> right = [];
    List<int> seekSequence = [];

    left.add(0);
    right.add(diskSize - 1);

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


    for (int i = 0; i < right.length; i++) {
      curTrack = right[i];
      seekSequence.add(curTrack);
      distance = (curTrack - head).abs();
      seekCount += distance;
      head = curTrack;
    }

    head = 0;
    seekCount += (diskSize - 1);

    for (int i = 0; i < left.length; i++) {
      curTrack = left[i];
      seekSequence.add(curTrack);
      distance = (curTrack - head).abs();
      seekCount += distance;
      head = curTrack;
    }

    var ans = [seekCount, seekSequence];

    print(seekCount.toString());
    return ans;
  }
}