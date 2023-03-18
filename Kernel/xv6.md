# xv6
[Wikipedia](https://en.wikipedia.org/wiki/Xv6)

Implementation:
- RISC-V: [mit-pdos/xv6-riscv](https://github.com/mit-pdos/xv6-riscv)
- x86: [mit-pdos/xv6-public](https://github.com/mit-pdos/xv6-public)
  - [pandax381/xv6-net: xv6 OS with TCP/IP Network Stack](https://github.com/pandax381/xv6-net)
- x86-64: [jserv/xv6-x86_64](https://github.com/jserv/xv6-x86_64)

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
  