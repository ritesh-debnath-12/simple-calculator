;                       ---------------------------------------------------------------------------------
;                       |                                THE BIG PLAN                                   |
;                       |       Give user a menu and ask what operation to do                           |
;                       |       Take operation value and jump to operation                              |
;                       |       Ask for first input                                                     |
;                       |       atoi that shit                                                          |
;                       |       ask for second input                                                    |
;                       |       atoi that as well                                                       |
;                       |       perform math                                                            |
;                       |       itoa that result                                                        |
;                       |       now send a response with result and newline                             |
;                       |       ask if they want to quit or nah                                         |
;                       |       exit if nah, else, display menu and go through the horror again         |
;                       |       Profit!                                                                 |
;                       ---------------------------------------------------------------------------------

section .bss
                                input_buf       resb            16
                                ng_buf          resb            16
                                x               resb            16
                                x_num           resb            16
                                y               resb            16
                                y_num           resb            16
                                result          resb            16
                                out_buf         resb            16

                                exit_buf        resb            16
section .data

                                ; MENU LABEL DEFINITIONS STARTS HERE
                                mnu_dashes      db      "---------------------------",  0xA
                                mnu_dashes_len  equ     $ - mnu_dashes

                                mnu_lbl_1       db      "Welcome to Menu!",             0xA
                                mnu_lbl_len     equ     $ - mnu_lbl_1

                                mnu_lbl_2       db      "Press 1 to add",               0xA
                                mnu_lbl_len_2   equ     $ - mnu_lbl_2
                                
                                mnu_lbl_3       db      "Press 2 to subtract",          0xA
                                mnu_lbl_len_3   equ     $ - mnu_lbl_3
                                
                                mnu_lbl_4       db      "Press 3 to multiply",          0xA
                                mnu_lbl_len_4   equ     $ - mnu_lbl_4
                                
                                mnu_lbl_5       db      "Press 4 to div",               0xA
                                mnu_lbl_len_5   equ     $ - mnu_lbl_5
                                
                                mnu_lbl_6       db      "Press 5 to exit",              0xA
                                mnu_lbl_len_6   equ     $ - mnu_lbl_6
                                ; MENU LABEL DEFINITIONS ENDS HERE
                                
                                ; INPUT MESSAGES DEFINITIONS START HERE
                                msg_1           db      "Please enter first number: ",  0xA
                                msg_len         equ     $ - msg_1

                                msg_2           db      "Please enter second number: ", 0xA
                                msg_len_2       equ     $ - msg_2
                                
                                msg_ng          db      "Please enter your choice: ",   0xA
                                msg_ng_len      equ     $ - msg_ng
                                ; INPUT MESSAGES DEFINITIONS END HERE

                                ; NEWGAME MENU MESSAGE DEFINITIONS START HERE
                                ng_lbl_1        db      "Do you want to start over?",   0xA
                                ng_lbl_len      equ     $ - ng_lbl_1
                                
                                ng_lbl_2        db      "Press 1 if yes..",             0xA
                                ng_lbl_len_2    equ     $ - ng_lbl_2
                                
                                ng_lbl_3        db      "Press 2 if no...",             0xA
                                ng_lbl_len_3    equ     $ - ng_lbl_3
                                ; NEWGAME MENU MESSAGE DEFINITIONS END HERE
                                
                                ; MISCELLANEOUS STUFF....
                                msg_out         db      "The result is: ",              0xA
                                msg_out_len     equ     $ - msg_out

                                punish_fool     db      "You are banished to detroit!", 0xA                     ; ay, that fits nicely!
                                punish_fool_len equ     $ - punish_fool

                                exit_lbl        db      "Press any key to exit...",     0xA
                                exit_lbl_len    equ     $ - exit_lbl

                                newline         db                                      0xA


section .text
global _start:
_start:
                                jmp         Dilapidated_Temple

; .add_atoi_section_1                                                                   ; yes, I thought about having an atoi for all...but my god even my inefficient ass can't do that xD  
; literally, 5 min later....oh crap I have to make individual sections because jumps...AAAAHHHHH
.add_atoi_section_1:                                                                         
                                mov         bl,         [x + ecx]
                                cmp         bl,         10
                                je          .done_1_add

                                sub         bl,         '0'
                                imul        eax,        eax,        10
                                add         eax,        ebx

                                inc         ecx
                                jmp         .add_atoi_section_1

