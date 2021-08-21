import 'package:get/get.dart';
import 'package:getx_supabase/app/data/models/employee_model.dart';
import 'package:getx_supabase/app/data/providers/employee_provider.dart';
import 'package:supabase/supabase.dart';

class HomeController extends GetxController with StateMixin<List<Employee>> {
  static const supabaseUrl = 'https://vegdoanlxklpbvutmiij.supabase.co';
  static const supabaseKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYyOTU0NjkyOSwiZXhwIjoxOTQ1MTIyOTI5fQ.9HQP76mHV-JrCo9KH3I-HeM27kGk-yK1UZYddPtWzp0';
  final supabase_client = SupabaseClient(supabaseUrl, supabaseKey);

  List<Employee> employees = [];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    supabase_client.from('employee').on(SupabaseEventTypes.all, (payload) {
      switch (payload.eventType) {
        case 'INSERT':
          Employee newEmployee = Employee.fromJson(payload.newRecord!);
          this.employees.add(newEmployee);
          break;
        case 'UPDATE':
          var updatedEmployee = Employee.fromJson(payload.newRecord!);
          this.employees.removeWhere((e) => e.id == updatedEmployee.id);
          this.employees.add(updatedEmployee);
          break;
        case 'DELETE':
          var deletedEmployee = Employee.fromJson(payload.oldRecord!);
          var deletedIdx =
              this.employees.indexWhere((e) => e.id == deletedEmployee.id);
          if (deletedIdx > -1) this.employees.removeAt(deletedIdx);
          break;
        default:
      }

      append(() => () => Future.value(this.employees));
    }).subscribe();

    EmployeeProvider().getEmployees().then((resp) {
      this.employees = resp;
      change(resp, status: RxStatus.success());
    }, onError: (err) => RxStatus.error(err));

    print(
        "User from home controller on ready ++++++++++++++++++++++++++++ ${supabase_client.auth.currentUser}");
  }

  @override
  void onClose() {}
}
