import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_app/config/theme/custom_color.g.dart';
import 'package:habit_app/infrastructure/utils.dart';
import 'package:habit_app/presentation/bloc.dart';
import 'package:habit_app/presentation/widgets.dart';

class AddHabitScreen extends StatelessWidget {
  final String habitType;

  final _keyForm = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _currentValueController = TextEditingController();
  final _endValueController = TextEditingController();
  final _metricController = TextEditingController();

  AddHabitScreen({
    super.key,
    this.habitType = 'daily_habits',
  });

  int currentValue(String text) {
    return _currentValueController.text == '' ?
      0 : int.parse(_currentValueController.text);
  }

  String? _validateEndValue(String? value) {
    if (value == null) return 'End value cannot be empty';
    if (
      currentValue(_currentValueController.text) >
      int.parse(_endValueController.text)
    ) return 'End value cannot be less than the Start';
    return null;
  }

  void _clearForm() {
    _nameController.clear();
    _currentValueController.clear();
    _endValueController.clear();
    _metricController.clear();
  }

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).extension<CustomColors>()!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new habit'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Form(
            key: _keyForm,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              children: [
                const SizedBox(height: 15,),
                CustomTextFormField(
                  label: 'Name',
                  hintText: 'New Habit',
                  controller: _nameController,
                  validator: validateName,
                  borderColor: Colors.grey,
                  focusedBorderColor: colors.sourceCard ?? Colors.green.shade400,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z\s]+')),
                  ],
                ),
                const SizedBox(height: 15,),
                CustomTextFormField(
                  label: 'Start value (if left empty, will be 0)',
                  hintText: '0',
                  controller: _currentValueController,
                  validator: validateCurrentValue,
                  borderColor: Colors.grey,
                  focusedBorderColor: colors.sourceCard ?? Colors.green.shade400,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+')),
                  ],
                ),
                const SizedBox(height: 15,),
                CustomTextFormField(
                  label: 'End Value',
                  hintText: '30',
                  controller: _endValueController,
                  validator: _validateEndValue,
                  borderColor: Colors.grey,
                  focusedBorderColor: colors.sourceCard ?? Colors.green.shade400,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+')),
                  ],
                ),
                const SizedBox(height: 15,),
                CustomTextFormField(
                  label: 'Metric',
                  hintText: 'min',
                  controller: _metricController,
                  validator: validateMetric,
                  borderColor: Colors.grey,
                  focusedBorderColor: colors.sourceCard ?? Colors.green.shade400,
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton(
                      onPressed: (){
                        bool isValid = _keyForm.currentState!.validate();
                        if (isValid) {
                          context.read<HabitsCubit>().addHabit(
                            context.read<AuthCubit>().state.email,
                            habitType,
                            _nameController.text.trim(),
                            currentValue(_currentValueController.text)
                              .toString(),
                            _endValueController.text.trim(),
                            _metricController.text,
                            false
                          );
                          _clearForm();
                          context.pop();
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>
                          (colors.sourceCard ?? Colors.green),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal:20,
                          vertical:12
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.save,
                              color: colors.sourceBackground,
                            ),
                            const SizedBox(width:10,),
                            Text(
                              "Guardar",
                              style: TextStyle(
                                color: colors.sourceBackground
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )
      ,
    );
  }
}
