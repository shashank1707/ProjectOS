import 'dart:math';

//algrithms building blocks
class Algorithms {
  // List mapGenerator(int process, bool io, bool priority) {
  //   List<Map> dataMap = [];
  //   for (int i = 0; i < process; i++) {
  //     dataMap.add({
  //       "Process": i + 1,
  //       "arrivalTime": Random().nextInt(10),
  //       "burstTime1": Random().nextInt(10),
  //       "ioTime": io ? Random().nextInt(10) : 0,
  //       "burstTime2": io ? Random().nextInt(10) : 0,
  //       "priority": priority ? Random().nextInt(10) : null,
  //       "completed": false,
  //       "RT": null,
  //     });
  //   }
  //   return dataMap;
  // }

  // void mapPrinterAlt(List<Map> dataMap) {
  //   print("| PR | AT | BT1 | CT | TAT | WT | RT | APT | tBT | status");
  //   dataMap.forEach((process) => print(
  //       "|  ${process['Process']} |  ${process['arrivalTime']} |   ${process['burstTime1']} |  ${process['compTime']} |  ${process['TAT']} | ${process['WT']}  |  ${process['RT']} |  ${process['approachTime']} |  ${process['tempBurstTime']} |  ${process['completed']}"));
  // }

  // void mapPrinter(List<Map> dataMap) {
  //   print(
  //       "|  PR  |  AT  |  BT1  |  IOT  |  BT2  |  pri  |  CT  |  TAT  |  WT  |  RT  |");
  //   dataMap.forEach((process) => print(
  //       "|   ${process['Process']}  |   ${process['arrivalTime']}  |    ${process['burstTime1']}  |    ${process['ioTime']}  |    ${process['burstTime2']}  | ${process['priority']}  |   ${process['compTime']}  |    ${process['TAT']}  |   ${process['WT']}  |   ${process['RT']}  |"));
  // }

  static List sortWithAtt(List<Map> dataMap, String attribute, bool assending) {
    dataMap.sort((a, b) => a[attribute].compareTo(b[attribute]));
    return assending ? dataMap : dataMap.reversed.toList();
  }

  static bool completeCheck(List<Map> dataMap) {
    bool isIt = true;
    for (int i = 0; i < dataMap.length; i++) {
      if (!dataMap[i]['completed']) {
        isIt = false;
        break;
      }
    }
    return isIt;
  }

