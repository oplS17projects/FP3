**Name**: Saurabh Verma

**Report**:

For the final project, my team is planning to work on a dynamic web application. To accomplish this, it's important to familiarize ourselves with databases and how racket interacts with them.

Using the `db` library, I created a SQLite database and inserted test records into it:

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

Before creating a database, I added a conditional check that will only execute the `CREATE`/`INSERT` statements if the database is not already created. Once the code is run, the user can query the database in the output window:

![racket_image](/screenshot.png?raw=true "Racket Image")
