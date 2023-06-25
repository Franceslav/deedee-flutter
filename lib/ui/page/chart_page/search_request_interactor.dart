import 'package:deedee/generated/deedee/api/model/service_request.pb.dart';
import 'package:deedee/repository/service_request_repository.dart';
import 'package:sortedmap/sortedmap.dart';

class ServiceRequestInteractor {
  final String email;
  final ServiceRequestRepository repository;

  ServiceRequestInteractor(this.email, this.repository);

  Future<Map<DateTime, int>> get serviceRequestsByDates async {
    var list = await repository.getAll(email);
    Future.delayed(Duration(seconds: 1));
    var map = _foldRequestsByDate(list);
    return _addedEmptyMonthsToMap(map);
  }

  Map<DateTime, int> _foldRequestsByDate(List<ServiceRequest> list) {
    Map<DateTime, int> map = {};
    for (var element in list) {
      final date = DateTime.fromMillisecondsSinceEpoch(
          element.createdAt.seconds.toInt() * 1000);
      if (map.containsKey(date)) {
        map[date] = map[date]! + 1;
      } else {
        map[date] = 1;
      }
    }
    return {
      DateTime(2022, 9): 45,
      DateTime(2022, 10): 3,
      DateTime(2023, 2): 15,
      DateTime(2023, 4): 3,
      DateTime(2023, 5): 17,
    };
    // return map;
  }

  Map<DateTime, int> _addedEmptyMonthsToMap(Map<DateTime, int> map) {
    final sortedMap = SortedMap<DateTime, int>(const Ordering.byKey());
    sortedMap.addAll(map);
    DateTime now = DateTime(DateTime.now().year, DateTime.now().month);
    var iterableDate =
        DateTime(sortedMap.keys.first.year, sortedMap.keys.first.month + 1);

    while (!iterableDate.isAfter(now)) {
      if (!sortedMap.containsKey(iterableDate)) {
        sortedMap[iterableDate] = 0;
      }
      iterableDate = DateTime(iterableDate.year, iterableDate.month + 1);
      // print(sortedMap);
    }
    return sortedMap;
  }
}
