IDENTIFICATION DIVISION.
PROGRAM-ID. WITHDRAW.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.

DATA DIVISION.
FILE SECTION.
FD  ACCOUNT-FILE
    LABEL RECORDS ARE OMITTED
    BLOCK CONTAINS 0 RECORDS.

WORKING-STORAGE SECTION.
01  ACCOUNT-RECORD.
    05  ACCOUNT-NUMBER PIC 9(10).
    05  BALANCE PIC 9(7)V99.

01  WITHDRAWAL-AMOUNT PIC 9(7)V99.

PROCEDURE DIVISION.
OPEN INPUT ACCOUNT-FILE
READ ACCOUNT-FILE
    AT END
        DISPLAY "INVALID ACCOUNT NUMBER"
    END-READ
DISPLAY "Enter withdrawal amount: "
ACCEPT WITHDRAWAL-AMOUNT
IF WITHDRAWAL-AMOUNT > BALANCE
    DISPLAY "INSUFFICIENT BALANCE"
ELSE
    SUBTRACT WITHDRAWAL-AMOUNT FROM BALANCE
    DISPLAY "PLEASE TAKE YOUR CASH"
END-IF
CLOSE ACCOUNT-FILE
STOP RUN.
