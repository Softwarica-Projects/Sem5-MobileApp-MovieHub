// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviehub/dependency_inject.dart';

class BlocProviderView<T extends StateStreamableSource<Object?>> extends StatelessWidget {
  final Widget child;
  final T Function()? objLocator;
  const BlocProviderView({
    super.key,
    required this.child,
    this.objLocator,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<T>(create: (_) => objLocator != null ? objLocator!() : locator<T>(), child: child);
  }
}
