part of 'services.dart';

class MedicalService {
  CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('medical');

  Future<MedicalHistoryResult> addMedical(
      {required String uid,
      required String description,
      required DateTime checkDate,
      required DateTime inputDate}) async {
    try {
      await _collectionReference.add({
        'uid': uid,
        'description': description,
        'checkDate': checkDate.toString(),
        'inputDate': inputDate.toString(),
      }).then((value) => print(value));
      return MedicalHistoryResult(true);
    } catch (e) {
      print(e.toString());
      return MedicalHistoryResult(false);
    }
  }

  Future<List<MedicalHistoryModel>> fetchMedicalHistory() async {
    try {
      QuerySnapshot result = await _collectionReference.get();
      List<MedicalHistoryModel> medicalHistory = result.docs
          .map((snapshot) => MedicalHistoryModel.fromJson(
              snapshot.data() as Map<String, dynamic>))
          .toList();
      medicalHistory.sort((MedicalHistoryModel a, MedicalHistoryModel b) =>
          b.checkDate.compareTo(a.checkDate));
      return medicalHistory;
    } catch (e) {
      throw e;
    }
  }
}

class MedicalHistoryResult {
  bool? success;

  MedicalHistoryResult(this.success);
}
