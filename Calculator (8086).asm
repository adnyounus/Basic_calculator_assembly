.model small
.stack 100h
.data
a1 dw ?   ;num1
a2 dw ?   ;num2
a3 dw ?   ;result
x db ?            
y dw ?   
z dw ?  
sa1 dw ?   ;num1
sa2 dw ?   ;num2
sa3 dw ?   ;result
sx db ?            
sy dw ?   
sz dw ?   
ma1 dw ?   ;num1
ma2 dw ?   ;num2
ma3 dw ?   ;result
mx db ?            
my dw ?   
mz dw ? 
dia1 dw ?   ;num1
dia2 dw ?   ;num2
dia3 dw ?   ;result
dix db ?            
diy dw ?   
diz dw ?
addition db 'Press 1 for Addition$'
substraction db 'Press 2 for Subtraction$'
multi db 'Press 3 for Multiplication$'
division db 'Press 4 for Division$'
close db 'Press 5 for Close$'
choice db 'Enter your choice : $'  
num1 db 'Enter Number 1 : $'
num2 db 'Enter Number 2 : $'
res db 'Result is       : $'

.code

main proc
    
    
    mov ax, data
    mov ds, ax
     
    main1:
    
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    
    
    mov ah, 9
    lea dx, addition
    int 21h
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h 
    
    mov ah, 9
    lea dx, substraction
    int 21h
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h     
     
    mov ah, 9 
    lea dx, multi
    int 21h
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h       
    
    
    mov ah, 9
    lea dx, division
    int 21h
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h       
    
    mov ah, 9
    lea dx, close
    int 21h 
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    
    
    mov ah, 9
    lea dx, choice
    int 21h
     
            
    mov ah, 1
    int 21h
    sub al, 30h 
   
    
    
    cmp al, 1           
    je ADD1
    cmp al, 2
    je SUB1
    cmp al, 3
    je MUL1
    cmp al, 4
    je DIV1
    cmp al, 5
    je end
   
   
   ADD1:
   
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    
   
   
    mov ax,0
    mov bx,0
    mov cx,0
    mov dx,0
   
    mov dh, 0
    mov x, dh
     
    mov ah, 9
    lea dx, num1
    int 21h
    
    adn:
    mov ax, 0
    mov bx, 10
    mov cx, ax
     
    input1:
    mov ah, 1
    int 21h
    cmp al, 13
    je input2 
    sub al, 30h
    mov ah, 0
    mov a3, cx
    mov cx, ax
    mov ax, a3
    mul bx
    add ax, cx
    mov cx, ax
    jmp input1
    
    input2:
    add x,1
    mov dh, x
    cmp dh, 2
    je input3
    mov a1, cx
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    
    mov ah, 9
    lea dx, num2
    int 21h
    
    jmp adn
    
    
    input3:
    mov a2, cx 
    
    sum:
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    
    mov ah, 9
    lea dx, res
    int 21h
    
    mov ax, a1
    mov bx, a2
    add ax, bx
    mov a3, ax
    mov cx, ax
    mov ax, 1
    mov bx, 10
    mov z, ax
    
    print1:
    mov dx, 0
    mov ax, cx
    div bx
    mov cx, ax
    cmp cx, 0
    je print2 
    mov ax, z
    mul bx
    mov z, ax
    jmp print1
    
    print2:
    mov dx, 0
    mov ax, a3
    mov bx, z
    cmp bx, 0
    je main1
    div bx
    mov cx, ax
    mov ah, 2
    mov dx, cx
    add dl, 30h
    int 21h
    mov dx, 0
    mov ax, a3
    mov bx, z
    div bx
    mov a3, dx 
    mov dx, 0
    mov ax, z 
    mov bx, 10
    div bx
    mov z, ax 
    jmp print2 
    
    
   SUB1:
   
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    
   
   
    mov ax,0
    mov bx,0
    mov cx,0
    mov dx,0
  
    
    
    mov dh, 0
    mov sx, dh
     
    mov ah, 9
    lea dx, num1
    int 21h
    
    adnS:
    mov ax, 0
    mov bx, 10
    mov cx, ax
     
    input1S:
    mov ah, 1
    int 21h
    cmp al, 13
    je input2S 
    sub al, 30h
    mov ah, 0
    mov sa3, cx
    mov cx, ax
    mov ax, sa3
    mul bx
    add ax, cx
    mov cx, ax
    jmp input1S
    
    input2S:
    add sx,1
    mov dh, sx
    cmp dh, 2
    je input3S
    mov sa1, cx
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    
    mov ah, 9
    lea dx, num2
    int 21h
    
    jmp adnS
    
    
    input3S:
    mov sa2, cx 
    
    sumS:
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    
    mov ah, 9
    lea dx, res
    int 21h
    
    mov ax, sa1
    mov bx, sa2
    sub ax, bx
    mov sa3, ax
    mov cx, ax
    mov ax, 1
    mov bx, 10
    mov sz, ax
    
    print1S:
    mov dx, 0
    mov ax, cx
    div bx
    mov cx, ax
    cmp cx, 0
    je print2S 
    mov ax, sz
    mul bx
    mov sz, ax
    jmp print1S
    
    print2S:
    mov dx, 0
    mov ax, sa3
    mov bx, sz
    cmp bx, 0
    je main1
    div bx
    mov cx, ax
    mov ah, 2
    mov dx, cx
    add dl, 30h
    int 21h
    mov dx, 0
    mov ax, sa3
    mov bx, sz
    div bx
    mov sa3, dx 
    mov dx, 0
    mov ax, sz 
    mov bx, 10
    div bx
    mov sz, ax 
    jmp print2S
    
   MUL1:
   
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    
   
   
    mov ax,0
    mov bx,0
    mov cx,0
    mov dx,0
   
    mov dh, 0
    mov mx, dh
     
    mov ah, 9
    lea dx, num1
    int 21h
    
    adnM:
    mov ax, 0
    mov bx, 10
    mov cx, ax
     
    Minput1:
    mov ah, 1
    int 21h
    cmp al, 13
    je Minput2 
    sub al, 30h
    mov ah, 0
    mov ma3, cx
    mov cx, ax
    mov ax, ma3
    mul bx
    add ax, cx
    mov cx, ax
    jmp Minput1
    
    Minput2:
    add mx,1
    mov dh, mx
    cmp dh, 2
    je Minput3
    mov ma1, cx
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    
    mov ah, 9
    lea dx, num2
    int 21h
    
    jmp adnM
    
    
    Minput3:
    mov ma2, cx 
    
    Msum:
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    
    mov ah, 9
    lea dx, res
    int 21h
    
    mov ax, ma1
    mov bx, ma2
    mul  bx
    mov ma3, ax
    mov cx, ax
    mov ax, 1
    mov bx, 10
    mov mz, ax
    
    Mprint1:
    mov dx, 0
    mov ax, cx
    div bx
    mov cx, ax
    cmp cx, 0
    je Mprint2 
    mov ax, mz
    mul bx
    mov mz, ax
    jmp Mprint1
    
    Mprint2:
    mov dx, 0
    mov ax, ma3
    mov bx, mz
    cmp bx, 0
    je main1
    div bx
    mov cx, ax
    mov ah, 2
    mov dx, cx
    add dl, 30h
    int 21h
    mov dx, 0
    mov ax, ma3
    mov bx, mz
    div bx
    mov ma3, dx 
    mov dx, 0
    mov ax, mz 
    mov bx, 10
    div bx
    mov mz, ax 
    jmp Mprint2 
    
    
    DIV1:
    
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    
   
   
    mov ax,0
    mov bx,0
    mov cx,0
    mov dx,0
   
    mov dh, 0
    mov dix, dh
     
    mov ah, 9
    lea dx, num1
    int 21h
    
    adnD:
    mov ax, 0
    mov bx, 10
    mov cx, ax
     
    input1D:
    mov ah, 1
    int 21h
    cmp al, 13
    je input2D 
    sub al, 30h
    mov ah, 0
    mov dia3, cx
    mov cx, ax
    mov ax, dia3
    mul bx
    add ax, cx
    mov cx, ax
    jmp input1D
    
    input2D:
    add dix,1
    mov dh, dix
    cmp dh, 2
    je input3D
    mov dia1, cx
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    
    mov ah, 9
    lea dx, num2
    int 21h
    
    jmp adnD
    
    
    input3D:
    mov dia2, cx 
    
    sumD:
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    
    mov ah, 9
    lea dx, res
    int 21h
    
    mov dx,0
    mov ax, dia1
    mov bx, dia2
    div bx
    mov dia3, ax
    mov cx, ax
    mov ax, 1
    mov bx, 10
    mov diz, ax
    
    print1D:
    mov dx, 0
    mov ax, cx
    div bx
    mov cx, ax
    cmp cx, 0
    je print2D 
    mov ax, diz
    mul bx
    mov diz, ax
    jmp print1D
    
    print2D:
    mov dx, 0
    mov ax, dia3
    mov bx, diz
    cmp bx, 0
    je main1
    div bx
    mov cx, ax
    mov ah, 2
    mov dx, cx
    add dl, 30h
    int 21h
    mov dx, 0
    mov ax, dia3
    mov bx, diz
    div bx
    mov dia3, dx 
    mov dx, 0
    mov ax, diz 
    mov bx, 10
    div bx
    mov diz, ax 
    jmp print2D 
    
    
    
    
    end:
    mov ah, 4ch
    int 21h
endp main
end main