       IDENTIFICATION DIVISION.
       PROGRAM-ID. 1-1.
       DATE-WRITTEN. 10.12.2023
       AUTHOR. cyco.

       DATA DIVISION.           
       WORKING-STORAGE SECTION.
       77 strvaleur PIC X(50).
       77 FirstNumericVal PIC 9.
       77 Last-Numeric-Values PIC 9.
       77 Counter PIC 9(3) VALUE 1.

       SCREEN SECTION.
       1 s-plg-strvaleur.
          2 LINE 5 COL 8 VALUE 'Quel est votre nom : '.
          2 PIC X(25) TO strvaleur REQUIRED.

       PROCEDURE DIVISION.
          ACCEPT s-plg-strvaleur.

          PERFORM VARYING Counter FROM 1 BY 1
           UNTIL Counter > LENGTH OF strvaleur OR 
               strvaleur(Counter:1) IS NUMERIC
           MOVE strvaleur(Counter) TO FirstNumericVal
                   EXIT PERFORM
          END-PERFORM.

          DISPLAY FirstNumericVal.

          STOP RUN.
