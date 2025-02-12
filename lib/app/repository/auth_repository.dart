import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:templater/app/service/analytics_service.dart';

class AuthRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> checkPasscode(String passcode) async {
    try {
      QuerySnapshot? snap = await _firestore
          .collection('company')
          .where('passcode', arrayContains: passcode)
          .limit(1)
          .get();

      debugPrint('checkPasscode snap: ${snap.docs}');

      if (snap.docs.isNotEmpty) {
        Get.find<AnalyticsService>().logEvent(
            event: 'auth', data: {'passcode': passcode, 'response': 'success'});
        return 'success';
      } else {
        Get.find<AnalyticsService>().logEvent(
            event: 'auth',
            data: {'passcode': passcode, 'response': 'wrong-passcode'});
        return 'Wrong passcode!';
      }
    } catch (e) {
      debugPrint('checkPasscode() error: $e');
      return 'Server error';
    }
  }
}
