import 'package:flutter/material.dart';
import 'package:habit_app/config/theme/custom_color.g.dart';
import 'package:habit_app/presentation/widgets.dart';

class AddModifyHabitScreen extends StatelessWidget {

  final keyForm = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _currentValueController = TextEditingController();
  final _endValueController = TextEditingController();
  final _metricController = TextEditingController();

  AddModifyHabitScreen({
    super.key,
  });

  String? _validateName(String? value) {
    if (value == null) return 'Name cannot be empty';
    if (value.length > 20) return 'Name has to be 20 characters or less';
    return null;
  }

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).extension<CustomColors>()!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new habit'),
      ),
      body: Form(
        key: keyForm,
        child: Column(
          children: [
            CustomTextFormField(
              label: 'Name',
              hintText: 'New Habit',
              errorText: 'Name not valid',
              controller: _nameController,
              validator: _validateName,
              borderColor: Colors.grey,
              focusedBorderColor: colors.sourceCard ?? Colors.green.shade400,
            ),
            CustomTextFormField(
              label: 'Start value (if left empty, will be 0)',
              hintText: '0',
              controller: _currentValueController,
              validator: _validateCurrentValue,
              borderColor: Colors.grey,
              focusedBorderColor: colors.sourceCard ?? Colors.green.shade400,
            ),
            CustomTextFormField(
              label: 'End Value',
              hintText: '30',
              errorText: 'Number not accepted',
              controller: _endValueController,
              validator: _validateEndValue,
              borderColor: Colors.grey,
              focusedBorderColor: colors.sourceCard ?? Colors.green.shade400,
            ),
            CustomTextFormField(
              label: 'Metric',
              hintText: 'min',
              errorText: 'Metric not valid',
              controller: _metricController,
              validator: _validateMetric,
              borderColor: Colors.grey,
              focusedBorderColor: colors.sourceCard ?? Colors.green.shade400,
            ),
          ],
        ),
      )
      ,
    );
  }
}
