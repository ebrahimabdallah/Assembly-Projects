```
.MODEL SMALL
.STACK 100H
.DATA
 

    OUTPUT_HORIZONTAL_LINE DB 10, 13, 205, 205, 205, 205, 205, 205, 205, 205, 205, 205, 205, 205, 205, 205, 205, 205, 205, 205, 205, 205, 205, 205, 205, 205, 205, 205, 205, 205, 205, 205, 205, "$" 
    OUTPUT DB 10, 13, "WELCOME TO CHECK UP PAGE ","$"
     newline db 13,10,'$' 
    OUTPUT_CHARACTER DB 10, 13, "Plase Enter Your Information ","$"
   ;---------------------------------------------------------------------- 
  ;introduction of illnesses
  
  DEFINE   DB 13 ,10,  'Muscular atrophy is the loss or thining of your muscle tissue,muscle atrophy occure due to malnutrition ,age ,genetics,a lack of physical activity or critain medical condition ','$'
       MSG  DB 13,10, '      Enter Your Name Plase :  $'
       STR1 DB  255 DUP('$') ; input name of user
       
       AG  DB 13,10, '     Enter Your ADG Plase :  $'      
       STR2 DB  255 DUP('$') 
       
       DIS  DB 13,10, '    Do you suffer from pre-existing diseases? (a-YSE      b-NO) ',' $'
      
       TRUE DB 13,10,'     ENTEER THE DISS    ','$'
        
        STR4 DB 255 DUP ('$')
      
        FALSE DB 13,10,'           GO TO NEXT STEP ','$'
       valid db 10,"please choose a or b",10,"$"
        CHK DB 13 ,10, '           Answer the questions           ','$'
     
        ;CHOOSE1 DB 13 ,10, '              1-muscular dystrophy                        ','$' 
      
        CHOOSE2 DB 13 ,10, '            *************MUSCLE ATROPHY******************                              ','$' 
   
        TASK1 DB 13,10 ,'-Is there one arm or one leg is smaller than the other?        ','$'
        S_TASK1 DB 13,10, '       -a)YES      -b)NO  ','$'

        TASK2 DB 13,10 ,'-Do you feel diffcult to swallow or speaking?        ','$'
          S_TASK2 DB 13,10, '       -a)YES     -b)NO  ','$'
        
          TASK3 DB 13,10 ,'-Do you feel gradual memory loss ?        ','$'
          S_TASK3 DB 13,10, '       -a)YES      -b)NO  ','$'
        
          TASK4 DB 13,10 ,'-Do you feel diffcult to breathing ?       ','$'
          S_TASK4 DB 13,10, '       -a)YES      -b)NO  ','$'
        
          TASK5 DB 13,10 ,'-Do you constantly feel twitching or shaking muscles?        ','$'
          S_TASK5 DB 13,10, '       -b)YES     -b)NO  ','$'
        
          TASK6 DB 13,10 ,'-Do you feel movement problems -such as difficulty sitting up ,crawling or walking?        ','$'
          S_TASK6 DB 13,10, '       -a)YES      -b)NO  ','$'
        
          TASK7 DB 13,10 ,'-DO you feel delay gross motor skills?       ','$'
          S_TASK7 DB 13,10, '       -a)YES      -b)NO  ','$'
        
          TASK8 DB 13,10 ,'-Have you done any medical tests before?        ','$'
          S_TASK8 DB 13,10, '       -a)YES      -b)NO   ','$'
        
          resualt DB 13,10, '>> the resualt examination ','$'
          THANK DB 13,10  ,'-->My brother, you are fine, but please keep exercising, eating, and a healthy environment, and do medical tests monthly, and if you feel an increase in these symptoms, visit the doctor immediately','$'
          
          FAIL DB 13,10  ,'-->My brother, I am sorry to tell you that you may have this disease, but do not worry, you are in the initial stage of the disease and you can recover quickly. Please go to the doctor immediately and do all the tests.','$'
          FAIL2  DB 13,10  ,'-->Illness is not the end of life, but a test to measure our endurance and patience. Be strong, my brother','$'
    
          BACK DB 13,10 , 'Do you want to go back to the main page?   a-YES   b-NO ','$' 
       
          CLOSE DB 13,10 , 'THANK YOU  ','$'    
           
      ;-------------------------------------------------------------------------------------------------------------------------------
          .CODE
     MAIN PROC FAR 
    .STARTUP
    
   
    
    call READ  ;show general inforamation
    call AGE ;input age 
    call TESTS ; some question
    call DISS_TYPE ;show the name of the disease
      CALL CHOO_DIS ;We ask about symptoms
      CALL BACKTO ; if close or complete 
      
        .EXIT
         READ proc
         
         LEA DX, OUTPUT_HORIZONTAL_LINE
    MOV AH, 09H
    INT 21H
    LEA DX, OUTPUT
    MOV AH, 09H


INT 21H  
    
    LEA DX, newline
    MOV AH, 09H
    INT 21H
    ; DEfination of disease
     
     LEA DX, newline
    MOV AH, 09H
    INT 21H 
     
     LEA DX, DEFINE
     MOV AH,09H
     INT 21H 
    
    LEA DX, OUTPUT_CHARACTER
    MOV AH, 09H
    INT 21H
    
    
    
    LEA DX, OUTPUT_HORIZONTAL_LINE
    MOV AH, 09H
    INT 21H 
         
         
           LEA DX,MSG
          MOV AH,09H
          INT 21H
          
          LEA DX,STR1
          MOV AH,0AH
          INT 21H
          ret
          READ  endp
        
          AGE proc  ; input age
          LEA DX,AG
          MOV AH,09H
          INT 21H
          
          LEA DX,STR2
          MOV AH,0AH
          INT 21H
          ret
          AGE endp
   ;----------------------------------------------------------------
           TESTS proc
            LEA DX, newline
            MOV AH, 09H
            INT 21H
           
          LEA DX,DIS
          MOV AH,09H


           INT 21H
            
          MOV AH,01H
          INT 21H
                          
          CMP al,61h
            
            JE T
            JNE F
      
            T:    ; He presents him with a question, what is the disease, and asks for an answer
       LEA DX,TRUE
       MOV AH,09H
       INT 21H
       
       MOV AH,0AH
       INT 21H
       
       JMP STOPS
     
       F: 
       LEA DX,FALSE
       MOV AH,09H
       INT 21H
       STOPS:
          TESTS  endp
          ;---------------------------------------------------------------
          DISS_TYPE proc
            LEA DX, newline
            MOV AH, 09H
            INT 21H  
                
            LEA DX,CHOOSE2 ;show the name of the disease
            MOV AH, 09H
            INT 21H
                
            LEA DX,CHK
            MOV AH, 09H
            INT 21H 
             
            lea dx,valid
            mov ah,09h
            int 21h
            
            DISS_TYPE endp
            
         ;------------------------------------case --------------------------------------------------------------------   
         
         
           CHOO_DIS PROC
           
            LEA DX, newline
            MOV AH, 09H
            INT 21H
           
    ; task 1
          LEA DX, newline
            MOV AH, 09H
            INT 21H
           
            LEA DX,TASK1
            MOV AH, 09H
            INT 21H
            
            LEA DX,S_TASK1
            MOV AH, 09H
            INT 21H
            
          MOV AH,01H
          INT 21H
        
          
          ;count
          mov cl , 0
          cmp al , 62h
          je more
          jne notmore
          
          
          more: 
          inc cl
          
         notmore:
          
         
      mov dl , cl   
      add dl , 30h 
      
      ;end count
            ;TASK 2
          
            LEA DX, newline
            MOV AH, 09H
            INT 21H
           
            LEA DX,TASK2
            MOV AH, 09H
            INT 21H
            
            LEA DX,S_TASK2
            MOV AH, 09H
            INT 21H
            
          MOV AH,01H
          INT 21H
        
           ;count
          
          cmp al , 61h
          je more1
          jne notmore1
          
          
          more1: 
          inc cl
          
          notmore1:
          
         
      mov dl , cl   
      add dl , 30h 
       
      ;end count
          
      ;TASK 3
            LEA DX, newline
            MOV AH, 09H
            INT 21H
           
            LEA DX,TASK3
            MOV AH, 09H
            INT 21H
            
            LEA DX,S_TASK3
            MOV AH, 09H
            INT 21H
            
          MOV AH,01H
          INT 21H
          
       ;count
          
          cmp al , 61h
          je more2
          jne notmore2
          
          
          more2:
          inc cl
          
          notmore2:
          
         
      mov dl , cl   
      add dl , 30h 
     
      ;end count
      
          ;TASK 4
          
            LEA DX, newline
            MOV AH, 09H
            INT 21H
           
            LEA DX,TASK4
            MOV AH, 09H


INT 21H
            
            LEA DX,S_TASK4
            MOV AH, 09H
            INT 21H
            
          MOV AH,01H
          INT 21H
          
          ;count
          
          cmp al , 61h
          je more3
          jne notmore3
          
          
          more3: 
          inc cl
          
          notmore3:
          
         
      mov dl , cl   
      add dl , 30h 
     
      ;end count
          
          ;TASK 5
          
          LEA DX, newline
            MOV AH, 09H
            INT 21H
           
            LEA DX,TASK5
            MOV AH, 09H
            INT 21H
            
            LEA DX,S_TASK5
            MOV AH, 09H

         INT 21H
            
          MOV AH,01H
          INT 21H
          
          ;count
          
          cmp al , 61h
          je more4
          jne notmore4
          more4: 
          inc cl
          notmore4:   
      mov dl , cl   
      add dl , 30h 
       
      ;end count
      
          ; TASK 6
          
            LEA DX, newline
            MOV AH, 09H
            INT 21H
           
            LEA DX,TASK6
            MOV AH, 09H
            INT 21H
            
            LEA DX,S_TASK6
            MOV AH, 09H
            INT 21H
            
          MOV AH,01H
          INT 21H
          
          ;count
          
          cmp al , 61h
          je more5
          jne notmore5
          
          
          more5: 
          inc cl
          
          notmore5:
          
         
      mov dl , cl   
      add dl , 30h 
      
      ;end count
          ;TASK 7
           LEA DX, newline
            MOV AH, 09H
            INT 21H
           
            LEA DX,TASK7
            MOV AH, 09H
            INT 21H
            
            LEA DX,S_TASK7
            MOV AH, 09H
            INT 21H
            
          MOV AH,01H
          INT 21H
          ;TASK 7
           LEA DX, newline
            MOV AH, 09H
            INT 21H
           
            LEA DX,TASK8
            MOV AH, 09H
            INT 21H
            
            LEA DX,S_TASK8
            MOV AH, 09H
            INT 21H
            
          MOV AH,01H
          INT 21H
          ; count
          cmp al , 61h
          je more7
          jne notmore7
          
          
          more7: 
          inc cl
          
          notmore7:
      mov dl , cl   
      add dl , 30h
      
      
      ;end count
      
        LEA DX, newline
            MOV AH, 09H
            INT 21H
      
      lea dx,resualt
      mov ah,09h
      int 21h
      
      cmp al , 63h
      je more8
      jne notmore8
          
          
          more8: 
          inc cl
          
          notmore8:
      mov dl , cl   
      add dl , 30h
      
      ; mov ah , 2h   to print the resualt of number 
      ;int 21h  
      
     ;   compare resualt of answer to know the case
      cmp DL,35h
      JG NON
      JNG GOOD
          
          NON:  
          LEA DX,FAIL
          mov ah,09h
          int 21h
          
          LEA DX,FAIL2
          mov ah,09h
          int 21h 
          jmp finall
          
        
          GOOD:
          LEA DX,THANK
          mov ah,09h
          int 21h
       
        LEA DX, OUTPUT_HORIZONTAL_LINE
        MOV AH, 09H
        INT 21H 
        finall: 
          LEA DX, BACK
       MOV AH, 09H
       INT 21H
       
       mov ah,01
       int 21h
       
       CHOO_DIS ENDP
     
     
   ;----------------------------------------------------------------------------------------------------------
     BackTO proc 
     
            MOV BL,61H
            CMP BL,AL
            
            JE complate
            JNE finish
      
        complate:
       
      
      call DISS_TYPE
      CALL CHOO_DIS
      CALL BACKTO
        
        JMP TOPS
     
       finish: 
       LEA DX, CLOSE
       MOV AH, 09H
       INT 21H
     
       TOPS:
       
       BACKTO ENDP      
    ;---------------------------------------------------------------------------------
    MAIN ENDP
    END MAIN
    ```
