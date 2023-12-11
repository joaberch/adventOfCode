       identification division.
       PROGRAM-ID. 1-1.

       DATA DIVISION.           
       WORKING-STORAGE SECTION.
       77 strvaleur PIC X(30).
       77 FirstNumericVal PIC 9.
       77 Last-Numeric-Values PIC 9.
       77 Counter PIC 9(3) VALUE 1.
       77 FoundNumericValue PIC X VALUE 'N'.

       SCREEN SECTION.
       1 s-plg-strvaleur.
          2 LINE 5 COL 8 VALUE 'Quel est votre nom : '.
          2 PIC X(50) TO strvaleur REQUIRED.

       PROCEDURE DIVISION.
           ACCEPT s-plg-strvaleur.
           
           perform findval varying Counter from 1 by 1
           until Counter > length of strvaleur.

           DISPLAY FirstNumericVal COL 1.
           DISPLAY Last-Numeric-Values COL 5.

           STOP RUN.

           findval.
               IF strvaleur(Counter:1) IS NUMERIC
               AND FoundNumericValue = 'N'
               SET FirstNumericVal TO strvaleur(Counter:1)
               SET Last-Numeric-Values TO strvaleur(Counter:1)
      *         SET strvaleur(Counter:1) TO FirstNumericVal.
      *         SET strvaleur(Counter:1) TO Last-Numeric-Values.
               MOVE 'Y' TO FoundNumericValue.

               IF strvaleur(Counter:1) IS numeric
               SET Last-Numeric-Values TO strvaleur(Counter:1)
               EXIT.
               