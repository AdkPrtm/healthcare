part of 'medicalhistory_bloc.dart';

abstract class MedicalhistoryEvent extends Equatable {
  const MedicalhistoryEvent();
}

class FetchMedicalHistory extends MedicalhistoryEvent {
  @override
  List<Object?> get props => [];
}

class AddMedicalHistory extends MedicalhistoryEvent {
  final String uid, description;
  final DateTime checkDate, inputDate;

  AddMedicalHistory({required this.uid, required this.description, required this.checkDate, required this.inputDate});
  @override
  List<Object?> get props => [uid, description, checkDate, inputDate];
}
