import "package:aroma_mobile/presentation/bloc/recipes/recipes_bloc.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_event.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_state.dart";
import "package:aroma_mobile/presentation/util/extension/build_content_extensions.dart";
import "package:aroma_mobile/presentation/widget/common/aroma_settings_button.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:j1_core_base/j1_core_base.dart";

class RecipesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RecipesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.strings();
    final colorScheme = context.colorScheme();

    return BlocSelector<RecipesBloc, RecipesState, int>(
      selector: (state) => state.selectedIds.length,
      builder: (_, numSelected) {
        final isSelecting = numSelected > 0;
        final trailingActions = !isSelecting
            ? [const AromaSettingsButton()]
            : [const _RecipesDeleteButton(), const _RecipesCancelSelectionButton()];

        return JAppBar(
          dimens: JAppBarDimens.medium.copyWith(
            actionSpacing: isSelecting ? JDimens.size_0 : JDimens.spacing_s,
          ),
          title: isSelecting ? numSelected.toString() : strings.app_title,
          titleStyle: context.textTheme().headlineLarge?.copyWith(
            color: isSelecting ? colorScheme.onTertiary : null,
          ),
          backgroundColor: isSelecting ? colorScheme.tertiary : null,
          trailingActions: trailingActions,
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(JAppBarDimens.medium.height);
}

class _RecipesDeleteButton extends StatelessWidget {
  const _RecipesDeleteButton();

  @override
  Widget build(BuildContext context) {
    return JIconButton(
      icon: JamIcons.trash,
      type: JButtonType.flat,
      overrides: JIconButtonOverrides(iconColor: context.colorScheme().onTertiary),
      onPressed: () => _confirmDeleteNotes(context, context.read<RecipesBloc>()),
    );
  }
}

// TODO: Handle delete.
Future<void> _confirmDeleteNotes(BuildContext context, RecipesBloc bloc) async {
  final strings = context.strings();

  showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: context.colorScheme().onSurface,
          width: J1Config.strokeWidth,
        ),
        borderRadius: BorderRadius.circular(JDimens.radius_l),
      ),
      contentPadding: EdgeInsets.fromLTRB(JDimens.spacing_l, JDimens.spacing_l, JDimens.spacing_l, JDimens.size_0),
      actionsPadding: EdgeInsets.all(JDimens.spacing_l),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      content: Text(strings.recipes_delete_confirmText),
      actions: [
        JTextButton(
          text: strings.common_cancel,
          size: JWidgetSize.small,
          color: JWidgetColor.onSurface,
          forceCaps: false,
          type: JButtonType.flat,
          overrides: JTextButtonOverrides(outlineColor: context.colorScheme().onSurface),
          onPressed: () => context.pop(),
        ),
        JTextButton(
          text: strings.common_confirm,
          size: JWidgetSize.small,
          forceCaps: false,
          onPressed: () {
            bloc.add(const RecipesEventDeleteSelected());
            context.pop();
          },
        ),
      ],
    ),
  );
}

class _RecipesCancelSelectionButton extends StatelessWidget {
  const _RecipesCancelSelectionButton();

  @override
  Widget build(BuildContext context) {
    return JIconButton(
      icon: JamIcons.close,
      type: JButtonType.flat,
      overrides: JIconButtonOverrides(iconColor: context.colorScheme().onTertiary),
      onPressed: () => context.read<RecipesBloc>().add(const RecipesEventResetSelected()),
    );
  }
}
