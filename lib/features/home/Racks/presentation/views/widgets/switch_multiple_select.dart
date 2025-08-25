import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/widget/custom_loading.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/switch_model/switch_item.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/manager/switch_cubit/switch_cubit.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

class SwitchMultipleSelect extends StatelessWidget {
  const SwitchMultipleSelect({
    super.key,
    required this.selectedSwitchs,
    this.onConfirm,
  });

  final List<SwitchItem> selectedSwitchs;
  final ValueChanged<List<SwitchItem>>? onConfirm;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SwitchCubit()..getAllSwitchs(),
      child: BlocBuilder<SwitchCubit, SwitchState>(
        builder: (context, state) {
          if (state is AllSwitchSuccess) {
            return Padding(
              padding: EdgeInsets.only(bottom: 14.h),
              child: MultiSelectDialogField<SwitchItem>(
                items: state.switchs
                    .map(
                      (switchItem) => MultiSelectItem<SwitchItem>(
                        switchItem,
                        switchItem.name ?? '',
                      ),
                    )
                    .toList(),
                buttonIcon: const Icon(Icons.arrow_drop_down),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                initialValue: selectedSwitchs,
                title: Text('Switch', style: CustomTextStyles.text12MeduimText),
                buttonText: Text(
                  'Switch',
                  style: CustomTextStyles.text12MeduimText,
                ),
                searchable: true,
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  if (onConfirm != null) onConfirm!(values);
                },
                validator: (values) {
                  if (values == null || values.isEmpty) {
                    return 'Please select a switch';
                  }
                  return null;
                },
              ),
            );
          } else if (state is AllSwitchFailure) {
            return Center(child: Text(state.message));
          } else if (state is AllSwitchLoading) {
            return CustomLoading();
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
