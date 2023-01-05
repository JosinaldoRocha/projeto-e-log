import 'package:e_log_social/app/modules/refer-and-win/dependencies/dependencies.dart';
import 'package:e_log_social/app/modules/refer-and-win/views/states/indications_state.dart';
import 'package:e_log_social/app/modules/refer-and-win/widgets/context_share_link_widget.dart';
import 'package:e_log_social/app/modules/refer-and-win/widgets/success_indication_widget.dart';
import 'package:e_log_social/app/modules/widgets/texts/box_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IsSubscribedWidget extends ConsumerStatefulWidget {
  const IsSubscribedWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _IsSubscribedWidgetState();
}

class _IsSubscribedWidgetState extends ConsumerState<IsSubscribedWidget> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(indicationsState.notifier).load());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ContextShareLinkWidget(),
            const SizedBox(height: 23),
            Expanded(
              child: _buildCheckState(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCheckState() {
    final state = ref.watch(indicationsState);
    if (state is LoadingIndicationsState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is FailureIndicationsState) {
      return AlertDialog(
        title: const Text('ERRO:'),
        content: Text(state.errorMessage),
      );
    } else if (state is SuccessIndicationsState) {
      return _buildListViewContext(state);
    } else {
      return const SizedBox(
        child: Center(
          child: Text('Estado não inicializado'),
        ),
      );
    }
  }

  Widget _buildListViewContext(SuccessIndicationsState state) {
    return Container(
      color: const Color.fromRGBO(255, 255, 255, 1),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          21,
          15,
          21,
          0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BoxText.bodyBold('Suas indicações'),
            const SizedBox(height: 35),
            Flexible(
              child: ListView.separated(
                itemBuilder: (context, index) => ListTile(
                  leading: Image.asset(state.listData[index].image),
                  title: BoxText.body(state.listData[index].name),
                  subtitle: BoxText.body(state.listData[index].day),
                  trailing: SuccessIndicationWidget(index: index, state: state),
                ),
                separatorBuilder: (context, index) => const SizedBox(height: 5),
                itemCount: state.listData.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
