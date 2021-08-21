import 'package:get/get.dart';
import 'package:getx_supabase/app/modules/home/controllers/home_controller.dart';
import 'package:supabase/supabase.dart';

import '../models/employee_model.dart';

class EmployeeProvider extends GetConnect {
  HomeController homeController = Get.find<HomeController>();

  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Employee.fromJson(map);
      if (map is List)
        return map.map((item) => Employee.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<List<Employee>> getEmployees() async {
    var request = await homeController.supabase_client
        .from('employee')
        .select('*')
        .order('note', ascending: false)
        .execute(count: CountOption.exact);
    if (request.error == null) {
      var dataList = request.data as List;
      return dataList.map((e) => Employee.fromJson(e)).toList();
    } else {
      return Future.error(request.error.toString());
    }
  }

  Future<Employee?> getEmployee(int id) async {
    final response = await get('employee/$id');
    return response.body;
  }

  Future<Response<Employee>> postEmployee(Employee employee) async =>
      await post('employee', employee);
  Future<Response> deleteEmployee(int id) async => await delete('employee/$id');
}