.add_atoi_section_2:
                                mov         bl,         [y + ecx]
                                cmp         bl,         10
                                je          .done_2_add

                                sub         bl,         '0'
                                imul        eax,        eax,        10
                                add         eax,        ebx

                                inc         ecx
                                jmp         .add_atoi_section_2

.add_itoa_section:
                                xor         edx,        edx
                                div         ecx
                                add         dl,         '0'
                                mov         [edi],      dl
                                dec         edi
                                test        eax,        eax
                                jnz         .add_itoa_section

                                inc         edi
                                jmp         Ashina_Outskirts.check_3

.sub_atoi_section_1:
                                mov         bl,         [x + ecx]
                                cmp         bl,         10
                                je          .done_1_sub

                                sub         bl,         '0'
                                imul        eax,        eax,        10
                                add         eax,        ebx

                                inc         ecx
                                jmp         .sub_atoi_section_1

.sub_atoi_section_2: 
                                mov         bl,         [y + ecx]
                                cmp         bl,         10
                                je          .done_2_sub

                                sub         bl,         '0'
                                imul        eax,        eax,        10
                                add         eax,        ebx

                                inc         ecx
                                jmp         .sub_atoi_section_2

.sub_itoa_section:
                                xor         edx,        edx
                                div         ecx
                                add         dl,         '0'
                                mov         [edi],      dl
                                dec         edi
                                test        eax,        eax
                                jnz         .sub_itoa_section

                                inc         edi
                                jmp         Ashina_Dojo.check_3

.mul_atoi_section_1:
                                mov         bl,         [x + ecx]
                                cmp         bl,         10
                                je          .done_1_mul

                                sub         bl,         '0'
                                imul        eax,        eax,        10
                                add         eax,        ebx

                                inc         ecx
                                jmp         .mul_atoi_section_1

.mul_atoi_section_2: 
                                mov         bl,         [y + ecx]
                                cmp         bl,         10
                                je          .done_2_mul

                                sub         bl,         '0'
                                imul        eax,        eax,        10
                                add         eax,        ebx

                                inc         ecx
                                jmp         .mul_atoi_section_2

.mul_itoa_section:
                                xor         edx,        edx
                                div         ecx
                                add         dl,         '0'
                                mov         [edi],      dl
                                dec         edi
                                test        eax,        eax
                                jnz         .mul_itoa_section

                                inc         edi
                                jmp         Gun_Fort.check_3

.div_atoi_section_1:
                                mov         bl,         [x + ecx]
                                cmp         bl,         10
                                je          .done_1_div

                                sub         bl,         '0'
                                imul        eax,        eax,        10
                                add         eax,        ebx

                                inc         ecx
                                jmp         .div_atoi_section_1

.div_atoi_section_2: 
                                mov         bl,         [y + ecx]
                                cmp         bl,         10
                                je          .done_2_div

                                sub         bl,         '0'
                                imul        eax,        eax,        10
                                add         eax,        ebx

                                inc         ecx
                                jmp         .div_atoi_section_2

.div_itoa_section:
                                xor         edx,        edx
                                div         ecx
                                add         dl,         '0'
                                mov         [edi],      dl
                                dec         edi
                                test        eax,        eax
                                jnz         .div_itoa_section

                                inc         edi
                                jmp         Fountainhead_Palace.check_3

.done_1_add:
                                mov         [x_num],        eax
                                jmp         Ashina_Outskirts.check_1

.done_2_add:
                                mov         [y_num],        eax
                                jmp         Ashina_Outskirts.check_2

.done_1_sub:
                                mov         [x_num],        eax
                                jmp         Ashina_Dojo.check_1

.done_2_sub:
                                mov         [y_num],        eax
                                jmp         Ashina_Dojo.check_2

.done_1_mul:
                                mov         [x_num],        eax
                                jmp         Gun_Fort.check_1

.done_2_mul:
                                mov         [y_num],        eax
                                jmp         Gun_Fort.check_2

.done_1_div:
                                mov         [x_num],        eax
                                jmp         Fountainhead_Palace.check_1

.done_2_div:
                                mov         [y_num],        eax
                                jmp         Fountainhead_Palace.check_2
