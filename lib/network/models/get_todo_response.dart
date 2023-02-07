class GetTodoListResponse {
  List<Todos>? todos;
  int? total;
  int? skip;
  int? limit;

  GetTodoListResponse({this.todos, this.total, this.skip, this.limit});

  GetTodoListResponse.fromJson(Map<String, dynamic> json) {
    todos = json["todos"] == null
        ? null
        : (json["todos"] as List).map((e) => Todos.fromJson(e)).toList();
    total = json["total"];
    skip = json["skip"];
    limit = json["limit"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (todos != null) {
      _data["todos"] = todos?.map((e) => e.toJson()).toList();
    }
    _data["total"] = total;
    _data["skip"] = skip;
    _data["limit"] = limit;
    return _data;
  }

  GetTodoListResponse copyWith({
    List<Todos>? todos,
    int? total,
    int? skip,
    int? limit,
  }) =>
      GetTodoListResponse(
        todos: todos ?? this.todos,
        total: total ?? this.total,
        skip: skip ?? this.skip,
        limit: limit ?? this.limit,
      );
}

class Todos {
  int? id;
  String? todo;
  bool? completed;
  int? userId;

  Todos({this.id, this.todo, this.completed, this.userId});

  Todos.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    todo = json["todo"];
    completed = json["completed"];
    userId = json["userId"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["todo"] = todo;
    _data["completed"] = completed;
    _data["userId"] = userId;
    return _data;
  }

  Todos copyWith({
    int? id,
    String? todo,
    bool? completed,
    int? userId,
  }) =>
      Todos(
        id: id ?? this.id,
        todo: todo ?? this.todo,
        completed: completed ?? this.completed,
        userId: userId ?? this.userId,
      );
}
