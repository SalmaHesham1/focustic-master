abstract class TasksStates{}

class TasksInitState extends TasksStates{}

class TasksChangeTasksListState extends TasksStates{}

class TasksChangeBodyState extends TasksStates{}

class TasksAllTasksLoadingState extends TasksStates{}

class TasksAllTasksSuccessState extends TasksStates{}

class TasksAllTasksFailState extends TasksStates{
  String? error;
  TasksAllTasksFailState(this.error);
}

class TasksUpdateTaskLoadingState extends TasksStates{}

class TasksUpdateTaskSuccessState extends TasksStates{}

class TasksUpdateTaskFailState extends TasksStates{
  String? error;
  TasksUpdateTaskFailState(this.error);
}

class TasksDeleteTaskLoadingState extends TasksStates{}

class TasksDeleteTaskSuccessState extends TasksStates{}

class TasksDeleteTaskFailState extends TasksStates{
  String? error;
  TasksDeleteTaskFailState(this.error);
}

class TasksDatePickerState extends TasksStates{}

class TasksDurationState extends TasksStates{}

class TasksSelectedItemState extends TasksStates{}

class TasksSelectedItemKindState extends TasksStates{}

class ChangeEditTaskIdState extends TasksStates{}
