class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _titleCtrl = TextEditingController();
  final _descCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final taskCtrl = Provider.of<TaskController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text("New Task")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          TextField(controller: _titleCtrl, decoration: InputDecoration(labelText: "Title")),
          TextField(controller: _descCtrl, decoration: InputDecoration(labelText: "Description")),
          ElevatedButton(
            child: Text("Add Task"),
            onPressed: () {
              taskCtrl.addTask(Task(
                id: const Uuid().v4(),
                title: _titleCtrl.text,
                description: _descCtrl.text,
                dueDate: DateTime.now().add(Duration(days: 1)),
              ));
              Navigator.pop(context);
            },
          ),
        ]),
      ),
    );
  }
}
