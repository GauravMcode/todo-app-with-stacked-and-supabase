import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_stacked/app/app.locator.dart';
import 'package:todo_stacked/models/task.dart';
import 'package:todo_stacked/services/supabase_service.dart';
import 'package:todo_stacked/ui/views/home/home_viewmodel.dart';
import 'package:todo_stacked/ui/views/task/task_view.form.dart';

class TaskViewModel extends FormViewModel {
  final _supabaseService = locator<SupabaseService>();
  final _navigationService = locator<NavigationService>();

  Task _task = Task(name: "", description: "");
  Task get getTask => _task;

  void setTask(Task task) => {_task = task};

  //call editTask of Suprabase Service class
  addTask() async {
    _task.name = nameValue ?? "";
    _task.description = descriptionValue ?? "";
    await _supabaseService.addTask(_task);
    _navigationService.back();
  }

  //call editTask of Suprabase Service class
  updateTask() async {
    _task.name = nameValue ?? "";
    _task.description = descriptionValue ?? "";
    await _supabaseService.editTask(_task);
    _navigationService.back();
  }
}
