# ATOI-Assembly-Nasm-64
![image](https://user-images.githubusercontent.com/87600765/141811378-69378ebe-16de-4f70-90f6-9b27d2206ce2.png)
### Here is an atoi function I did. It's using the command line arguments and will add all the args that you have put
#### What is an atoi ? atoi mean ascii to integer. This function is used for convert a string into an integer. This code will learn you how to make an atoi but also how to print an integer and how the command line argument works. Here is some ressources for understand how an atoi is working. 
- https://en.wikipedia.org/wiki/Positional_notation
#### In the code. You can realise that I used the register BL. The register BL is a 8 bits register. It is used for not wasting space and converting the charcatere bytes by bytes. You can also notify that in the part of the code I have put
```s
mov rdx, 0
``` 
#### this was made for put the value of 0 into rdx and be sure that the division is made correctly. If there is another value than 0 into rdx the rdx will concatenate with the rax register and the result will be falsified. 
#### Command line arguments : first we pop rcx for counting the number of arguments the user have put. Then we pop the program name, for example (./program) and then we substract 1 to the counter because the counter takes the program name with the arguments. 
#### I hope u will enjoy 
#### for compiling the program
```bash
 nasm -f elf64 -o program.o program.asm && ld program.o -o program
 ```
 #### for run it 
 ```bash
 ./program arg1 arg2 arg3
 ```  
 #### you can put whatever of args you want. 
 
