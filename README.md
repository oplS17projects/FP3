# FP3: Final Project Assignment 3: Exploration 2
## racket/gui
My name: Cassandra Cooper

For this exploration, I created a basic gui for the JSON task manager I previously created.
The gui is composed of two main frames - one that lists function buttons (add task and clear) and one that lists current tasks.
The clear button will remove all tasks from the JSON and update the UI.
The add add task button will launch a dialog with a pair of text boxes (one for task name, one for due date). The code to create this dialog is below. Other buttons are implimented similarly, though in the global environment.


```
(define (launchAddTaskDialog)
  (begin
    (define addTaskDialog (instantiate dialog% ("Add Task"))) ; main dialog object
    (define nameBox (new text-field% ; text field for task name
         [parent addTaskDialog]
         [label "Task Name"]))
    (define dueBox (new text-field% ; text field for task due date
         [parent addTaskDialog]
         [label "Due Date"]))
    (define buttonPanel (new horizontal-panel% ; panel to hold buttons
                             [parent addTaskDialog]
                             [alignment '(center center)]))
    (new button% ; button to add task
         [parent buttonPanel]
         [label "Add Task"]
         [callback (lambda (button event)
                     (begin
                       (addTask
                        (send nameBox get-value)
                        (send dueBox get-value))
                       (listTasks)
                       (send addTaskDialog show #f)))])
    (new button% ; button to cancel operation
         [parent buttonPanel]
         [label "Cancel"]
         [callback (lambda (button event)
                     (send addTaskDialog show #f))])
    (send addTaskDialog show #t)))
```

Sample UI screenshots:

![Main UI](/UI_sample.png?raw=true "Main UI")
![Add Task Dialog](/addTaskBox.png?raw=true "Add Task Dialog")