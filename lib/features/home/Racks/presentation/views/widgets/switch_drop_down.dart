import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/func/border_text_field.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/widget/custom_loading.dart';
import 'package:flutter_application_1/features/home/Racks/data/models/switch_model/switch_item.dart';
import 'package:flutter_application_1/features/home/Racks/presentation/manager/switch_cubit/switch_cubit.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwitchDropDown extends StatelessWidget {
  const SwitchDropDown({super.key, this.value, this.onChanged});

  final SwitchItem? value;
  final ValueChanged<SwitchItem?>? onChanged;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SwitchCubit()..getAllSwitchs(),
      child: BlocBuilder<SwitchCubit, SwitchState>(
        builder: (context, state) {
          if (state is AllSwitchSuccess) {
            final switchs = state.switchs;
            if (switchs.isEmpty) {
              return const SizedBox.shrink();
            }
            return Padding(
              padding: EdgeInsets.only(bottom: 14.h),
              child: DropdownSearch<SwitchItem>(
                selectedItem: value,
                compareFn: (item, selected) => item.id == selected.id,
                items: (filter, _) {
                  if (filter.isEmpty) return switchs;
                  return switchs
                      .where(
                        (loc) => (loc.name ?? '').toLowerCase().contains(
                          filter.toLowerCase(),
                        ),
                      )
                      .toList();
                },
                itemAsString: (item) => item.name ?? '',
                decoratorProps: DropDownDecoratorProps(
                  decoration: InputDecoration(
                    labelText: 'Switch',
                    border: borderTextField(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelStyle: CustomTextStyles.text14W500Primary,
                  ),
                ),
                popupProps: PopupProps.menu(
                  showSearchBox: true,
                  fit: FlexFit.loose,
                  searchFieldProps: TextFieldProps(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      enabled: true,
                      border: borderTextField(),
                      enabledBorder: borderTextField(),
                      focusedBorder: borderTextField(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                    ),
                  ),
                  constraints: BoxConstraints(),
                  menuProps: MenuProps(
                    backgroundColor: AppColors.scaffoldBackgroundColor,
                    elevation: 4,
                    shadowColor: Colors.black54,
                  ),
                ),
                onChanged: onChanged,
                validator: (value) =>
                    value == null ? 'Please select a switch' : null,
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
