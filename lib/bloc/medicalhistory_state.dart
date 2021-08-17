part of 'medicalhistory_bloc.dart';

abstract class MedicalhistoryState extends Equatable {
  const MedicalhistoryState();
}

class MedicalhistoryInitial extends MedicalhistoryState {
  @override
  List<Object?> get props => [];
}

class MedicalhistoryLoading extends MedicalhistoryState {
  @override
  List<Object?> get props => [];
}

class MedicalhistoryFailed extends MedicalhistoryState {
  final String? msg;
  MedicalhistoryFailed(this.msg);
  @override
  List<Object?> get props => [msg];
}

class MedicalhistorySuccess extends MedicalhistoryState {
  final List<MedicalHistoryModel> medicalHistoryModel;
  MedicalhistorySuccess({required this.medicalHistoryModel});
  @override
  List<Object?> get props => [medicalHistoryModel];
}