Ashina_Outskirts:                                                                       ; ...our journey to victory has finally begun...deat-.....oops wrong game
                                ; ask for input 1
                                mov         eax,        4
                                mov         ebx,        1
                                mov         ecx,        msg_1
                                mov         edx,        msg_len
                                int         0x80

                                ; read input 1
                                mov         eax,        3
                                mov         ebx,        0
                                mov         ecx,        x
                                mov         edx,        16
                                int         0x80

                                ; atoi input 1
                                xor         eax,        eax
                                xor         ecx,        ecx
                                call        _start.add_atoi_section_1
.check_1:                                                                               ; hey control, what's up!
                                ; ask for input 2
                                mov         eax,        4
                                mov         ebx,        1
                                mov         ecx,        msg_2
                                mov         edx,        msg_len_2
                                int         0x80

                                ; read input 2
                                mov         eax,        3
                                mov         ebx,        0
                                mov         ecx,        y
                                mov         edx,        16
                                int         0x80

                                ; atoi input 2
                                xor         eax,        eax
                                xor         ecx,        ecx
                                call        _start.add_atoi_section_2

.check_2:                                                                               ; this is like Re Zero ngl
                                ; do add
                                mov         eax,        [x_num]
                                mov         ebx,        [y_num]
                                add         eax,        ebx
                                mov         [result],   eax
                                
                                ; itoa result
                                mov         ecx,        10
                                mov         edi,        out_buf + 15
                                mov         byte        [edi],              10
                                dec         edi

                                mov         eax,        [result]
                                xor         edx,        edx
                                call        _start.add_itoa_section

.check_3:
                                ; print output msg
                                mov         eax,        4
                                mov         ebx,        1
                                mov         ecx,        msg_out
                                mov         edx,        msg_out_len
                                int         0x80
                                
                                ; print number...
                                mov         eax,        4
                                mov         ebx,        1
                                mov         ecx,        edi
                                mov         edx,        out_buf + 15
                                sub         edx,        ecx
                                int         0x80

                                ; add newline
                                mov         eax,        4
                                mov         ebx,        1
                                mov         ecx,        newline
                                mov         edx,        1
                                int         0x80

                                ; jmp to ng
                                jmp         ng

Ashina_Dojo:                                                                            ; ...first skill check arrives...
                                ; ask for input 1
                                mov         eax,        4
                                mov         ebx,        1
                                mov         ecx,        msg_1
                                mov         edx,        msg_len
                                int         0x80

                                ; read input 1
                                mov         eax,        3
                                mov         ebx,        0
                                mov         ecx,        x
                                mov         edx,        16
                                int         0x80

                                ; atoi input 1
                                xor         eax,        eax
                                xor         ecx,        ecx
                                call        _start.sub_atoi_section_1

.check_1:
                                ; ahhh, to do this again ;-;
                                ; ask for input 2
                                mov         eax,        4
                                mov         ebx,        1
                                mov         ecx,        msg_2
                                mov         edx,        msg_len_2
                                int         0x80

                                ; read input 2
                                mov         eax,        3
                                mov         ebx,        0
                                mov         ecx,        y
                                mov         edx,        16
                                int         0x80

                                ; atoi input 2
                                xor         eax,        eax
                                xor         ecx,        ecx
                                call        _start.sub_atoi_section_2

.check_2:
                                ; do sub
                                mov         eax,        [x_num]
                                mov         ebx,        [y_num]
                                sub         eax,        ebx
                                mov         [result],   eax

                                ; itoa result
                                mov         ecx,        10
                                mov         edi,        out_buf + 15
                                mov         byte        [edi],                  10
                                dec         edi

                                mov         eax,        [result]
                                xor         edx,        edx
                                call        _start.sub_itoa_section

.check_3:                                                                               ; Jeez, I think I feel 1% of what Subaru felt
                                ; print output msg
                                mov         eax,        4
                                mov         ebx,        1
                                mov         ecx,        msg_out
                                mov         edx,        msg_out_len
                                int         0x80
                                
                                ; print number...
                                mov         eax,        4
                                mov         ebx,        1
                                mov         ecx,        edi
                                mov         edx,        out_buf + 15
                                sub         edx,        ecx
                                int         0x80

                                ; add newline
                                mov         eax,        4
                                mov         ebx,        1
                                mov         ecx,        newline
                                mov         edx,        1
                                int         0x80

                                ; jmp to ng
                                jmp         ng

