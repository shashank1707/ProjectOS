class ClookAlgorithm {
  static List<Object> clook(
      List<int> arr, int head, int diskSize) {
    print(arr.toString());
    int seekCount = 0;
    int distance, curTrack;
    List<int> left = [];
    List<int> right = [];
    List<int> seekSequence = [];

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

    for(int i = 0; i < right.length; i++)
    {
      curTrack = right[i];
      seekSequence.add(curTrack);
      distance = (curTrack - head).abs();
      seekCount += distance;
      head = curTrack;
    }


    seekCount += (head - left[0]).abs();
    head = left[0];

    for(int i = 0; i < left.length; i++)
    {
      curTrack = left[i];
      seekSequence.add(curTrack);
      distance = (curTrack - head).abs();
      seekCount += distance;
      head = curTrack;
    }

    var ans = [seekCount, seekSequence];

    return ans;
  }
}