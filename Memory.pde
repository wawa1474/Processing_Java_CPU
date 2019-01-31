RAM RAM_work;
int RAM_workSize = 1048576*4;//4 MB of ram?//65536

RAM RAM_video;
int RAM_videoSize = 65536;

RAM RAM_stack;
int RAM_stackSize = 65536;//?


class RAM{//RAM
  char contents[];
  int pointer = 0;//memory pointer
  int indX = 0;//index register X
  int indY = 0;//index register Y
  
  public RAM(int size){
    this.contents = new char[size];
  }
  
  void push(int c){
    this.contents[this.pointer] = char(c);
    this.pointer++;
  }
  
  int pop(){
    this.pointer--;
    return this.contents[this.pointer];
  }
}

//RAM_main.pointer - Program Counter
//RAM_stack.pointer - Stack Pointer
//RAM_video.pointer - ?

int regWP;//Workspace Pointer Register

int regAM;//Adressing Mode Register
/*
used to change what group of addressing modes are used
?are we using the more useful ones or the weird ones?
have some amount of addressing mode information be part of the opcodes
but keep it to a minimum number of bits (2-4?)
*/

int regST;//Status Register
/*
BIT    VALUE    HEX    INVERSE   MEANING
0      1        0001 - FFFE      Carry
1      2        0002 - FFFD      Zero
2      4        0004 - FFFB      Borrow
3      8        0008 - FFF7      Negative
4      16       0010 - FFEF      Half Carry
5      32       0020 - FFDF      Quarter Carry
6      64       0040 - FFBF      Three-Quarter Carry
7      128      0080 - FF7F      NONE
8      256      0100 - FEFF      NONE
9      512      0200 - FDFF      NONE
a      1024     0400 - FBFF      NONE
b      2048     0800 - F7FF      NONE
c      4096     1000 - EFFF      NONE
d      8192     2000 - DFFF      NONE
e      16384    4000 - BFFF      NONE
f      32768    8000 - 7FFF      NONE
*/
  
void incPC(){RAM_work.pointer++; if(RAM_work.pointer >= RAM_workSize){RAM_work.pointer = 0;}}
void decPC(){if(RAM_work.pointer <= 0){RAM_work.pointer = RAM_workSize;} RAM_work.pointer--;}