Gun_Fort:                                                                               ; This place bruh...no one told me there is a tunnel to Detroit from Ashina!?
                                ; ask for input 1
                                mov         eax,        4
                                mov         ebx,        1
                                mov         ecx,        msg_1
                                mov         edx,        msg_len
                                int         0x80

                                ; read input 1
                                mov         eax,        3
                                mov         ebx,        0
                                mov         ecx,        x
                                mov         edx,        16
                                int         0x80

                                ; atoi input 1
                                xor         eax,        eax
                                xor         ecx,        ecx
                                call        _start.mul_atoi_section_1

.check_1:
                                ; I feel my brain melting...
                                ; ask for input 2
                                mov         eax,        4
                                mov         ebx,        1
                                mov         ecx,        msg_2
                                mov         edx,        msg_len_2
                                int         0x80

                                ; read input 2
                                mov         eax,        3
                                mov         ebx,        0
                                mov         ecx,        y
                                mov         edx,        16
                                int         0x80

                                ; atoi input 2
                                xor         eax,        eax
                                xor         ecx,        ecx
                                call        _start.mul_atoi_section_2

.check_2:
                                ; do mul
                                mov         eax,        [x_num]
                                mov         ebx,        [y_num]
                                mul         ebx
                                mov         [result],       eax

                                ; itoa result
                                mov         ecx,        10
                                mov         edi,        out_buf + 15
                                mov         byte        [edi],                      10
                                dec         edi

                                mov         eax,        [result]
                                xor         edx,        edx
                                call        _start.mul_itoa_section

.check_3:                                                                               ; ....only a small part left....
                                ; print output msg
                                mov         eax,        4
                                mov         ebx,        1
                                mov         ecx,        msg_out
                                mov         edx,        msg_out_len
                                int         0x80
                                
                                ; print number...
                                mov         eax,        4
                                mov         ebx,        1
                                mov         ecx,        edi
                                mov         edx,        out_buf + 15
                                sub         edx,        ecx
                                int         0x80

                                ; add newline
                                mov         eax,        4
                                mov         ebx,        1
                                mov         ecx,        newline
                                mov         edx,        1
                                int         0x80

                                ; jmp to ng
                                jmp         ng

Fountainhead_Palace:                                                                    ; finally a cool looking place...except populated by yanderes and crazy grandmas..seesh
                                ; ask for input 1
                                mov         eax,        4
                                mov         ebx,        1
                                mov         ecx,        msg_1
                                mov         edx,        msg_len
                                int         0x80

                                ; read input 1
                                mov         eax,        3
                                mov         ebx,        0
                                mov         ecx,        x
                                mov         edx,        16
                                int         0x80

                                ; atoi input 1
                                xor         eax,        eax
                                xor         ecx,        ecx
                                call        _start.div_atoi_section_1

.check_1:
                                ; Last few blocks remain...
                                ; ask for input 2
                                mov         eax,        4
                                mov         ebx,        1
                                mov         ecx,        msg_2
                                mov         edx,        msg_len_2
                                int         0x80

                                ; read input 2
                                mov         eax,        3
                                mov         ebx,        0
                                mov         ecx,        y
                                mov         edx,        16
                                int         0x80

                                ; atoi input 2
                                xor         eax,        eax
                                xor         ecx,        ecx
                                call        _start.div_atoi_section_2

.check_2:
                                ; do div
                                mov         eax,        [x_num]
                                mov         ebx,        [y_num]
                                idiv        ebx
                                mov         [result],   eax

                                ; itoa result
                                mov         ecx,        10
                                mov         edi,        out_buf + 15
                                mov         byte        [edi],                      10
                                dec         edi

                                mov         eax,        [result]
                                xor         edx,        edx
                                call        _start.mul_itoa_section

.check_3:                                                                               ; Jeez, I think I feel 1% of what Subaru felt
                                ; print output msg
                                mov         eax,        4
                                mov         ebx,        1
                                mov         ecx,        msg_out
                                mov         edx,        msg_out_len
                                int         0x80
                                
                                ; print number...
                                mov         eax,        4
                                mov         ebx,        1
                                mov         ecx,        edi
                                mov         edx,        out_buf + 15
                                sub         edx,        ecx
                                int         0x80

                                ; add newline
                                mov         eax,        4
                                mov         ebx,        1
                                mov         ecx,        newline
                                mov         edx,        1
                                int         0x80

                                ; jmp to ng
                                jmp         ng

