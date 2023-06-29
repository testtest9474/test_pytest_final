       IDENTIFICATION DIVISION.
       PROGRAM-ID.    ASMBITC1.
       AUTHOR.        SIMOTIME TECHNOLOGIES.
      *****************************************************************
      * Copyright (C) 1987-2019 SimoTime Technologies.                *
      *                                                               *
      * All rights reserved.  Unpublished, all rights reserved under  *
      * copyright law and international treaty.  Use of a copyright   *
      * notice is precautionary only and does not imply publication   *
      * or disclosure.                                                *
      *                                                               *
      * Permission to use, copy, modify and distribute this software  *
      * for any non-commercial purpose and without fee is hereby      *
      * granted, provided the SimoTime copyright notice appear on all *
      * copies of the software. The SimoTime name or Logo may not be  *
      * used in any advertising or publicity pertaining to the use    *
      * of the software without the written permission of SimoTime    *
      * Technologies.                                                 *
      *                ccn		American Express,Amex,Master Card,Visa,CVV Code,CVV Number,CVC Code,CVC Number,Select Card Type,Discover,Diners Club,JCB,Pay with checking account,Pay check money order,Credit Card Number,Card holder Name,Expiration Date

2264 2231 2829 8234		
4744 9891 1362 0055		
2262 3841 7879 8804		
2314 6859 7722 8845		
2222 4000 7000 0005		
5555 3412 4444 1115		
4360 0000 0100 0005		
4929-3813-3266-4295		
5370-4638-8881-3020		
4916-4811-5814-8111		
                                               *
      * Permission to use, copy, modify and distribute this software  *
      * for any commercial purpose requires a fee to be paid to       *
      * SimoTime Technologies. Once the fee is received by SimoTime   *
      * the latest version of the software will be delivered and a    *
      * license will be granted for use within an enterprise,         *
      * provided the SimoTime copyright notice appear on all copies   *
      * of the software. The SimoTime name or Logo may not be used    *
      * in any advertising or publicity pertaining to the use of the  *
      * software without the written permission of SimoTime           *
      * Technologies.                                                 *
      *                                                               *
      * SimoTime Technologies makes no warranty or representations    *
      * about the suitability of the software for any purpose. It is  *
      * provided "AS IS" without any expressed or implied warranty,   *
      * including the implied warranties of merchantability, fitness  *
      * for a particular purpose and non-infringement. SimoTime       *
      * Technologies shall not be liable for any direct, indirect,    *
      * special or consequential damages resulting from the loss of   *
      * use, data or projects, whether in an action of contract or    *
      * tort, arising out of or in connection with the use or         *
      * performance of this software                                  *
      *                                                               *
      * SimoTime Technologies                                         *
      * 15 Carnoustie Drive                                           *
      * Novato, CA 94949-5849                                         *
      * 415.883.6565                                                  *
      *                                                               *
      * RESTRICTED RIGHTS LEGEND                                      *
      * Use, duplication, or disclosure by the Government is subject  *
      * to restrictions as set forth in subparagraph (c)(1)(ii) of    *
      * the Rights in Technical Data and Computer Software clause at  *
      * DFARS 52.227-7013 or subparagraphs (c)(1) and (2) of          *
      * Commercial  Computer Software - Restricted Rights  at 48      *
      * CFR 52.227-19, as applicable.  Contact SimoTime Technologies, *
      * 15 Carnoustie Drive, Novato, CA 94949-5849.                   *
      *                                                               *
      *****************************************************************
      *      This program is provided by SimoTime Technologies        *
      *        Our e-mail address is: helpdesk@simotime.com           *
      *     Also, visit our Web Site at http://www.simotime.com       *
      *****************************************************************
      *
      *****************************************************************
      * Source Member: ASMBITC1.CBL
      * Copy Files:    PASSBITS.CPY
      * Calls to:      ASM4BITS
      *****************************************************************
      *
      * ASMBITC1 - Call ASM4BITS to convert between bits and bytes.
      *
      * CALLING PROTOCOL
      * ----------------
      * Use standard procedure to RUN or ANIMATE.
      *
      * DESCRIPTION
      * -----------
      * This program will call a COBOL routine to access a
      * routine to convert between bits and bytes..
      *
      *          ************
      *          * CBLBITJ1 *
      *          ********jcl*
      *               *
      *               *
      *          ************     ************
      *          * ASMBITC1 *-----* CONSOLE  *
      *          ********cbl*     ******dsply*
      *               *
      *               *
      *          ************
      *          * ASM4BITS *
      *          ********cbl*
      *
      * This program calls ASM4BITS to perform two functions:
      *
      * EXPAND   - translate the bits of a one-byte field to bytes
      *            in an eight-byte field.
      * COMPRESS - translate the bytes of an eight-byte field into
      *            bits in a one-byte field.
      *
      *****************************************************************
      * The EXPAND function will do the following:
      *
      * Input:  BTS-PASS-BITS, a one byte field (8-bits)
      * OUTPUT: BTS-PASS-BYTES, an eight byte field
      *
      * For each bit that is on in the BTS-PASS-BITS field set the
      * corresponding byte in the BTS-PASS-BYTES field to a value
      * of one.
      *
      * For each bit that is off in the BTS-PASS-BITS field set the
      * corresponding byte in the BTS-PASS-
      * BYTES field to a value of zero.
      *
      * Example: if   BTS-PASS-BITS = x'55'
      *          then BTS-PASS-BYTES will be '01010101'
      *
      *****************************************************************
      * The COMPRESS function will do the following:
      *
      * Input:  BTS-PASS-BYTES, an eight byte field
      * Output: BTS-PASS-BITS, a one byte field (8-bits)
      *
      * For each byte that is a one in the BTS-PASS-BYTES field the
      * corresponding bit in the BTS-PASS-BITS field is set to ON (1)
      *
      * For each byte that is zero in the BTS-PASS-BYTES field the
      * corresponding bit in the BTS-PASS-BITS field is set to OFF (0).
      *
      * Example: if   BTS-PASS-BYTES = '01010101'
      *          then BTS-PASS-BITS set to x'55'
      *
      *****************************************************************
      *
      * MAINTENANCE
      * -----------
      * 1989/02/27 Simmons, Created program.
      * 1997/03/17 Simmons, Updated for call to ASM4BITS.
      *
      *****************************************************************
      *
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *****************************************************************
      *    Data-structure for Title and Copyright...
      *    ------------------------------------------------------------
       01  SIM-TITLE.
           05  T1 pic X(11) value '* ASMBITC1 '.
           05  T2 pic X(34) value 'Convert between Bits and Bytes    '.
           05  T3 pic X(10) value ' v08.06.05'.
           05  T4 pic X(24) value ' http://www.simotime.com'.
       01  SIM-COPYRIGHT.
           05  C1 pic X(11) value '* ASMBITC1 '.
           05  C2 pic X(20) value 'Copyright 1987-2019 '.
           05  C3 pic X(28) value '   SimoTime Technologies    '.
           05  C4 pic X(20) value ' All Rights Reserved'.

       01  SIM-THANKS-01.
           05  C1 pic X(11) value '* ASMBITC1 '.
           05  C2 pic X(32) value 'Thank you for using this program'.
           05  C3 pic X(32) value ' provided from SimoTime Technolo'.
           05  C4 pic X(04) value 'gies'.

       01  SIM-THANKS-02.
           05  C1 pic X(11) value '* ASMBITC1 '.
           05  C2 pic X(32) value 'Please send all inquires or sugg'.
           05  C3 pic X(32) value 'estions to the helpdesk@simotime'.
           05  C4 pic X(04) value '.com'.

       COPY PASSBITS.

      *****************************************************************
      *    BTS-PASS-REQUEST values when calling ASM4BITS.
      *    ------------------------------------------------------------
       01  REQUEST-4-EXPAND        pic X(8)    value 'EXPAND  '.
       01  REQUEST-4-COMPRESS      pic X(8)    value 'COMPRESS'.

      *****************************************************************
      *    Buffer used for posting messages to the console.
      *    ------------------------------------------------------------
       01  MESSAGE-BUFFER.
           05  MESSAGE-HEADER      pic X(11)   value '* ASMBITC1 '.
           05  MESSAGE-TEXT        pic X(68).

      *****************************************************************
      *    Work fields used for testing call to ASM4BITS.
      *    ------------------------------------------------------------
       01  HEX-00                  pic X       value x'00'.
       01  HEX-55                  pic X       value x'55'.
       01  HEX-AA                  pic X       value x'AA'.
       01  HEX-FF                  pic X       value x'FF'.

       01  BYTES-00                pic X(8).
       01  BYTES-55                pic X(8).
       01  BYTES-AA                pic X(8).
       01  BYTES-FF                pic X(8).

       01  ZERO-VALUE              pic 9       value 0.
       01  MINUS-ONE               pic S9      value -1.
       01  MINUS-ONE-X             redefines   MINUS-ONE
                                   pic X.
       01  POSITIVE-BIT-VALUE      pic X(8)    value '00000000'.
       01  NEGATIVE-BIT-VALUE      pic X(8)    value '00000000'.

       01  THREE-BYTES.
           05  PACK-03             pic S9(5)   comp-3  value 0.
       01  TWO-BYTES               pic X(2)    value '00'.
       01  EIGHT-BYTES             pic X(8)    value LOW-VALUES.

       01  THE-EASY-WAY.
           05  FILLER              pic X(9)    value 'Efficient'.
           05  FILLER              pic X(10)   value ', PACK-03 '.
           05  PACK-03-E1L         pic X(4)    value SPACES.
           05  FILLER              pic X       value '-'.
           05  PACK-03-E1R         pic X(4)    value SPACES.
           05  FILLER              pic X       value SPACE.
           05  PACK-03-E2L         pic X(4)    value SPACES.
           05  FILLER              pic X       value '-'.
           05  PACK-03-E2R         pic X(4)    value SPACES.
           05  FILLER              pic X       value SPACE.
           05  PACK-03-E3L         pic X(4)    value SPACES.
           05  FILLER              pic X       value '-'.
           05  PACK-03-E3R         pic X(4)    value SPACES.
           05  FILLER              pic X(13)   value ', UNPACKED-5='.
           05  UNPACKED-5          pic 9(5)    value 0.

       01  THE-HARD-WAY.
           05  FILLER              pic X(9)    value 'Difficult'.
           05  FILLER              pic X(10)   value ', PACK-03 '.
           05  PACK-03-H1L         pic X(4)    value SPACES.
           05  FILLER              pic X       value '-'.
           05  PACK-03-H1R         pic X(4)    value SPACES.
           05  FILLER              pic X       value SPACE.
           05  PACK-03-H2L         pic X(4)    value SPACES.
           05  FILLER              pic X       value '-'.
           05  PACK-03-H2R         pic X(4)    value SPACES.
           05  FILLER              pic X       value SPACE.
           05  PACK-03-H3L         pic X(4)    value SPACES.
           05  FILLER              pic X       value '-'.
           05  PACK-03-H3R         pic X(4)    value SPACES.
           05  FILLER              pic X(13)   value ', FIVE-BYTES='.
           05  FIVE-BYTES          pic X(5)    value '00000'.

       01  ALPHABET-UPPER pic X(26) value 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.

       01  IX-1           pic 9(3) value 0.
       01  IX-2           pic 9(3) value 0.
       01  IX-3           pic 9(3) value 0.

      *****************************************************************
       PROCEDURE DIVISION.

           perform Z-POST-COPYRIGHT

           perform BYTES-TO-BITS-COMPRESS.

           perform BITS-TO-BYTES-EXPAND.

           perform ALPHABET-DUMP.

           perform COBOL-UNPACK.

           perform Z-THANK-YOU.

           move ZERO to RETURN-CODE

           GOBACK.

      *****************************************************************
       ALPHABET-DUMP.
           move 'Starting ALPHABET-DUMP Routine...' to MESSAGE-TEXT
           perform Z-POST-MESSAGE

           add 1 to ZERO giving IX-1
           move REQUEST-4-EXPAND to BTS-PASS-REQUEST
           perform 26 times
               move ALPHABET-UPPER(IX-1:1) to BTS-PASS-BITS
               call 'ASM4BITS' using BTS-PASS-AREA
               move 'Position nnn is x, the binary value is xxxx-xxxx'
                 to MESSAGE-TEXT
               move IX-1                to MESSAGE-TEXT(10:03)
               move BTS-PASS-BITS       to MESSAGE-TEXT(17:1)
               move BTS-PASS-BYTES(1:4) to MESSAGE-TEXT(40:4)
               move BTS-PASS-BYTES(5:4) to MESSAGE-TEXT(45:4)
               perform Z-POST-MESSAGE
               add 1 to IX-1
           end-perform
           exit.

      *****************************************************************
       BITS-TO-BYTES-EXPAND.
           move 'Starting BITS-TO-BYTES-EXPAND Routine...'
             to MESSAGE-TEXT
           perform Z-POST-MESSAGE

           move HEX-00 to BTS-PASS-BITS
           move REQUEST-4-EXPAND to BTS-PASS-REQUEST
           call 'ASM4BITS'    using BTS-PASS-AREA
           move BTS-PASS-BYTES to BYTES-00
           perform DISPLAY-BYTES

           move HEX-FF to BTS-PASS-BITS
           move REQUEST-4-EXPAND to BTS-PASS-REQUEST
           call 'ASM4BITS'    using BTS-PASS-AREA
           move BTS-PASS-BYTES to BYTES-FF
           perform DISPLAY-BYTES

           move HEX-55 to BTS-PASS-BITS
           move REQUEST-4-EXPAND to BTS-PASS-REQUEST
           call 'ASM4BITS'    using BTS-PASS-AREA
           move BTS-PASS-BYTES to BYTES-55
           perform DISPLAY-BYTES

           move HEX-AA to BTS-PASS-BITS
           move REQUEST-4-EXPAND to BTS-PASS-REQUEST
           call 'ASM4BITS'    using BTS-PASS-AREA
           move BTS-PASS-BYTES to BYTES-AA
           perform DISPLAY-BYTES

           exit.

      *****************************************************************
       BYTES-TO-BITS-COMPRESS.
           move 'Starting BYTES-TO-BITS-COMPRESS Routine...'
             to MESSAGE-TEXT
           perform Z-POST-MESSAGE

           move '00000000' to BTS-PASS-BYTES
           move REQUEST-4-COMPRESS to BTS-PASS-REQUEST
           call 'ASM4BITS'      using BTS-PASS-AREA
           move BTS-PASS-BITS to HEX-00
           perform DISPLAY-BYTES

           move '11111111' to BTS-PASS-BYTES
           move REQUEST-4-COMPRESS to BTS-PASS-REQUEST
           call 'ASM4BITS'      using BTS-PASS-AREA
           move BTS-PASS-BITS to HEX-FF
           perform DISPLAY-BYTES

           move '01010101' to BTS-PASS-BYTES
           move REQUEST-4-COMPRESS to BTS-PASS-REQUEST
           call 'ASM4BITS'      using BTS-PASS-AREA
           move BTS-PASS-BITS to HEX-55
           perform DISPLAY-BYTES

           move '10101010' to BTS-PASS-BYTES
           move REQUEST-4-COMPRESS to BTS-PASS-REQUEST
           call 'ASM4BITS'      using BTS-PASS-AREA
           move BTS-PASS-BITS to HEX-AA
           perform DISPLAY-BYTES

           exit.

      *****************************************************************
      * If you thought the UnPack was reserved for the mainframe      *
      * assembler programmers then take a look at the following       *
      * routine. The is a bit of an esoteric use of bit mainipulation *
      * but it does unpack a data string into a new data string.      *
      *                                                               *
      * A quicker and better way to unpack a field is as follows:     *
      *    ADD PACKED-FIELD TO ZERO GIVING UNPACKED-FIELD.            *
      *****************************************************************
       COBOL-UNPACK.
           move 'Starting the COBOL-UNPACK Routine...'
             to MESSAGE-TEXT
           perform Z-POST-MESSAGE

           add 615 to ZERO giving PACK-03

      *    Do the UNPACK the easy way...
           add PACK-03 to ZERO giving UNPACKED-5

      *    First, determine the bit configuration for zero to be
      *    used to set the left-nibble of the unpacked bytes.
      *    Then determine the negative sign bit configuration.
      *    This section of code is used so the program will run
      *    properly in both an EBCDIC and ASCII environment.
           move REQUEST-4-EXPAND to BTS-PASS-REQUEST
           move ZERO-VALUE       to BTS-PASS-BITS
           call 'ASM4BITS'       using BTS-PASS-AREA
           move BTS-PASS-BYTES   to POSITIVE-BIT-VALUE

           move REQUEST-4-EXPAND to BTS-PASS-REQUEST
           move MINUS-ONE-X      to BTS-PASS-BITS
           call 'ASM4BITS'       using BTS-PASS-AREA
           move BTS-PASS-BYTES   to NEGATIVE-BIT-VALUE
           move '0000'           to NEGATIVE-BIT-VALUE(5:4)
      *    Do the UNPACK the esoteric way...
           move all '0' to FIVE-BYTES
           add 1 to ZERO giving IX-1
           add 1 to ZERO giving IX-2
           add 3 to ZERO giving IX-3
           perform until IX-3 = 1
               move REQUEST-4-EXPAND    to BTS-PASS-REQUEST
               move THREE-BYTES(IX-1:1) to BTS-PASS-BITS
               call 'ASM4BITS'       using BTS-PASS-AREA
               move BTS-PASS-BYTES      to EIGHT-BYTES

               move REQUEST-4-COMPRESS  to BTS-PASS-REQUEST
               move POSITIVE-BIT-VALUE      to BTS-PASS-BYTES

               move EIGHT-BYTES(1:4)    to BTS-PASS-BYTES(5:4)
               call 'ASM4BITS'       using BTS-PASS-AREA
               move BTS-PASS-BITS       to FIVE-BYTES(IX-2:1)
               add 1 to IX-2
               move EIGHT-BYTES(5:4)    to BTS-PASS-BYTES(5:4)
               call 'ASM4BITS'       using BTS-PASS-AREA
               move BTS-PASS-BITS       to FIVE-BYTES(IX-2:1)
               subtract 1 from IX-3
               add 1 to IX-2
               add 1 to IX-1
           end-perform
           perform COBOL-UNPACK-UNITS.

      *    Display the results...
           perform COBOL-UNPACK-POST-EFFICIENT
           perform COBOL-UNPACK-POST-DIFFICULT

           move 'Finished the COBOL-UNPACK Routine...'
             to MESSAGE-TEXT
           perform Z-POST-MESSAGE

           exit.
      *---------------------------------------------------------------*
       COBOL-UNPACK-POST-DIFFICULT.
           move THREE-BYTES(1:1) to BTS-PASS-BITS
           move REQUEST-4-EXPAND to BTS-PASS-REQUEST
           call 'ASM4BITS'    using BTS-PASS-AREA
           move BTS-PASS-BYTES(1:4) to PACK-03-H1L
           move BTS-PASS-BYTES(5:4) to PACK-03-H1R

           move THREE-BYTES(2:1) to BTS-PASS-BITS
           move REQUEST-4-EXPAND to BTS-PASS-REQUEST
           call 'ASM4BITS'    using BTS-PASS-AREA
           move BTS-PASS-BYTES(1:4) to PACK-03-H2L
           move BTS-PASS-BYTES(5:4) to PACK-03-H2R

           move THREE-BYTES(3:1) to BTS-PASS-BITS
           move REQUEST-4-EXPAND to BTS-PASS-REQUEST
           call 'ASM4BITS'    using BTS-PASS-AREA
           move BTS-PASS-BYTES(1:4) to PACK-03-H3L
           move BTS-PASS-BYTES(5:4) to PACK-03-H3R

           move THE-HARD-WAY to MESSAGE-TEXT
           perform Z-POST-MESSAGE
           exit.

      *---------------------------------------------------------------*
       COBOL-UNPACK-POST-EFFICIENT.
           move THREE-BYTES(1:1) to BTS-PASS-BITS
           move REQUEST-4-EXPAND to BTS-PASS-REQUEST
           call 'ASM4BITS'    using BTS-PASS-AREA
           move BTS-PASS-BYTES(1:4) to PACK-03-E1L
           move BTS-PASS-BYTES(5:4) to PACK-03-E1R

           move THREE-BYTES(2:1) to BTS-PASS-BITS
           move REQUEST-4-EXPAND to BTS-PASS-REQUEST
           call 'ASM4BITS'    using BTS-PASS-AREA
           move BTS-PASS-BYTES(1:4) to PACK-03-E2L
           move BTS-PASS-BYTES(5:4) to PACK-03-E2R

           move THREE-BYTES(3:1) to BTS-PASS-BITS
           move REQUEST-4-EXPAND to BTS-PASS-REQUEST
           call 'ASM4BITS'    using BTS-PASS-AREA
           move BTS-PASS-BYTES(1:4) to PACK-03-E3L
           move BTS-PASS-BYTES(5:4) to PACK-03-E3R

           move THE-EASY-WAY to MESSAGE-TEXT
           perform Z-POST-MESSAGE
           exit.

      *---------------------------------------------------------------*
       COBOL-UNPACK-UNITS.
           move REQUEST-4-EXPAND    to BTS-PASS-REQUEST
           move THREE-BYTES(IX-1:1) to BTS-PASS-BITS
           call 'ASM4BITS'       using BTS-PASS-AREA
           move BTS-PASS-BYTES      to EIGHT-BYTES

           move REQUEST-4-COMPRESS  to BTS-PASS-REQUEST
           if  PACK-03 < 0
               move NEGATIVE-BIT-VALUE      to BTS-PASS-BYTES
           else
               move POSITIVE-BIT-VALUE      to BTS-PASS-BYTES
           end-if
           move EIGHT-BYTES(1:4)    to BTS-PASS-BYTES(5:4)
      *    move EIGHT-BYTES(5:4)    to BTS-PASS-BYTES(1:4)
           call 'ASM4BITS'       using BTS-PASS-AREA
           move BTS-PASS-BITS       to FIVE-BYTES(IX-2:1)
           exit.

      *****************************************************************
       DISPLAY-BYTES.
           move 'Binary value is '     to MESSAGE-TEXT(1:16)
           move BTS-PASS-BYTES(1:4)    to MESSAGE-TEXT(17:4)
           move '-'                    to MESSAGE-TEXT(21:1)
           move BTS-PASS-BYTES(5:4)    to MESSAGE-TEXT(22:4)
           perform Z-POST-MESSAGE
           exit.

      *****************************************************************
      * The following Z-Routines perform administrative tasks         *
      * for this program.                                             *
      *****************************************************************

      *****************************************************************
       Z-POST-COPYRIGHT.
           display SIM-TITLE
           display SIM-COPYRIGHT
           exit.

      *****************************************************************
       Z-POST-MESSAGE.
           display MESSAGE-BUFFER
           move SPACES to MESSAGE-TEXT
           exit.

      *****************************************************************
       Z-THANK-YOU.
           display SIM-THANKS-01
           display SIM-THANKS-02
           exit.
      *****************************************************************
      *      This example is provided by SimoTime Technologies        *
      *        Our e-mail address is: helpdesk@simotime.com           *
      *     Also, visit our Web Site at http://www.simotime.com       *
      *****************************************************************
