import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/ApiScreen/locator.dart';
import 'package:provider/provider.dart';

class ViewModelBuilder<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T value, Widget? child) builder;
  final Function(T)? onModelReady;
  final T? viewModel;
  const ViewModelBuilder(
      {required this.builder, this.onModelReady, this.viewModel});
  @override
  _ViewModelBuilderState<T> createState() => _ViewModelBuilderState<T>();
}

class _ViewModelBuilderState<T extends ChangeNotifier>
    extends State<ViewModelBuilder<T>> {
  T? model;
  @override
  void initState() {
    model = widget.viewModel ?? locator<T>();

    if (widget.onModelReady != null) {
      widget.onModelReady!(model!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.viewModel != null
        ? ChangeNotifierProvider.value(
            value: widget.viewModel,
            child: widget.builder(
              context,
              model!,
              null,
            ),
          )
        : ChangeNotifierProvider<T>(
            create: (context) => model!,
            child: widget.builder(
              context,
              model!,
              null,
            ),
          );
  }
}
