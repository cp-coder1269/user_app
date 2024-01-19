import 'package:flutter/material.dart';
import 'package:user_app/models/RequestData.dart';
import 'package:intl/intl.dart';

class RequestDetails extends StatelessWidget {
  const RequestDetails({super.key, required this.requestData});
  final RequestData requestData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Request Status'),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RequestDataCard(requestData),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    fixedSize: const Size(300, 60),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.purple,
                  ),
                  onPressed: () {
                    // Navigate to second route when tapped.Center
                    Navigator.pop(context);
                  },
                  child: const Text("Okay",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
                const SizedBox(height: 20),
              ]),
        ));
  }
}

// ignore: must_be_immutable
class RequestDataCard extends StatelessWidget {
  late RequestData _requestData;

  RequestDataCard(RequestData requestData, {super.key}) {
    _requestData = requestData;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Name: ${_requestData.toJson()["name"]}',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text('Email: ${_requestData.toJson()["email"]}',
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Text('Expected Salary: ${_requestData.toJson()["expectedSalary"]}',
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Text('Status: ${_requestData.toJson()["status"]}',
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Text(
              'Date: ${DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.parse(_requestData.toJson()['updateTime']))}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
