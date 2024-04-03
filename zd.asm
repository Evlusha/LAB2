section .data
    text db 'qaq', '._. ', '3', '2'
    size dd 4
    uniqueTextCount dd 0

section .text
    global _start

    _start:
        mov eax, size
        sub eax, 1
        mov ecx, eax
        mov ebx, 0
    loop_start:
        mov edx, ebx
        mov esi, text
        add esi, edx
        mov edi, [esi]
        call SortString
        mov esi, eax

        call THashSet_Add
        add ebx, 4
        loop loop_start


        call THashSet_Count


        mov eax, uniqueTextCount

        mov ebx, 1
        mov eax, 4
        int 0x80

        mov eax, 1
        xor ebx, ebx
        int 0x80

SortString:
    ; implementation of SortString function

THashSet_Add:
    ; implementation of THashSet_Add function

THashSet_Count:
    ; implementation of THashSet_Count function
