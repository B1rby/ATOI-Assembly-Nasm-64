# ATOI-Assembly-Nasm-64
![image](https://user-images.githubusercontent.com/87600765/141811378-69378ebe-16de-4f70-90f6-9b27d2206ce2.png)
### Here is an atoi function I made. It uses the command line arguments and will add all the arguments you have placed.
#### What is an atoi ? Atoi means ascii to integer. This function is used for convert a string into an integer. This code will learn you how to make an atoi but also how to print an integer and how the command line argument works. Here is some ressources for understand how an atoi is working and how an integer is printing. 
- https://en.wikipedia.org/wiki/Positional_notation
#### In the code. You can see that I used the BL register. The BL register is an 8-bit register. It is used to avoid wasting space and to convert the characters into bytes. You can also notice that in the part of the code I have put
```s
mov rdx, 0
``` 
#### This was done to put the value 0 in rdx and to be sure that the division is done correctly. If there is a value other than 0 in rdx, the rdx will be concatenated with the rax register and the result will be distorted. 
#### Command line arguments : first we pop rcx for counting the number of arguments the user have placed. Then we pop the program name, for example (./program) and then we substract 1 to the counter because the counter takes the program name with the arguments. 
#### For compiling the program
```bash
 nasm -f elf64 -o program.o program.asm && ld program.o -o program
 ```
 #### For run it. And please note that you can put as many arguments as you want. 
 ```bash
 ./program arg1 arg2 arg3
 ```  

 
