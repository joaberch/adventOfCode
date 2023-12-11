       identification division.
       PROGRAM-ID. 1-1.

       DATA DIVISION.           
       WORKING-STORAGE SECTION.
       77 strvaleur PIC X(30).
      *77 FirstNumericVal PIC 9.
      *77 Last-Numeric-Values PIC 9.
       77 Counter PIC 9(3) VALUE 1.

       SCREEN SECTION.
       1 s-plg-strvaleur.
          2 LINE 5 COL 8 VALUE 'Quel est votre nom : '.
          2 PIC X(50) TO strvaleur REQUIRED.

       PROCEDURE DIVISION.
           ACCEPT s-plg-strvaleur.

           perform find-first-num varying Counter from 1 by 1
           until Counter > length OF strvaleur.

           STOP RUN.

           find-first-num.
               IF strvaleur(Counter:1) IS numeric
               DISPLAY strvaleur(COunter:1) COL Counter.
      *         END-IF.
