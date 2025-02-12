import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:templater/app/model/company/company_response.dart';

class CompanyRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<CompanyResponse> getCompanyByName(String name) async {
    QuerySnapshot snap = await _firestore
        .collection('company')
        .where('name', isEqualTo: name)
        .limit(1)
        .get();

    return CompanyResponse.fromJson(
        snap.docs.first.data() as Map<String, dynamic>);
  }
}
