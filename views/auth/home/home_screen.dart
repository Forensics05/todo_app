class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskCtrl = Provider.of<TaskController>(context);

    return Scaffold(
      appBar: AppBar(title: Text("My Tasks")),
      body: taskCtrl.tasks.isEmpty
          ? Center(child: Text("No tasks found"))
          : ListView.builder(
              itemCount: taskCtrl.tasks.length,
              itemBuilder: (_, index) =>
                  TaskTile(task: taskCtrl.tasks[index]),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/add'),
        child: Icon(Icons.add),
      ),
    );
  }
}
