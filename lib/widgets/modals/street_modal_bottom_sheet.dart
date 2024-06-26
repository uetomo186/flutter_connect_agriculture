import 'package:flutter/material.dart';
import 'package:flutter_connect_agriculture/config/constants/colors.dart';
import 'package:intl/intl.dart';

class StreetModalBottomSheet extends StatelessWidget {
  const StreetModalBottomSheet({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.selectedDate,
    required this.modalTitle,
    required this.buttonText,
    required this.onButtonPressed,
    required this.onCancel,
  });
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final ValueNotifier<DateTime> selectedDate;
  final String modalTitle;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    Future<void> selectDate(BuildContext dialogContext) async {
      final picked = await showDatePicker(
        context: dialogContext,
        initialDate: selectedDate.value,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101),
      );
      if (picked != null && picked != selectedDate.value) {
        selectedDate.value = picked;
      }
    }

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  modalTitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: tDarkColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: descriptionController,
                minLines: 3,
                maxLines: 5,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                ),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Deadline',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: tDarkColor,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextButton.icon(
                icon: const Icon(Icons.edit_calendar_rounded),
                label:
                    Text(DateFormat('yyyy-MM-dd').format(selectedDate.value)),
                onPressed: () async {
                  await selectDate(context);
                  setState(() {});
                },
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).primaryColor,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: onCancel,
                    style: TextButton.styleFrom(
                      foregroundColor: tDarkColor,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                    ),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: onButtonPressed,
                    style: TextButton.styleFrom(
                      foregroundColor: tDarkColor,
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                    ),
                    child: Text(buttonText),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
