import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:healthcare/models/models.dart';
import 'package:healthcare/services/services.dart';

part 'medicalhistory_event.dart';
part 'medicalhistory_state.dart';

class MedicalhistoryBloc
    extends Bloc<MedicalhistoryEvent, MedicalhistoryState> {
  MedicalhistoryBloc() : super(MedicalhistoryInitial());

  @override
  Stream<MedicalhistoryState> mapEventToState(
    MedicalhistoryEvent event,
  ) async* {
    if (event is FetchMedicalHistory) {
      yield MedicalhistoryLoading();
      List<MedicalHistoryModel> medicalHistory =
          await MedicalService().fetchMedicalHistory(event.uid);
      if (medicalHistory.isNotEmpty) {
        yield MedicalhistorySuccess(medicalHistoryModel: medicalHistory);
      } else {
        yield MedicalhistorySuccess(medicalHistoryModel: []);
      }
    } else if (event is AddMedicalHistory) {
      yield MedicalhistoryLoading();
      await MedicalService().addMedical(
          uid: event.uid,
          description: event.description,
          checkDate: event.checkDate,
          inputDate: event.inputDate);
      yield MedicalhistorySuccess(medicalHistoryModel: []);
    }
  }
}
