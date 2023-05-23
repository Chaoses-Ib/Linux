# xv6
[Wikipedia](https://en.wikipedia.org/wiki/Xv6)

Implementations:
- RISC-V: [mit-pdos/xv6-riscv](https://github.com/mit-pdos/xv6-riscv)
- x86: [mit-pdos/xv6-public](https://github.com/mit-pdos/xv6-public)
  - [mit-pdos/xv6-book: Commentary for xv6-public](https://github.com/mit-pdos/xv6-book)
    - [xv6 - DRAFT as of September 4, 2018](https://pdos.csail.mit.edu/6.828/2018/xv6/book-rev11.pdf)
  - [xv6-annotated: A detailed guide to the xv6 code.](https://github.com/palladian1/xv6-annotated)
  - [pandax381/xv6-net: xv6 OS with TCP/IP Network Stack](https://github.com/pandax381/xv6-net)
- x86-64: [jserv/xv6-x86_64](https://github.com/jserv/xv6-x86_64)

[mwfj/Operating_System-xv6: This Repo is the assignments of Advanced Operating System(Based on xv6)](https://github.com/mwfj/Operating_System-xv6/tree/master)

[massoudsalem/xv6: This is our Operating systems course project.](https://github.com/massoudsalem/xv6)

## user.h
- `gets()` 遇到 EOF 不会返回 null，且会复制遇到的第一个 `\n` 或 `\r` 到 buf。

  如果需要识别 EOF，只能使用 `read()` 手动读取，或使用修复版本的 `gets()`：
  ```c
  // Modified from ulib.c
  char* gets_nullable(char *buf, int max)
  {
    int i, cc;
    char c;
  
    for(i=0; i+1 < max; ){
      cc = read(0, &c, 1);
      if(cc < 1)
        return NULL;
      buf[i++] = c;
      if(c == '\n' || c == '\r')
        break;
    }
    buf[i] = '\0';
    return buf;
  }
  ```
- 支持 stderr：

  ```c
  if(open("console", O_RDWR) < 0){
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  dup(0);  // stderr
  ```
  ```c
  #define STDIN 0
  #define STDOUT 1
  #define STDERR 2
  ```
