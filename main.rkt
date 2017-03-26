#lang racket

(require db)

(define db (sqlite3-connect #:database "database.db" #:mode 'create))

(unless (table-exists? db "exptable")
  (query-exec db "CREATE TABLE exptable (id INTEGER PRIMARY KEY UNIQUE, word TEXT)")
  (query-exec db "INSERT INTO exptable (word) VALUES('hello')")
  (query-exec db "INSERT INTO exptable (word) VALUES('does')")
  (query-exec db "INSERT INTO exptable (word) VALUES('this')")
  (query-exec db "INSERT INTO exptable (word) VALUES('work')")
  (query-exec db "INSERT INTO exptable (word) VALUES('yes')")
  (query-exec db "INSERT INTO exptable (word) VALUES('it')")
  (query-exec db "INSERT INTO exptable (word) VALUES('does')")
  (query-exec db "INSERT INTO exptable (word) VALUES('actually')")
  (query-exec db "INSERT INTO exptable (word) VALUES('work')"))
