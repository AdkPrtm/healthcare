part of 'models.dart';

class MedicalHistoryModel extends Equatable {
  final String uid, description;
  final DateTime checkDate, inputDate;

  MedicalHistoryModel({
    required this.uid,
    required this.description,
    required this.checkDate,
    required this.inputDate,
  });

  factory MedicalHistoryModel.fromJson(Map<String, dynamic> json) =>
      MedicalHistoryModel(
        uid: json['uid'],
        description: json['description'],
        checkDate: DateTime.parse(json['checkDate'].toString()),
        inputDate: DateTime.parse(json['inputDate'].toString()),
      );

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'description': description,
      'checkDate': checkDate,
      'inputDate': inputDate,
    };
  }

  @override
  List<Object?> get props => [uid, description, checkDate, inputDate];
}
