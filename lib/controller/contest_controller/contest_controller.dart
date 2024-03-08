import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class ContestController extends GetxController {
  RxBool isContestDataLoading = false.obs;
  RxList contestData = [].obs;
  final String url =
      "http://65.2.128.71:5010/api/getContest?page=1&limit=5&sportsType=cricket";

  final authToken =
      "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NWNmNTk4OTQxMzhkOGVkODU5OGRkMDYiLCJyb2xlIjoiYWRtaW4iLCJlbWFpbCI6ImltdGl5YXoyQGdtYWkuY29tIiwiaWF0IjoxNzA4MDg3Njg5fQ.tkZOi5b5-48z1tSGaR5IQ6YAxkNBYyDEtTP8ZBV-NnE";
  final Dio _dio = Dio();

  Future<bool> getContestData() async {
    try {
      isContestDataLoading(true);
      var res = await _dio.get(url,
          options: Options(headers: {"Authorization": authToken}));
      if (res.statusCode == 200 && res.data['success']) {
        // debugPrint('res.data: ${res.data}');
        contestData.assignAll(res.data['data']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    } finally {
      debugPrint('contestData: ${contestData}');
      isContestDataLoading(false);
    }
  }
}
