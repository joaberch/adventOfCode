       IDENTIFICATION DIVISION.
       PROGRAM-ID. guessNumber.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 usrValue PIC 99.
       77 nbAleatoire PIC 9(3).
       77 seed PIC X(30).
       77 checkEnd PIC X VALUE 'N'.
       77 ctr PIC 9(2).

       SCREEN SECTION.
       1 s-plg-strvaleur.
          2 LINE 5 COL 8 VALUE 'Chiffre de 1 a 99 : '.
          2 PIC 99 TO usrValue REQUIRED.

       PROCEDURE DIVISION.
           PERFORM getRandomNumber.
           PERFORM main UNTIL checkEnd = 'Y'.
    
           STOP RUN.

       main.
           ACCEPT s-plg-strvaleur.
           ADD 1 TO ctr.
    
           IF usrValue = nbAleatoire THEN
               DISPLAY 'Bravo, nombre de coups joues : ' LINE 1
               DISPLAY ctr COL 32
               MOVE 'Y' TO checkEnd
           ELSE
               IF usrValue > nbAleatoire THEN
                   DISPLAY 'Trop haut.'
               ELSE
                   DISPLAY 'Trop bas.'
               END-IF.

       getRandomNumber.
           MOVE FUNCTION CURRENT-DATE(9:8) TO seed.
           COMPUTE nbAleatoire = FUNCTION RANDOM(seed) * 100.
