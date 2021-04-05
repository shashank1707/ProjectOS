class SstfAlgorithm{
  static void calculateDifference(List<int> arr, int head, List<int> diff0){

    for (int i=0; i<diff0.length; i++){
      diff0[i] = (arr[i] - head).abs();
    }
  }

  static int findMin(List<int> diff0, List<bool> diff1){
    int index = -1;
    int min = 999999;

    for(int i=0; i<diff0.length; i++){
      if(!diff1[i] && min > diff0[i]){
        min = diff0[i];
        index = i;
      }
    }
    return index;
  }

  static List sstf(List<int> arr,int head){
    int size = arr.length;
    int l=size;
    List<int> seekSequence = List.filled(l,0);
    List<int> diff0 = List.filled(l,0);
    List<bool> diff1 = List.filled(l, false);
    int seekCount = 0;
    int index;
    for (int i = 0; i<l; i++){
//       seekSequence[i]=head;
      calculateDifference(arr, head, diff0);
      index = findMin(diff0, diff1);
      diff1[index] = true;
      seekCount += diff0[index];
      head = arr[index];
      seekSequence[i]=head;

    }
//     seekSequence[0]=seekCount;
//     seekSequence[seekSequence.length-1] = head;


    var ans = [seekCount, seekSequence];
    return ans;
  }
}