import 'package:http/http.dart' as http;
import 'dart:convert';
import 'data.dart';
import 'detailData.dart';

Future <List<apiQuraan>> getData() async {
  var url = Uri.parse('http://api.alquran.cloud/v1/surah');
  var response = await http.get(url);
  var data = (jsonDecode(response.body)as Map<String,dynamic>)['data'];
  
 if ( response.statusCode == 200) {
   return data.map<apiQuraan>((json) => apiQuraan.fromJson(json)).toList();
 } else {
   throw Exception('Failed to load data');
 }
   
 }
  

Future<List<Ayah>> dataPure(int number) async {
  var url = Uri.parse('http://api.alquran.cloud/v1/surah/$apiQuraan.number');
  var response = await http.get(url);
  var datum = (jsonDecode(response.body) as Map<String, dynamic>)['ayahs'];
  
   if ( response.statusCode == 200) {
   return datum.map<Ayah>((json) => Ayah.fromJson(json)).toList();
 } else {
   throw Exception('Failed to load data');
 }
}