Rage_Quit:                                                                              ; wow, this sums up my emotion when I am writing this out!
                                ; Press any key to exit
                                mov         eax,        4
                                mov         ebx,        1
                                mov         ecx,        exit_lbl
                                mov         edx,        exit_lbl_len
                                int         0x80

                                ; Take dummy input
                                mov         eax,        3
                                mov         ebx,        0
                                mov         ecx,        exit_buf
                                mov         edx,        16
                                int         0x80

                                ; safe exit bro
                                mov         eax,        1
                                xor         ebx,        ebx
                                int         0x80

ng:                                                                                     ; ....because legends never die eh? or you are just a masochist
                                ; ask if the user wants to continue or quit
                                mov         eax,        4
                                mov         ebx,        1
                                mov         ecx,        ng_lbl_1
                                mov         edx,        ng_lbl_len
                                int         0x80

                                mov         eax,        4
                                mov         ebx,        1
                                mov         ecx,        ng_lbl_2
                                mov         edx,        ng_lbl_len_2
                                int         0x80

                                mov         eax,        4
                                mov         ebx,        1
                                mov         ecx,        ng_lbl_3
                                mov         edx,        ng_lbl_len_3
                                int         0x80
                                
                                ; read input from user
                                mov         eax,        3
                                mov         ebx,        0
                                mov         ecx,        ng_buf
                                mov         edx,        16
                                int         0x80

                                ; take 1 if the user wants to continue
                                cmp         byte        [ng_buf],                   '1'

                                ; jmp Dilapidated_Temple
                                je          Dilapidated_Temple

                                ; else
                                ; jmp Rage_Quit
                                jne         Rage_Quit

Send_Him_To_Detroit:                                                                    ; For not obeying the rules....you, the sussy baka shall be punished!
                                ; write punish msg
                                mov         eax,        4
                                mov         ebx,        1
                                mov         ecx,        punish_fool
                                mov         edx,        punish_fool_len
                                int         0x80
                                jmp         Rage_Quit

Dilapidated_Temple:                                                                     ; This one is our menu, why? well, it would have helped me if emma told there was a cave to reach Gennichiro
                                ; WRITING MENU STARTS HERE
                                mov         eax,        4
                                mov         ebx,        1
                                mov         ecx,        mnu_dashes
                                mov         edx,        mnu_dashes_len
                                int         0x80

                                mov         eax,        4
                                mov         ebx,        1
                                mov         ecx,        mnu_lbl_1
                                mov         edx,        mnu_lbl_len
                                int         0x80

                                mov         eax,        4
                                mov         ebx,        1
                                mov         ecx,        mnu_lbl_2
                                mov         edx,        mnu_lbl_len_2
                                int         0x80
                                
                                mov         eax,        4
                                mov         ebx,        1                                              ; Oh don't I love to needlessly repeat myself 
                                mov         ecx,        mnu_lbl_3
                                mov         edx,        mnu_lbl_len_3
                                int         0x80
                                
                                mov         eax,        4
                                mov         ebx,        1
                                mov         ecx,        mnu_lbl_4
                                mov         edx,        mnu_lbl_len_4
                                int         0x80
                                
                                mov         eax,        4
                                mov         ebx,        1
                                mov         ecx,        mnu_lbl_5
                                mov         edx,        mnu_lbl_len_5
                                int         0x80
                                
                                mov         eax,        4
                                mov         ebx,        1
                                mov         ecx,        mnu_lbl_6
                                mov         edx,        mnu_lbl_len_6
                                int         0x80
                                
                                mov         eax,        4
                                mov         ebx,        1
                                mov         ecx,        mnu_dashes
                                mov         edx,        mnu_dashes_len
                                int         0x80
                                ; WRITING MENU ENDS HERE

                                ; Ask for user input
                                mov         eax,        3
                                mov         ebx,        1
                                mov         ecx,        input_buf
                                mov         edx,        16
                                int         0x80

                                ; TIme to save the world samurai...
                                cmp         byte        [input_buf],            '1'
                                je          Ashina_Outskirts                                     ; Add Section

                                cmp         byte        [input_buf],            '2'
                                je          Ashina_Dojo                                          ; Subtraction Section

                                cmp         byte        [input_buf],            '3'
                                je          Gun_Fort                                             ; Multiplication Section

                                cmp         byte        [input_buf],            '4'
                                je          Fountainhead_Palace                                  ; Division Section

                                cmp         byte        [input_buf],            '5'
                                je          Rage_Quit                                            ; Exit Section

                                jne         Send_Him_To_Detroit                                 ; Default Section