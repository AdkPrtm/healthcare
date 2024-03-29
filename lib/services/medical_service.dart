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
      });
      return MedicalHistoryResult(true);
    } catch (e) {
      return MedicalHistoryResult(false);
    }
  }

  Future<List<MedicalHistoryModel>> fetchMedicalHistory(String uid) async {
    try {
      QuerySnapshot result = await _collectionReference.where('uid', isEqualTo: uid).get();
      List<MedicalHistoryModel> medicalHistory = result.docs
          .map((snapshot) => MedicalHistoryModel.fromJson(
              snapshot.data() as Map<String, dynamic>))
          .toList();
      medicalHistory.sort((MedicalHistoryModel a, MedicalHistoryModel b) =>
          b.checkDate.compareTo(a.checkDate));
      return medicalHistory;
    } catch (e) {
      List<MedicalHistoryModel> list = [];
      return list;
    }
  }
}

class MedicalHistoryResult {
  bool? success;

  MedicalHistoryResult(this.success);
}