  static Map selectMap(
      List<Map> dataMap, var currentTime, String attribute, bool order) {
    List<Map> newMap = [];
    bool isAvail = false;
    // mapPrinterAlt(dataMap);
    for (int i = 0; i < dataMap.length; i++) {
      if (dataMap[i]['arrivalTime'] <= currentTime &&
          !dataMap[i]['completed']) {
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

  static int processCalc(Map dataMap, int currentTime) {
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

  static Map parameterCalc(Map dataMap, int currentTime) {
    dataMap['compTime'] = currentTime;
    dataMap['TAT'] = currentTime - dataMap['arrivalTime'];
    dataMap['WT'] = dataMap['TAT'] -
        (dataMap['burstTime1'] + dataMap['ioTime'] + dataMap['burstTime2']);
    return dataMap;
  }

  static Map responseTimeCalc(Map dataMap, int currentTime) {
    dataMap['RT'] = (dataMap['arrivalTime'] > currentTime
            ? dataMap['arrivalTime']
            : currentTime) -
        dataMap['arrivalTime'];
    return dataMap;
  }

  static List<Map> updateMap(Map currentMap, List<Map> dataMap) {
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
  static List fifo(List<Map> dataMap, bool isChart) {
    List<Map> chart = [{}];
    dataMap = sortWithAtt(dataMap, 'arrivalTime', true);
    int currentTime = 0;
    for (int i = 0; i < dataMap.length; i++) {
      chart.add({
        "Process": dataMap[i]["Process"],
        "initTime": currentTime > dataMap[i]["arrivalTime"]
            ? currentTime
            : dataMap[i]["arrivalTime"],
        "arrivalTime": dataMap[i]["arrivalTime"],
        "burstTime": dataMap[i]["burstTime1"],
      });
      responseTimeCalc(dataMap[i], currentTime);
      currentTime = processCalc(dataMap[i], currentTime);
      parameterCalc(dataMap[i], currentTime);
      chart[i + 1]["endTime"] = currentTime;
    }
    chart.removeAt(0);
    return isChart ? chart : dataMap;
  }

  //prior
  static List prior(List<Map> dataMap, bool isChart) {
    List<Map> chart = [{}];
    dataMap = sortWithAtt(dataMap, 'priority', true);
    int currentTime = 0;
    for (int i = 0; i < dataMap.length; i++) {
      chart.add({
        "Process": dataMap[i]["Process"],
        "initTime": currentTime > dataMap[i]["arrivalTime"]
            ? currentTime
            : dataMap[i]["arrivalTime"],
        "arrivalTime": dataMap[i]["arrivalTime"],
        "burstTime": dataMap[i]["burstTime1"],
      });
      responseTimeCalc(dataMap[i], currentTime);
      currentTime = processCalc(dataMap[i], currentTime);
      parameterCalc(dataMap[i], currentTime);
      chart[i + 1]["endTime"] = currentTime;
    }
    chart.removeAt(0);
    return isChart ? chart : dataMap;
  }

  //sjf
  static List sjf(List<Map> dataMap, bool isChart) {
    List<Map> chart = [{}];
    dataMap
        .forEach((process) => process['approachTime'] = process['arrivalTime']);
    dataMap = sortWithAtt(dataMap, 'arrivalTime', true);
    int currentTime = dataMap[0]['arrivalTime'];
    int n = dataMap.length;
    Map currentMap;
    for (int i = 0; i < n; i++) {
      currentMap = selectMap(dataMap, currentTime, 'burstTime1', true);
      chart.add({
        "Process": currentMap["Process"],
        "initTime": currentTime > currentMap["approachTime"]
            ? currentTime
            : currentMap["arrivalTime"],
        "arrivalTime": currentMap["arrivalTime"],
        "burstTime": currentMap["burstTime1"],
      });
      responseTimeCalc(currentMap, currentTime);
      currentTime = processCalc(currentMap, currentTime);
      parameterCalc(currentMap, currentTime);
      updateMap(currentMap, dataMap);
      chart[i + 1]["endTime"] = currentTime;
    }
    dataMap.forEach((process) => process.remove('approachTime'));
    chart.removeAt(0);
    return isChart ? chart : dataMap;
  }

  //ljf
  static List ljf(List<Map> dataMap, bool isChart) {
    List<Map> chart = [{}];
    dataMap
        .forEach((process) => process['approachTime'] = process['arrivalTime']);
    dataMap = sortWithAtt(dataMap, 'arrivalTime', true);
    int currentTime = dataMap[0]['arrivalTime'];
    int n = dataMap.length;
    Map currentMap;
    for (int i = 0; i < n; i++) {
      currentMap = selectMap(dataMap, currentTime, 'burstTime1', false);
      chart.add({
        "Process": currentMap["Process"],
        "initTime": currentTime > currentMap["approachTime"]
            ? currentTime
            : int.parse(currentMap["approachTime"]),
        "arrivalTime": currentMap["arrivalTime"],
        "burstTime": currentMap["burstTime1"]
      });
      responseTimeCalc(currentMap, currentTime);
      currentTime = processCalc(currentMap, currentTime);
      parameterCalc(currentMap, currentTime);
      updateMap(currentMap, dataMap);
      chart[i + 1]["endTime"] = currentTime;
    }
    dataMap.forEach((process) => process.remove('approachTime'));
    chart.removeAt(0);
    return isChart ? chart : dataMap;
  }

  //----pre-emp
  //Round-Robin
  static List rr(List<Map> dataMap, int tq, bool isChart) {
    List<Map> chart = [{}];
    bool isComplete = false;
    int processing = 1;

    dataMap
        .forEach((process) => process['approachTime'] = process['arrivalTime']);
    dataMap
        .forEach((process) => process['tempBurstTime'] = process['burstTime1']);

    sortWithAtt(dataMap, 'approachTime', true);
    int currentTime = dataMap[0]['approachTime'];
    //   mapPrinterAlt(dataMap);

    while (!isComplete) {
      Map currentMap = selectMap(dataMap, currentTime, 'approachTime', true);
      chart.add({
        "Process": currentMap["Process"],
        "initTime": currentTime > currentMap["approachTime"]
            ? currentTime
            : currentMap["approachTime"],
        "arrivalTime": currentMap["arrivalTime"],
        "burstTime": currentMap["burstTime1"]
      });
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
      chart[processing]["endTime"] = currentTime;
      processing++;
      updateMap(currentMap, dataMap);
      isComplete = completeCheck(dataMap);
    }

    dataMap.forEach((process) => process.remove('approachTime'));
    dataMap.forEach((process) => process.remove('burstTime'));
    chart.removeAt(0);
    return isChart ? chart : dataMap;
  }

  //Prior
  static List preEmpPrior(List<Map> dataMap, bool isChart) {
    List<Map> chart = [{}];
    bool isComplete = false;
    int processing = 1;

    dataMap
        .forEach((process) => process['approachTime'] = process['arrivalTime']);
    dataMap
        .forEach((process) => process['tempBurstTime'] = process['burstTime1']);

    sortWithAtt(dataMap, 'approachTime', true);
    int currentTime = dataMap[0]['approachTime'];
    while (!isComplete) {
      Map currentMap = selectMap(dataMap, currentTime, 'priority', true);
      chart.add({
        "Process": currentMap["Process"],
        "initTime": currentTime > currentMap["approachTime"]
            ? currentTime
            : currentMap["approachTime"],
        "arrivalTime": currentMap["arrivalTime"],
        "burstTime": currentMap["burstTime1"]
      });
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
      chart[processing]["endTime"] = currentTime;
      processing++;
      updateMap(currentMap, dataMap);
      isComplete = completeCheck(dataMap);
    }
    // print('out of danger');
    dataMap.forEach((process) => process.remove('approachTime'));
    dataMap.forEach((process) => process.remove('burstTime'));
    chart.removeAt(0);
    return isChart ? chart : dataMap;
  }

  //SRTF
  static List srtf(List<Map> dataMap, bool isChart) {
    List<Map> chart = [{}];
    bool isComplete = false;
    int processing = 1;

    dataMap
        .forEach((process) => process['approachTime'] = process['arrivalTime']);
    dataMap
        .forEach((process) => process['tempBurstTime'] = process['burstTime1']);

    sortWithAtt(dataMap, 'approachTime', true);
    int currentTime = dataMap[0]['approachTime'];
    while (!isComplete) {
      Map currentMap = selectMap(dataMap, currentTime, 'tempBurstTime', true);
      chart.add({
        "Process": currentMap["Process"],
        "initTime": currentTime > currentMap["approachTime"]
            ? currentTime
            : currentMap["approachTime"],
        "arrivalTime": currentMap["arrivalTime"],
        "burstTime": currentMap["burstTime1"]
      });
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
      chart[processing]["endTime"] = currentTime;
      processing++;
      updateMap(currentMap, dataMap);
      isComplete = completeCheck(dataMap);
    }
    // print('out of danger');
    dataMap.forEach((process) => process.remove('approachTime'));
    dataMap.forEach((process) => process.remove('burstTime'));
    chart.removeAt(0);
    return isChart ? chart : dataMap;
  }

  //lrtf
  static List lrtf(List<Map> dataMap, bool isChart) {
    List<Map> chart = [{}];
    bool isComplete = false;
    int processing = 1;

    dataMap
        .forEach((process) => process['approachTime'] = process['arrivalTime']);
    dataMap
        .forEach((process) => process['tempBurstTime'] = process['burstTime1']);

    sortWithAtt(dataMap, 'approachTime', true);
    int currentTime = dataMap[0]['approachTime'];
    while (!isComplete) {
      Map currentMap = selectMap(dataMap, currentTime, 'tempBurstTime', false);
      chart.add({
        "Process": currentMap["Process"],
        "initTime": currentTime > currentMap["approachTime"]
            ? currentTime
            : currentMap["approachTime"],
        "arrivalTime": currentMap["arrivalTime"],
        "burstTime": currentMap["burstTime1"],
      });
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
      chart[processing]["endTime"] = currentTime;
      processing++;
      updateMap(currentMap, dataMap);
      isComplete = completeCheck(dataMap);
    }
    // print('out of danger');
    dataMap.forEach((process) => process.remove('approachTime'));
    dataMap.forEach((process) => process.remove('burstTime'));
    chart.removeAt(0);
    return isChart ? chart : dataMap;
  }

  //main funtions
  // void main() {
  //   var dataMap = mapGenerator(5, false, false);
  //   sortWithAtt(dataMap, 'arrivalTime', true);
  //   mapPrinter(dataMap);
  //   // mapPrinter(lrtf(dataMap));
  // //   mapPrinter(ljf(dataMap));my
  // }
}
