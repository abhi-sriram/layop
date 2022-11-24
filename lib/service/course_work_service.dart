import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:layop/models/course_model.dart';
import 'package:layop/service/auth_service.dart';

class CourseWorkService {
  static final FirebaseFirestore _firebaseFirestoreInstance =
      FirebaseFirestore.instance;

  static Future<void> createCourseWork(
      {required CourseModel courseModel}) async {
    String uid = AuthService.uid;
    return await _firebaseFirestoreInstance
        .collection('course-work')
        .doc(uid)
        .set({'course': courseModel});
  }

  static Future<void> updateCourseWork(
      {required CourseModel courseModel}) async {
    String uid = AuthService.uid;
    return await _firebaseFirestoreInstance
        .collection('course-work')
        .doc(uid)
        .update({'course': courseModel});
  }

  static Future<DocumentSnapshot<Map<String, dynamic>>> readCourseWork()async{
    String uid = AuthService.uid;
    return await _firebaseFirestoreInstance.collection('course-work')
        .doc(uid).get();
  }
}
