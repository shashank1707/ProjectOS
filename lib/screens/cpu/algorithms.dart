import 'dart:math';

//algrithms building blocks
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
      "RT": null,
    });
  }
  return dataMap;
}

void mapPrinterAlt(List<Map> dataMap) {
  print("| PR | AT | BT1 | CT | TAT | WT | RT | APT | tBT | status");
  dataMap.forEach((process) => print(
      "|  ${process['Process']} |  ${process['arrivalTime']} |   ${process['burstTime1']} |  ${process['compTime']} |  ${process['TAT']} | ${process['WT']}  |  ${process['RT']} |  ${process['approachTime']} |  ${process['tempBurstTime']} |  ${process['completed']}"));
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

bool completeCheck(List<Map> dataMap) {
  bool isIt = true;
  for (int i = 0; i < dataMap.length; i++) {
    if (!dataMap[i]['completed']) {
      isIt = false;
      break;
    }
  }
  return isIt;
}

Map selectMap(
    List<Map> dataMap, var currentTime, String attribute, bool order) {
  List<Map> newMap = [];
  bool isAvail = false;
  // mapPrinterAlt(dataMap);
  for (int i = 0; i < dataMap.length; i++) {
    if (dataMap[i]['arrivalTime'] <= currentTime && !dataMap[i]['completed']) {
      isAvail = true;
      break;
    }
  }

  var nextAT = 10;
  for (int i = 0; i < dataMap.length; i++) {
    if (dataMap[i]['arrivalTime'] < nextAT &&
        dataMap[i]['arrivalTime'] > currentTime) {
      nextAT = dataMap[i]['arrivalTime'];
    }
  }
  nextAT = isAvail ? currentTime : nextAT;
  // print('availibility:$isAvail currentTime:$currentTime nextAT:$nextAT');
  newMap = dataMap.map((process) {
    if (!process['completed'] && process['arrivalTime'] <= nextAT) {
      return process;
    }
  }).toList();
  // print(newMap);
  // print('');
  newMap.removeWhere((value) => value == null);
  newMap = sortWithAtt(newMap, attribute, order);
  return newMap[0];
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

//----Non-pre-Emp
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

//prior
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
List<Map> sjf(List<Map> dataMap) {
  dataMap
      .forEach((process) => process['approachTime'] = process['arrivalTime']);
  dataMap = sortWithAtt(dataMap, 'arrivalTime', true);
  int currentTime = dataMap[0]['arrivalTime'];
  int n = dataMap.length;
  Map currentMap;
  for (int i = 0; i < n; i++) {
    currentMap = selectMap(dataMap, currentTime, 'burstTime1', true);
    responseTimeCalc(currentMap, currentTime);
    currentTime = processCalc(currentMap, currentTime);
    parameterCalc(currentMap, currentTime);
    updateMap(currentMap, dataMap);
  }
  dataMap.forEach((process) => process.remove('approachTime'));
  return dataMap;
}

//ljf
List<Map> ljf(List<Map> dataMap) {
  dataMap
      .forEach((process) => process['approachTime'] = process['arrivalTime']);
  dataMap = sortWithAtt(dataMap, 'arrivalTime', true);
  int currentTime = dataMap[0]['arrivalTime'];
  int n = dataMap.length;
  Map currentMap;
  for (int i = 0; i < n; i++) {
    currentMap = selectMap(dataMap, currentTime, 'burstTime1', false);
    responseTimeCalc(currentMap, currentTime);
    currentTime = processCalc(currentMap, currentTime);
    parameterCalc(currentMap, currentTime);
    updateMap(currentMap, dataMap);
  }
  dataMap.forEach((process) => process.remove('approachTime'));
  return dataMap;
}

//----pre-emp
//Round-Robin
List rr(List<Map> dataMap, int tq) {
  bool isComplete = false;

  dataMap
      .forEach((process) => process['approachTime'] = process['arrivalTime']);
  dataMap
      .forEach((process) => process['tempBurstTime'] = process['burstTime1']);

  sortWithAtt(dataMap, 'approachTime', true);
  int currentTime = dataMap[0]['approachTime'];
//   mapPrinterAlt(dataMap);

  while (!isComplete) {
    Map currentMap = selectMap(dataMap, currentTime, 'approachTime', true);
    if (currentMap['RT'] == null) {
      responseTimeCalc(currentMap, currentTime);
    }
    int increment =
        tq < currentMap['tempBurstTime'] ? tq : currentMap['tempBurstTime'];
    currentMap['tempBurstTime'] -= increment;
    currentTime = (currentMap['arrivalTime'] > currentTime
            ? currentMap['arrivalTime']
            : currentTime) +
        increment;
    currentMap['approachTime'] = currentTime + 0.001;
    if (currentMap['tempBurstTime'] == 0) {
      parameterCalc(currentMap, currentTime);
      currentMap['completed'] = true;
    }
    updateMap(currentMap, dataMap);
    isComplete = completeCheck(dataMap);
  }

  dataMap.forEach((process) => process.remove('approachTime'));
  dataMap.forEach((process) => process.remove('burstTime'));

  return dataMap;
}

//Prior
List preEmpPrior(List<Map> dataMap) {
  bool isComplete = false;

  dataMap
      .forEach((process) => process['approachTime'] = process['arrivalTime']);
  dataMap
      .forEach((process) => process['tempBurstTime'] = process['burstTime1']);

  sortWithAtt(dataMap, 'approachTime', true);
  int currentTime = dataMap[0]['approachTime'];
  while (!isComplete) {
    Map currentMap = selectMap(dataMap, currentTime, 'priority', true);
    if (currentMap['RT'] == null) {
      responseTimeCalc(currentMap, currentTime);
    }
    int increment = currentMap['tempBurstTime'] == 0 ? 0 : 1;
    currentMap['tempBurstTime'] -= increment;
    currentTime = (currentMap['arrivalTime'] > currentTime
            ? currentMap['arrivalTime']
            : currentTime) +
        increment;
    currentMap['approachTime'] = currentTime;
    if (currentMap['tempBurstTime'] == 0) {
      parameterCalc(currentMap, currentTime);
      currentMap['completed'] = true;
    }
    updateMap(currentMap, dataMap);
    isComplete = completeCheck(dataMap);
  }
  // print('out of danger');
  dataMap.forEach((process) => process.remove('approachTime'));
  dataMap.forEach((process) => process.remove('burstTime'));

  return dataMap;
}

//SRTF
List srtf(List<Map> dataMap) {
  bool isComplete = false;

  dataMap
      .forEach((process) => process['approachTime'] = process['arrivalTime']);
  dataMap
      .forEach((process) => process['tempBurstTime'] = process['burstTime1']);

  sortWithAtt(dataMap, 'approachTime', true);
  int currentTime = dataMap[0]['approachTime'];
  while (!isComplete) {
    Map currentMap = selectMap(dataMap, currentTime, 'tempBurstTime', true);
    if (currentMap['RT'] == null) {
      responseTimeCalc(currentMap, currentTime);
    }
    int increment = currentMap['tempBurstTime'] == 0 ? 0 : 1;
    currentMap['tempBurstTime'] -= increment;
    currentTime = (currentMap['arrivalTime'] > currentTime
            ? currentMap['arrivalTime']
            : currentTime) +
        increment;
    currentMap['approachTime'] = currentTime;
    if (currentMap['tempBurstTime'] == 0) {
      parameterCalc(currentMap, currentTime);
      currentMap['completed'] = true;
    }
    updateMap(currentMap, dataMap);
    isComplete = completeCheck(dataMap);
  }
  // print('out of danger');
  dataMap.forEach((process) => process.remove('approachTime'));
  dataMap.forEach((process) => process.remove('burstTime'));

  return dataMap;
}

//lrtf
List lrtf(List<Map> dataMap) {
  bool isComplete = false;

  dataMap
      .forEach((process) => process['approachTime'] = process['arrivalTime']);
  dataMap
      .forEach((process) => process['tempBurstTime'] = process['burstTime1']);

  sortWithAtt(dataMap, 'approachTime', true);
  int currentTime = dataMap[0]['approachTime'];
  while (!isComplete) {
    Map currentMap = selectMap(dataMap, currentTime, 'tempBurstTime', false);
    if (currentMap['RT'] == null) {
      responseTimeCalc(currentMap, currentTime);
    }
    int increment = currentMap['tempBurstTime'] == 0 ? 0 : 1;
    currentMap['tempBurstTime'] -= increment;
    currentTime = (currentMap['arrivalTime'] > currentTime
            ? currentMap['arrivalTime']
            : currentTime) +
        increment;
    currentMap['approachTime'] = currentTime;
    if (currentMap['tempBurstTime'] == 0) {
      parameterCalc(currentMap, currentTime);
      currentMap['completed'] = true;
    }
    updateMap(currentMap, dataMap);
    isComplete = completeCheck(dataMap);
  }
  // print('out of danger');
  dataMap.forEach((process) => process.remove('approachTime'));
  dataMap.forEach((process) => process.remove('burstTime'));

  return dataMap;
}

//main funtions
void main() {
  var dataMap = mapGenerator(5, false, false);
  mapPrinter(dataMap);
  // mapPrinter(lrtf(dataMap));
//   mapPrinter(ljf(dataMap));my
}
