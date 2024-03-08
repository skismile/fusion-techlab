import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tasklogin/controller/contest_controller/contest_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ContestController _contestController = Get.put(ContestController());
  @override
  void initState() {
    super.initState();
    _contestController.getContestData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contest Page"),
      ),
      body: SizedBox(
          width: double.infinity,
          height: Get.height,
          child: Obx(() => _contestController.isContestDataLoading.value
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: _contestController.contestData.length,
                  itemBuilder: (context, index) {
                    return _itemCard(index);
                  },
                ))),
    );
  }

  SizedBox _itemCard(int index) {
    return SizedBox(
      height: 200,
      width: Get.width * 0.8,
      child: Card(
        margin: EdgeInsets.only(top: 15),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _contestController.contestData[index]['matches']['matchType']
                  .toString()
                  .toUpperCase(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Image.network(
                          "${_contestController.contestData[index]['matches']['t1img']}"),
                      Text(
                        "${_contestController.contestData[index]['matches']['t1']}",
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Image.network(
                          "${_contestController.contestData[index]['matches']['t2img']}"),
                      Text(
                        "${_contestController.contestData[index]['matches']['t2']}",
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${_contestController.contestData[index]['matches']['status']}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "${_contestController.contestData[index]['matches']['dateTimeGMT']}",
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
