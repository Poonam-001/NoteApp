import 'package:flutter/material.dart';

class TitleDescription extends StatelessWidget {
  const TitleDescription(
      {super.key,
      required this.titleController,
      required this.descriptionController});
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextFormField(
            keyboardType: TextInputType.text,
            controller: titleController,
            decoration: const InputDecoration(
                hintText: 'Title',
                hintStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10)),
            onChanged: (String value) {},
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextFormField(
            maxLines: null,
            keyboardType: TextInputType.text,
            controller: descriptionController,
            decoration: const InputDecoration(
                hintText: 'Description',
                contentPadding: EdgeInsets.symmetric(vertical: 10)),
            onChanged: (String value) {},
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
