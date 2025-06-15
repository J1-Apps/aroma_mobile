import "package:aroma_mobile/presentation/bloc/recipes/recipes_bloc.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_event.dart";
import "package:aroma_mobile/presentation/bloc/recipes/recipes_state.dart";
import "package:aroma_mobile/presentation/util/extension/build_content_extensions.dart";
import "package:aroma_mobile/presentation/widget/common/aroma_settings_button.dart";
import "package:aroma_mobile/presentation/widget/screen/home/recipes/recipes_content.dart";
import "package:aroma_mobile/presentation/widget/screen/home/recipes/recipes_filter.dart";
import "package:aroma_mobile/presentation/widget/screen/home/recipes/recipes_placeholder.dart";
import "package:aroma_mobile/presentation/widget/screen/home/recipes/recipes_search.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:j1_core_base/j1_core_base.dart";

const _listRestorationId = "recipes_list";
const _scrollToTopDuration = Duration(milliseconds: 250);

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.strings();

    return ScaffoldMessenger(
      child: Scaffold(
        appBar: JAppBar(
          title: strings.app_title,
          titleStyle: context.textTheme().headlineLarge,
          trailingActions: [const AromaSettingsButton()],
        ),
        body: const _RecipesList(),
      ),
    );
  }
}

class _RecipesList extends StatefulWidget {
  const _RecipesList();

  @override
  State<_RecipesList> createState() => _RecipesListState();
}

class _RecipesListState extends State<_RecipesList> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecipesBloc, RecipesState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == RecipesStatus.loading) {
          _scrollController.animateTo(0, duration: _scrollToTopDuration, curve: Curves.easeInOut);
        }
      },
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (_, state) => NestedScrollView(
        controller: _scrollController,
        restorationId: _listRestorationId,
        floatHeaderSlivers: true,
        physics: state.status == RecipesStatus.success ? null : const NeverScrollableScrollPhysics(),
        headerSliverBuilder: (_, _) => [const SliverFloatingHeader(child: _RecipesHeader())],
        body: RefreshIndicator(
          onRefresh: () async => _refresh(context),
          child: _RecipesContentSelector(status: state.status),
        ),
      ),
    );
  }

  Future<void> _refresh(BuildContext context) async {
    final bloc = context.read<RecipesBloc>();
    final load = bloc.stream.firstWhere((state) => state.status != RecipesStatus.loading);
    bloc.add(const RecipesEventLoad());
    await load;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class _RecipesHeader extends StatelessWidget {
  const _RecipesHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme().surface,
      padding: const EdgeInsets.symmetric(
        horizontal: JDimens.spacing_m,
        vertical: JDimens.spacing_xxs,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const RecipesSearch(),
          const RecipesFilter(),
        ],
      ),
    );
  }
}

class _RecipesContentSelector extends StatelessWidget {
  final RecipesStatus status;

  const _RecipesContentSelector({required this.status});

  @override
  Widget build(BuildContext context) {
    return switch (status) {
      RecipesStatus.loading => const RecipesPlaceholder(),
      RecipesStatus.empty => const _RecipesEmpty(),
      RecipesStatus.error => const _RecipesError(),
      RecipesStatus.success => const RecipesContent(),
    };
  }
}

class _RecipesError extends StatelessWidget {
  const _RecipesError();

  @override
  Widget build(BuildContext context) {
    final strings = context.strings();

    return Padding(
      padding: const EdgeInsets.all(JDimens.spacing_xl),
      child: Center(
        child: JErrorMessage(
          message: strings.recipes_loadError,
          cta: strings.recipes_loadErrorRefresh,
          ctaAction: () => context.read<RecipesBloc>().add(const RecipesEventLoad()),
        ),
      ),
    );
  }
}

class _RecipesEmpty extends StatelessWidget {
  const _RecipesEmpty();

  @override
  Widget build(BuildContext context) {
    final strings = context.strings();

    return Padding(
      padding: const EdgeInsets.all(JDimens.spacing_xl),
      child: Center(
        child: JErrorMessage(
          message: strings.recipes_loadEmpty,
          cta: strings.recipes_loadEmptyCreate,
          // TODO: Navigate to create recipe screen.
          ctaAction: () => context.showJToastWithText(text: "Create recipe.", hasClose: true),
        ),
      ),
    );
  }
}
