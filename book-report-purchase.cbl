IDENTIFICATION DIVISION.
PROGRAM-ID. PURCHASE-REPORT.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.

DATA DIVISION.
FILE SECTION.
FD  PUBLISHER-FILE
    LABEL RECORDS ARE OMITTED
    BLOCK CONTAINS 0 RECORDS.
FD  BOOK-FILE
    LABEL RECORDS ARE OMITTED
    BLOCK CONTAINS 0 RECORDS.
FD  PURCHASE-FILE
    LABEL RECORDS ARE OMITTED
    BLOCK CONTAINS 0 RECORDS.

WORKING-STORAGE SECTION.
01  PUBLISHER-RECORD.
    05  PUBLISHER-NAME PIC X(30).
    05  PUBLISHER-ADDRESS PIC X(30).

01  BOOK-RECORD.
    05  BOOK-TITLE PIC X(30).
    05  ISBN PIC 9(13).
    05  PUBLISHER-ID PIC 9(10).

01  PURCHASE-RECORD.
    05  SEMESTER-NUMBER PIC 9.
    05  ISBN PIC 9(13).
    05  REQUIRED-QUANTITY PIC 9(5).

01  SEMESTER-NUMBER PIC 9.

PROCEDURE DIVISION.
DISPLAY "Enter semester number (1 or 2): "
ACCEPT SEMESTER-NUMBER
OPEN INPUT PUBLISHER-FILE
OPEN INPUT BOOK-FILE
OPEN INPUT PURCHASE-FILE
PERFORM UNTIL EOF-PUBLISHER
    READ PUBLISHER-FILE
    READ PURCHASE-FILE
        AT END
            DISPLAY "NO PURCHASE REQUIREMENTS FOUND"
            GO TO EXIT
        END-READ
    READ BOOK-FILE
        AT END
            DISPLAY "NO BOOKS FOUND FOR PUBLISHER"
            GO TO EXIT
        END-READ
    IF SEMESTER-NUMBER = PURCHASE-RECORD.SEMESTER-NUMBER AND
       ISBN = PURCHASE-RECORD.ISBN
       DISPLAY PUBLISHER-NAME, BOOK-TITLE, REQUIRED-QUANTITY
    END-IF
END-PERFORM
CLOSE PUBLISHER-FILE
CLOSE BOOK-FILE
CLOSE PURCHASE-FILE
EXIT.
STOP RUN.