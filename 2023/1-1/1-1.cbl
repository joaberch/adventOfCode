       identification division.
       PROGRAM-ID. 1-1.

       DATA DIVISION.           
       WORKING-STORAGE SECTION.
       77 strvaleur PIC X(30).
       77 FirstNumericVal PIC 9.
       77 Last-Numeric-Values PIC 9.
       77 Full-Numeric-Value PIC X(2).
       77 Full-in-numeric PIC 9(2).
       77 Result PIC 9(2).
       77 Counter PIC 9(3) VALUE 1.
       77 FoundNumericValue PIC X VALUE 'N'.

       SCREEN SECTION.
       1 s-plg-strvaleur.
          2 LINE 5 COL 8 VALUE 'Quel est votre nom : '.
          2 PIC X(50) TO strvaleur REQUIRED.

       PROCEDURE DIVISION.
      *Get the value from the user
           ACCEPT s-plg-strvaleur.
      *Get the first and the last numeric value of the string
           perform findval varying Counter from 1 by 1
           until Counter > length of strvaleur.
      *Get the numeric value in a string format
           STRING FirstNumericVal Last-Numeric-Values delimited by ''
           INTO Full-Numeric-Value.
      *Get the numeric value in a numeric format
           MOVE Full-Numeric-Value TO Full-in-numeric.
      *Add the new value to the result
           ADD Full-in-numeric TO Result.

           DISPLAY Result COL 1.

           STOP RUN.

           findval.
               IF strvaleur(Counter:1) IS NUMERIC
               AND FoundNumericValue = 'N'
               SET FirstNumericVal TO strvaleur(Counter:1)
               SET Last-Numeric-Values TO strvaleur(Counter:1)
               MOVE 'Y' TO FoundNumericValue.

               IF strvaleur(Counter:1) IS numeric
               SET Last-Numeric-Values TO strvaleur(Counter:1)
               EXIT.
