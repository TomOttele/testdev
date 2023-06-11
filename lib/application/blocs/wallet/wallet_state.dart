part of 'wallet_bloc.dart';

@immutable
abstract class WalletState {}

class WalletInitial extends WalletState {}

class WalletLoading extends WalletState {}

class WalletLoaded extends WalletState {}

class WalletError extends WalletState {}

