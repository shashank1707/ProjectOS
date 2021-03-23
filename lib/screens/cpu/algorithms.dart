import 'dart:math';

//functions
List mapGenerator(int process, bool io, bool priority) {
  List<Map> dataMap = [];
  for (int i = 0; i < process; i++) {
    dataMap.add({
      "Process": i + 1,
      "arrivalTime": Random().nextInt(10),
      "burstTime1": Random().nextInt(10),
      "ioTime": io ? Random().nextInt(10) : 0,
      "burstTime2": io ? Random().nextInt(10) : 0,
      "priority": priority ? Random().nextInt(10) : null,
      "completed": false,
    });
  }
  return dataMap;
}

void mapPrinter(List<Map> dataMap) {
  print(
      "|  PR  |  AT  |  BT1  |  IOT  |  BT2  |  pri  |  CT  |  TAT  |  WT  |  RT  |");
  dataMap.forEach((process) => print(
      "|   ${process['Process']}  |   ${process['arrivalTime']}  |    ${process['burstTime1']}  |    ${process['ioTime']}  |    ${process['burstTime2']}  | ${process['priority']}  |   ${process['compTime']}  |    ${process['TAT']}  |   ${process['WT']}  |   ${process['RT']}  |"));
}

List sortWithAtt(List<Map> dataMap, String attribute, bool assending) {
  dataMap.sort((a, b) => a[attribute].compareTo(b[attribute]));
  return assending ? dataMap : dataMap.reversed.toList();
}

List selectMap(List<Map> dataMap, int currentTime) {
   List<Map> newMap = [];
  bool isAvail = false;
  int nextAT = 10;
  for (int i = 0; i < dataMap.length; i++) {
    if (dataMap[i]['arrivalTime'] <= currentTime && !dataMap[i]['completed']) {
      isAvail = true;
      break;
    }
  }
  if (isAvail) {
    newMap = dataMap.map((process) {
      if (process['arrivalTime'] <= currentTime && !process['completed']) {
        return process;
      }
    }).toList();
    newMap.removeWhere((value) => value == null);
  } else {
    for (int i = 0; i < dataMap.length; i++) {
      if (dataMap[i]['arrivalTime'] < nextAT &&
          dataMap[i]['arrivalTime'] > currentTime) {
        nextAT = dataMap[i]['arrivalTime'];
      }
    }
    newMap = dataMap.map((process) {
      if (process['arrivalTime'] <= nextAT && !process['completed']) {
        return process;
      }
    }).toList();
    newMap.removeWhere((value) => value == null);
  }
  return newMap;
}

int processCalc(Map dataMap, int currentTime) {
  currentTime = dataMap['arrivalTime'] >= currentTime
      ? dataMap['arrivalTime'] +
          dataMap['burstTime1'] +
          dataMap['ioTime'] +
          dataMap['burstTime2']
      : currentTime +
          dataMap['burstTime1'] +
          dataMap['ioTime'] +
          dataMap['burstTime2'];
  dataMap['completed'] = true;
  return currentTime;
}

Map parameterCalc(Map dataMap, int currentTime) {
  dataMap['compTime'] = currentTime;
  dataMap['TAT'] = currentTime - dataMap['arrivalTime'];
  dataMap['WT'] = dataMap['TAT'] -
      (dataMap['burstTime1'] + dataMap['ioTime'] + dataMap['burstTime2']);
  return dataMap;
}

Map responseTimeCalc(Map dataMap, int currentTime) {
  dataMap['RT'] = (dataMap['arrivalTime'] > currentTime
          ? dataMap['arrivalTime']
          : currentTime) -
      dataMap['arrivalTime'];
  return dataMap;
}

List<Map> updateMap(Map currentMap, List<Map> dataMap) {
  for (int i = 0; i < dataMap.length; i++) {
    if (currentMap['Process'] == dataMap[i]['Process']) {
      dataMap[i] = currentMap;
    }
  }
  return dataMap;
}

//algorithms

//Non-Pre-Emp: FCFS, SJF, LJF, Priority
//Pre-Emp    : RR, SRTF, LRTF, Priority

//fifo
List fifo(List<Map> dataMap) {
  dataMap = sortWithAtt(dataMap, 'arrivalTime', true);
  int currentTime = 0;
  for (int i = 0; i < dataMap.length; i++) {
    responseTimeCalc(dataMap[i], currentTime);
    currentTime = processCalc(dataMap[i], currentTime);
    parameterCalc(dataMap[i], currentTime);
  }
  return dataMap;
}

List prior(List<Map> dataMap) {
  dataMap = sortWithAtt(dataMap, 'priority', true);
  int currentTime = 0;
  for (int i = 0; i < dataMap.length; i++) {
    responseTimeCalc(dataMap[i], currentTime);
    currentTime = processCalc(dataMap[i], currentTime);
    parameterCalc(dataMap[i], currentTime);
  }
  return dataMap;
}

//sjf
List sjf(List<Map> dataMap) {
  dataMap = sortWithAtt(dataMap, 'arrivalTime', true);
  int currentTime = dataMap[0]['arrivalTime'];
  int n = dataMap.length;
  List<Map> currentMap;
  for (int i = 0; i < n; i++) {
    currentMap =
        sortWithAtt(selectMap(dataMap, currentTime), 'burstTime1', true);
    responseTimeCalc(currentMap[0], currentTime);
    currentTime = processCalc(currentMap[0], currentTime);
    parameterCalc(currentMap[0], currentTime);
    updateMap(currentMap[0], dataMap);
  }
  return dataMap;
}

List ljf(List<Map> dataMap) {
  dataMap = sortWithAtt(dataMap, 'arrivalTime', true);
  int currentTime = dataMap[0]['arrivalTime'];
  int n = dataMap.length;
  List<Map> currentMap;
  for (int i = 0; i < n; i++) {
    currentMap =
        sortWithAtt(selectMap(dataMap, currentTime), 'burstTime1', false);
    responseTimeCalc(currentMap[0], currentTime);
    currentTime = processCalc(currentMap[0], currentTime);
    parameterCalc(currentMap[0], currentTime);
    updateMap(currentMap[0], dataMap);
  }
  return dataMap;
}

//main funtions
void main() {
  var dataMap = mapGenerator(3, false, true);
  mapPrinter(dataMap);
//   mapPrinter(altsjf(dataMap));
  print('priority');
  mapPrinter(prior(dataMap));
}
