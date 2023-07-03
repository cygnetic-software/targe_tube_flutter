import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportContentController extends GetxController {
  RxString selectedReason = RxString('Select Reason');

  final List<String> reasonOptions = [
    'Select Reason',
    'Fraud',
    'Duplicate',
    'Spam',
    'Wrong Category',
    'Other',
  ];
}

class ReportContentPage extends StatelessWidget {
  final ReportContentController controller = Get.put(ReportContentController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Report"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Reason",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),
              Obx(
                () => DropdownButtonFormField<String>(
                  value: controller.selectedReason.value,
                  onChanged: (String? value) {
                    if (value != null) {
                      controller.selectedReason.value = value;
                    }
                  },
                  items: controller.reasonOptions.map((reason) {
                    return DropdownMenuItem<String>(
                      value: reason,
                      child: Text(
                        reason,
                        style: TextStyle(
                          fontSize: 16,
                          color: reason == controller.selectedReason.value
                              ? Colors.blue
                              : Colors.black,
                        ),
                      ),
                    );
                  }).toList(),
                  icon: Icon(Icons.arrow_drop_down),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Message",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),
              TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Enter message",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle submit button tap
                  },
                  child: Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
