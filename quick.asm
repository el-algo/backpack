section .text
    global qs

qs:
    mov rax, rsi
    mov rbx, rdx
    
    imul rax, 4
    imul rbx, 4
    jmp qs_start

done:
    ret

qs_start:
    push rax ; Inicio
    push rbx ; Fin
    
    add rax, rbx
    mov rdx, 0
    mov rcx, 2
    div rcx

    mov edx, [rdi + rax] ; pivote
    pop rbx ; fin

    pop rax ; inicio
    mov rcx, rax ; izq

    do:
        inc_izq:
            ; arr[izq] < pivote
            cmp [rdi + rcx], edx
            jge end_inc_izq

            ; izqz < fin
            cmp rcx, rbx
            jge end_inc_izq

            ; izq++
            add rcx, 4
            jmp inc_izq
        end_inc_izq:
            push rcx
            mov rcx, rbx ; der

        dec_der:
            ; arr[der] > pivote
            cmp [rdi + rcx], edx
            jle end_dec_der

            ; der > inicio
            cmp rcx, rax
            jle end_dec_der

            ; der--
            sub rcx, 4
            jmp dec_der
        end_dec_der:
        
        pop rdx ; izq
        
        cmp rdx, rcx
        jg end_while
        
        ; Intercambio de izq a der
        mov rsi, [rdi + rcx]
        xchg rsi, [rdi + rdx]
        mov [rdi + rcx], rsi
        
        add rdx, 4
        sub rcx, 4
    
    ; while(izq <= der)
    cmp rdx, rcx
    jle do
    
    end_while:
    
    first_rec:
    ; if(inicio <= der)
    cmp rax, rcx
    jl second_rec
    ; arr
    ; inicio
    ; der
    mov rax, rax ; no operation
    mov rbx, rcx
    jmp qs_start

    second_rec:
    ; if(fin > izq)
    cmp rbx, rdx
    jle done
    ; arr
    ; izq
    ; fin
    mov rax, rcx
    mov rbx, rbx ; no operation
    jmp qs_start