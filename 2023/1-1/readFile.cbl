       IDENTIFICATION DIVISION.
       PROGRAM-ID. TestReadFile.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 data-line PIC X(20).
       01 EOF-SWITCH PIC X VALUE 'N'.
       01 testing PIC X(20) VALUE 'donnee.dat'.
       
       PROCEDURE DIVISION.
       OPEN INPUT testing.
        
       PERFORM UNTIL EOF-SWITCH = 'Y'
           READ 'donnee.dat'.
               AT END
                   SET EOF-SWITCH TO 'Y'
               END-READ.
               IF EOF-SWITCH = 'N'
                   PERFORM process-data.
           END-PERFORM.
       
       CLOSE 'donne.dat'.

       process-data.
           DISPLAY data-line.