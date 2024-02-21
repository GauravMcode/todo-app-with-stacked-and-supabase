import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:todo_stacked/models/task.dart';
import 'package:todo_stacked/ui/common/app_colors.dart';
import 'package:todo_stacked/ui/common/ui_helpers.dart';
import 'package:todo_stacked/ui/views/task/task_view.form.dart';

import 'task_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'name'),
  FormTextField(name: 'description'),
])
class TaskView extends StackedView<TaskViewModel> with $TaskView {
  const TaskView({Key? key, this.task}) : super(key: key);
  final Task? task;

  @override
  Widget builder(
    BuildContext context,
    TaskViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: AppBar(
        title: Text(task == null ? "Create a Task" : "Edit your Task"),
        backgroundColor: kcAppBarColor,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DecoratedBox(
              decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
              child: TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: "Task name",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
            ),
            verticalSpaceMedium,
            DecoratedBox(
              decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
              child: TextFormField(
                controller: descriptionController,
                maxLines: 10,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(hintText: "Description", border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
            ),
            verticalSpaceMedium,
            SizedBox(
              width: 100,
              height: 50,
              child: task != null ? ElevatedButton(onPressed: viewModel.updateTask, child: const Text("Update")) : ElevatedButton(onPressed: viewModel.addTask, child: const Text("add")),
            )
          ],
        ),
      ),
    );
  }

  @override
  void onViewModelReady(TaskViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    if (task != null) {
      nameController.text = task?.name ?? "";
      descriptionController.text = task?.description ?? "";
      viewModel.setTask(task!);
    }
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(TaskViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  TaskViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TaskViewModel();
}
