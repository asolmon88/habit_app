import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_app/config/theme/custom_color.g.dart';
import 'package:habit_app/presentation/widgets.dart';

class TitleText extends StatelessWidget {
  final String title;

  const TitleText({
    super.key,
    this.title = '',
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w300,
        fontFamily: 'Comfortaa',
        fontSize: 18
      ),
    );
  }
}

class EditForm extends StatelessWidget {
  final _keyForm = GlobalKey<FormState>();
  final _newValueController = TextEditingController();
  final void Function(String)? onPressedSave;
  final void Function()? onPressedComplete;
  final String endValue;
  final String currentValue;

  EditForm({
    super.key,
    required this.endValue,
    required this.currentValue,
    required this.onPressedSave,
    required this.onPressedComplete
  });

  String? _validateNewValue(String? value) {
    if (value == null) return 'Cannot save an empty progress';
    if (value == '') return 'Cannot save an empty progress';
    if (int.parse(value) > int.parse(endValue)) { 
      return 'New value more than the end';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).extension<CustomColors>()!;

    return Form(
      key: _keyForm,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFormField(
            label: 'Progress update',
            hintText: '$currentValue/$endValue',
            controller: _newValueController,
            validator: _validateNewValue,
            borderColor: Colors.grey,
            focusedBorderColor: colors.sourceCard ?? Colors.green.shade400,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+')),
            ],
          ),
          const SizedBox(height: 15,),
          ActionButtons(
            onPressedSave: () {
              bool isValid = _keyForm.currentState!.validate();
              if (isValid) {
                onPressedSave!(_newValueController.text);
              }
            },
            onPressedComplete: onPressedComplete,
          )
        ],
      ),
    );
  }
}

class ActionButtons extends StatelessWidget {

  final void Function()? onPressedSave;
  final void Function()? onPressedComplete;

  const ActionButtons({
    super.key,
    required this.onPressedSave,
    required this.onPressedComplete,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: colors.sourceCard
                ),
              )
            ),
            FilledButton(
              onPressed: onPressedSave,
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>
                          (colors.sourceCard ?? Colors.green),
              ),
              child: const Text('Save'),
            ),
          ],
        ),
        FilledButton(
          onPressed: onPressedComplete,
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>
                        (colors.sourceCard ?? Colors.green),
            ),
          child: const Text('Mark as complete'),
        )
      ],
    );
  }
}
