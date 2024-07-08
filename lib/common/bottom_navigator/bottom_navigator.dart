import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../Util/Constant/colors.dart';
import '../../Util/Constant/sizes.dart';
import '../../blocs/one_note/one_note_bloc.dart';
import '../../core/routes/routes.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OneNoteBloc, OneNoteState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(bottom: ViSizes.sm, top: ViSizes.sm),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildIconButton(
                icon: Iconsax.home,
                isSelected: state is TabChangedState && state.tabIndex == 0,
                onTap: () {
                  context.read<OneNoteBloc>().add(const ChangeTab(0));
                },
              ),
              _buildIconButton(
                icon: Iconsax.search_normal,
                isSelected: state is TabChangedState && state.tabIndex == 1,
                onTap: () {
                  context.read<OneNoteBloc>().add(const ChangeTab(1));
                },
              ),
              SizedBox(
                height: 56.0,
                width: 56.0,
                child: FloatingActionButton(
                  shape: const CircleBorder(),
                  onPressed: () => context.push(Routes.create_task),
                  backgroundColor: AppColors.primary,
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ),
              _buildIconButton(
                icon: Iconsax.clipboard_tick,
                isSelected: state is TabChangedState && state.tabIndex == 2,
                onTap: () {
                  context.read<OneNoteBloc>().add(const ChangeTab(2));
                },
              ),
              _buildIconButton(
                icon: Iconsax.user,
                isSelected: state is TabChangedState && state.tabIndex == 3,
                onTap: () {
                  context.read<OneNoteBloc>().add(const ChangeTab(3));
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return IconButton(
      icon: Icon(icon),
      color: isSelected ? AppColors.primary : AppColors.black,
      onPressed: onTap,
    );
  }
}
