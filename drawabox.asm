org 100h 
jmp _start

_start:  
call clearscreen
mov di, '!'
push di
mov di, 'o'
push di
mov di, 'm'
push di
mov di, 'e'
push di
mov di, 'd'
push di
mov di, ' '
push di
mov di, 'g'
push di
mov di, 'n'
push di
mov di, 'i'
push di
mov di, 'w'
push di
mov di, 'a'
push di
mov di, 'r'
push di
mov di, 'd'
push di
mov di, ' '
push di
mov di, 'x'
push di
mov di, 'o'
push di
mov di, 'B'
push di    
mov bl, 13
mov bh, 11
mov cx, 17      
call writeLine
mov ax, 40  ; 
mov dx, 20 
mov bl, 2   
mov bh, 2   
mov di, '*'
call drawbox                                  
mov dl, 0
mov dh, 23
mov bh, 0
mov ah, 2
int 10h     
jmp _finish

_finish:
mov ax, 4c00h 
int 21h


drawbox proc  
pop si
mov cx, ax
drawTopSide:  
inc bl
call writeChar
loop drawtopSide    
mov cx, dx
drawRightSide:
inc bh  
call writeChar
loop drawRightSide 
mov cx, ax
drawBottomSide:
dec bl
call writeChar
loop drawBottomSide    
mov cx, dx     
drawLeftSide:       
dec bh
call writeChar
loop drawLeftSide 
pop di
mov dl, 0
mov dh, 0
mov bh, 0
mov ah, 2
int 10h  
push si
ret
drawbox endp

writeLine proc   
pop si    
mov dl, bl
mov dh, bh
mov bh, 0
mov ah, 2
int 10h 
xor dx, dx
writeCharLoop:
pop dx
xor dh, dh
mov ah, 2
int 21h
loop writeCharLoop    
push si
ret   
writeLine endp

writeChar proc  
push ax
push bx  
push dx
mov dl, bl
mov dh, bh
mov bh, 0
mov ah, 2
int 10h  
mov dx, di
xor dh, dh
mov ah, 2
int 21h
pop dx
pop bx  
pop ax
ret
writeChar endp 

clearscreen proc  
mov ah,0
mov al,3
int 10h        
ret
clearscreen endp

