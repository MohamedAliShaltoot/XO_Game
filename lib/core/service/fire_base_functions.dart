import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xo_game/core/models/task_model.dart';

class FireBaseFunctions {
  static FirebaseFirestore firebaseStore = FirebaseFirestore.instance;

  static CollectionReference<TaskModel> mainFunction() {
  return  firebaseStore.collection('Tasks').withConverter(
      fromFirestore: (snapshot, options) {
        final data = snapshot.data();
        return TaskModel.fromJson(data!);
        
      },
      toFirestore: (task, options) {
        return task.toJson();
      },
    );
  }

static Future<void> addTask(TaskModel task) async {

  var taskCollection = mainFunction();
  var taskDoc =taskCollection.doc();
  task.id = taskDoc.id; 
 return await taskDoc.set(task);
  
}

}
