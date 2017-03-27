#lang racket

(require racket/gui)
(require json)

; file path to store json data in
(define taskFile "tasks")

; read the task list from the json file
(define (readTaskList)
  (call-with-input-file taskFile read-json))

; Display the entire task list
(define (displayTasks)
  (define (iter list)
    (if (null? list)
        (void)
        (begin
          (writeTaskObject (car list))
          (iter (cdr list)))))
  (iter (hash-ref (readTaskList) 'tasks)))

; Display a single Task object
(define (writeTaskObject Task)
  (begin
    (write "Task: ")
    (write (hash-ref Task 'name))
    (write ", Due: ")
    (writeln (hash-ref Task 'due))))

; Create a new task object
(define (makeTask name due)
  (make-immutable-hasheq
   (list
    (cons 'name name)
    (cons 'due due))))

; Create a new task list object
(define (makeTaskList taskPairs)
  (make-immutable-hasheq
   (list
    (cons
     'tasks
     taskPairs))))

; Create a new task with specified name and date and add it to the task list. Write result in json file.
(define (addTask name due)
  (let ([taskList (readTaskList)]
        [out (open-output-file taskFile #:exists 'truncate)])
    (begin
      (write-json
       (makeTaskList
        (cons ; add new task to list of existing tasks
         (makeTask name due)
         (hash-ref taskList 'tasks)))
       out)
      (close-output-port out))))     

; Create a new task list to override the existing one in json file
(define (overrideTaskList taskPairs)
  (let ([out (open-output-file taskFile #:exists 'truncate)])
    (begin
      (write-json (makeTaskList taskPairs) out)
      (close-output-port out))))


;; GUI code

; main window
(define frame (new frame%
                   [label "Task Manager"]
                   [width 500]
                   [height 500]))

; horizontal panel to split interaction buttons and task list
(define panel (new horizontal-panel% [parent frame]))

; vertical panel for interaction buttons
(define functions (new vertical-panel%
                       [parent panel]))
;vertical panel for task list
(define tasks (new vertical-panel%
                   [parent panel]))

;clears all tasks from the panel (this does not delete them)
(define (clearTaskPanel)
  (send tasks change-children (lambda (l) '())))

; add a single task to the task display panel
(define (displaySingleTask task)
  (new message%
       [parent tasks]
       [label (string-append "Task: " (hash-ref task 'name) " Due: " (hash-ref task 'due))]))

;Add all current tasks to the task display panel
(define (listTasks)
  (define (iter list)
    (if (null? list)
        (void)
        (begin
          (displaySingleTask (car list))
          (iter (cdr list)))))
  (begin
    (clearTaskPanel) 
    (iter (hash-ref (readTaskList) 'tasks))))

;function that adds all interaction buttons to the interactions panel
(define (draw-buttons)
  (begin
    (new button% ; Button to add a task
         [parent functions]
         [label "Add Task"]
         [callback (lambda (button event)
                     (launchAddTaskDialog))])
    (new button% ; Button to clear all tasks
         [parent functions]
         [label "Clear Tasks"]
         [callback (lambda (button event)
                     (begin
                       (overrideTaskList '())
                       (clearTaskPanel)))])))

; Launch the dialog box to add a task
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

;function to launch the gui
(define (start-gui)
  (begin
    (draw-buttons)
    (listTasks)
    (send frame show #t)))
