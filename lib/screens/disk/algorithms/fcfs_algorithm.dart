class FcfsAlgorithm{
  static List fcfs(List<int> arr,int head){

    int seekCount=0,a;



    int distance, currTrack;
    int size = arr.length;
    List<int> seekSequence = List.filled(size,0);

    for(int i=0;i<size;i++){
      currTrack=arr[i];
//       seekSequence[i]=head;
      a=currTrack - head;
      distance = a.abs();
      seekCount += distance;
      head = currTrack;
      seekSequence[i]=head;


    }
//     seekSequence[seekSequence.length-1]=head;
//     lst[0]=seekCount;
    var ans = [seekCount, seekSequence];

    return ans;


  }
}