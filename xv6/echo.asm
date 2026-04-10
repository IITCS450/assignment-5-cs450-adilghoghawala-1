
_echo:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 08             	sub    $0x8,%esp
  14:	8b 31                	mov    (%ecx),%esi
  16:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  for(i = 1; i < argc; i++)
  19:	83 fe 01             	cmp    $0x1,%esi
  1c:	7e 47                	jle    65 <main+0x65>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  1e:	8b 47 04             	mov    0x4(%edi),%eax
  21:	83 fe 02             	cmp    $0x2,%esi
  24:	74 2a                	je     50 <main+0x50>
  26:	bb 02 00 00 00       	mov    $0x2,%ebx
  2b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  30:	68 04 0a 00 00       	push   $0xa04
  35:	83 c3 01             	add    $0x1,%ebx
  38:	50                   	push   %eax
  39:	68 06 0a 00 00       	push   $0xa06
  3e:	6a 01                	push   $0x1
  40:	e8 bb 03 00 00       	call   400 <printf>
  45:	8b 44 9f fc          	mov    -0x4(%edi,%ebx,4),%eax
  49:	83 c4 10             	add    $0x10,%esp
  4c:	39 de                	cmp    %ebx,%esi
  4e:	75 e0                	jne    30 <main+0x30>
  50:	68 0b 0a 00 00       	push   $0xa0b
  55:	50                   	push   %eax
  56:	68 06 0a 00 00       	push   $0xa06
  5b:	6a 01                	push   $0x1
  5d:	e8 9e 03 00 00       	call   400 <printf>
  62:	83 c4 10             	add    $0x10,%esp
  exit();
  65:	e8 49 02 00 00       	call   2b3 <exit>
  6a:	66 90                	xchg   %ax,%ax
  6c:	66 90                	xchg   %ax,%ax
  6e:	66 90                	xchg   %ax,%ax

00000070 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  70:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  71:	31 c0                	xor    %eax,%eax
{
  73:	89 e5                	mov    %esp,%ebp
  75:	53                   	push   %ebx
  76:	8b 4d 08             	mov    0x8(%ebp),%ecx
  79:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  80:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  84:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  87:	83 c0 01             	add    $0x1,%eax
  8a:	84 d2                	test   %dl,%dl
  8c:	75 f2                	jne    80 <strcpy+0x10>
    ;
  return os;
}
  8e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  91:	89 c8                	mov    %ecx,%eax
  93:	c9                   	leave
  94:	c3                   	ret
  95:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  9c:	00 
  9d:	8d 76 00             	lea    0x0(%esi),%esi

000000a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	53                   	push   %ebx
  a4:	8b 55 08             	mov    0x8(%ebp),%edx
  a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  aa:	0f b6 02             	movzbl (%edx),%eax
  ad:	84 c0                	test   %al,%al
  af:	75 17                	jne    c8 <strcmp+0x28>
  b1:	eb 3a                	jmp    ed <strcmp+0x4d>
  b3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  b8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  bc:	83 c2 01             	add    $0x1,%edx
  bf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  c2:	84 c0                	test   %al,%al
  c4:	74 1a                	je     e0 <strcmp+0x40>
  c6:	89 d9                	mov    %ebx,%ecx
  c8:	0f b6 19             	movzbl (%ecx),%ebx
  cb:	38 c3                	cmp    %al,%bl
  cd:	74 e9                	je     b8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  cf:	29 d8                	sub    %ebx,%eax
}
  d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  d4:	c9                   	leave
  d5:	c3                   	ret
  d6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  dd:	00 
  de:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
  e0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  e4:	31 c0                	xor    %eax,%eax
  e6:	29 d8                	sub    %ebx,%eax
}
  e8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  eb:	c9                   	leave
  ec:	c3                   	ret
  return (uchar)*p - (uchar)*q;
  ed:	0f b6 19             	movzbl (%ecx),%ebx
  f0:	31 c0                	xor    %eax,%eax
  f2:	eb db                	jmp    cf <strcmp+0x2f>
  f4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  fb:	00 
  fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000100 <strlen>:

uint
strlen(const char *s)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 106:	80 3a 00             	cmpb   $0x0,(%edx)
 109:	74 15                	je     120 <strlen+0x20>
 10b:	31 c0                	xor    %eax,%eax
 10d:	8d 76 00             	lea    0x0(%esi),%esi
 110:	83 c0 01             	add    $0x1,%eax
 113:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 117:	89 c1                	mov    %eax,%ecx
 119:	75 f5                	jne    110 <strlen+0x10>
    ;
  return n;
}
 11b:	89 c8                	mov    %ecx,%eax
 11d:	5d                   	pop    %ebp
 11e:	c3                   	ret
 11f:	90                   	nop
  for(n = 0; s[n]; n++)
 120:	31 c9                	xor    %ecx,%ecx
}
 122:	5d                   	pop    %ebp
 123:	89 c8                	mov    %ecx,%eax
 125:	c3                   	ret
 126:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 12d:	00 
 12e:	66 90                	xchg   %ax,%ax

00000130 <memset>:

void*
memset(void *dst, int c, uint n)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	57                   	push   %edi
 134:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 137:	8b 4d 10             	mov    0x10(%ebp),%ecx
 13a:	8b 45 0c             	mov    0xc(%ebp),%eax
 13d:	89 d7                	mov    %edx,%edi
 13f:	fc                   	cld
 140:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 142:	8b 7d fc             	mov    -0x4(%ebp),%edi
 145:	89 d0                	mov    %edx,%eax
 147:	c9                   	leave
 148:	c3                   	ret
 149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000150 <strchr>:

char*
strchr(const char *s, char c)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	8b 45 08             	mov    0x8(%ebp),%eax
 156:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 15a:	0f b6 10             	movzbl (%eax),%edx
 15d:	84 d2                	test   %dl,%dl
 15f:	75 12                	jne    173 <strchr+0x23>
 161:	eb 1d                	jmp    180 <strchr+0x30>
 163:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 168:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 16c:	83 c0 01             	add    $0x1,%eax
 16f:	84 d2                	test   %dl,%dl
 171:	74 0d                	je     180 <strchr+0x30>
    if(*s == c)
 173:	38 d1                	cmp    %dl,%cl
 175:	75 f1                	jne    168 <strchr+0x18>
      return (char*)s;
  return 0;
}
 177:	5d                   	pop    %ebp
 178:	c3                   	ret
 179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 180:	31 c0                	xor    %eax,%eax
}
 182:	5d                   	pop    %ebp
 183:	c3                   	ret
 184:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 18b:	00 
 18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000190 <gets>:

char*
gets(char *buf, int max)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	57                   	push   %edi
 194:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 195:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 198:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 199:	31 db                	xor    %ebx,%ebx
{
 19b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 19e:	eb 27                	jmp    1c7 <gets+0x37>
    cc = read(0, &c, 1);
 1a0:	83 ec 04             	sub    $0x4,%esp
 1a3:	6a 01                	push   $0x1
 1a5:	56                   	push   %esi
 1a6:	6a 00                	push   $0x0
 1a8:	e8 1e 01 00 00       	call   2cb <read>
    if(cc < 1)
 1ad:	83 c4 10             	add    $0x10,%esp
 1b0:	85 c0                	test   %eax,%eax
 1b2:	7e 1d                	jle    1d1 <gets+0x41>
      break;
    buf[i++] = c;
 1b4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1b8:	8b 55 08             	mov    0x8(%ebp),%edx
 1bb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1bf:	3c 0a                	cmp    $0xa,%al
 1c1:	74 10                	je     1d3 <gets+0x43>
 1c3:	3c 0d                	cmp    $0xd,%al
 1c5:	74 0c                	je     1d3 <gets+0x43>
  for(i=0; i+1 < max; ){
 1c7:	89 df                	mov    %ebx,%edi
 1c9:	83 c3 01             	add    $0x1,%ebx
 1cc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1cf:	7c cf                	jl     1a0 <gets+0x10>
 1d1:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 1d3:	8b 45 08             	mov    0x8(%ebp),%eax
 1d6:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 1da:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1dd:	5b                   	pop    %ebx
 1de:	5e                   	pop    %esi
 1df:	5f                   	pop    %edi
 1e0:	5d                   	pop    %ebp
 1e1:	c3                   	ret
 1e2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1e9:	00 
 1ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	56                   	push   %esi
 1f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f5:	83 ec 08             	sub    $0x8,%esp
 1f8:	6a 00                	push   $0x0
 1fa:	ff 75 08             	push   0x8(%ebp)
 1fd:	e8 f1 00 00 00       	call   2f3 <open>
  if(fd < 0)
 202:	83 c4 10             	add    $0x10,%esp
 205:	85 c0                	test   %eax,%eax
 207:	78 27                	js     230 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 209:	83 ec 08             	sub    $0x8,%esp
 20c:	ff 75 0c             	push   0xc(%ebp)
 20f:	89 c3                	mov    %eax,%ebx
 211:	50                   	push   %eax
 212:	e8 f4 00 00 00       	call   30b <fstat>
  close(fd);
 217:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 21a:	89 c6                	mov    %eax,%esi
  close(fd);
 21c:	e8 ba 00 00 00       	call   2db <close>
  return r;
 221:	83 c4 10             	add    $0x10,%esp
}
 224:	8d 65 f8             	lea    -0x8(%ebp),%esp
 227:	89 f0                	mov    %esi,%eax
 229:	5b                   	pop    %ebx
 22a:	5e                   	pop    %esi
 22b:	5d                   	pop    %ebp
 22c:	c3                   	ret
 22d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 230:	be ff ff ff ff       	mov    $0xffffffff,%esi
 235:	eb ed                	jmp    224 <stat+0x34>
 237:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 23e:	00 
 23f:	90                   	nop

00000240 <atoi>:

int
atoi(const char *s)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	53                   	push   %ebx
 244:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 247:	0f be 02             	movsbl (%edx),%eax
 24a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 24d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 250:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 255:	77 1e                	ja     275 <atoi+0x35>
 257:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 25e:	00 
 25f:	90                   	nop
    n = n*10 + *s++ - '0';
 260:	83 c2 01             	add    $0x1,%edx
 263:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 266:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 26a:	0f be 02             	movsbl (%edx),%eax
 26d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 270:	80 fb 09             	cmp    $0x9,%bl
 273:	76 eb                	jbe    260 <atoi+0x20>
  return n;
}
 275:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 278:	89 c8                	mov    %ecx,%eax
 27a:	c9                   	leave
 27b:	c3                   	ret
 27c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000280 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	57                   	push   %edi
 284:	8b 45 10             	mov    0x10(%ebp),%eax
 287:	8b 55 08             	mov    0x8(%ebp),%edx
 28a:	56                   	push   %esi
 28b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 28e:	85 c0                	test   %eax,%eax
 290:	7e 13                	jle    2a5 <memmove+0x25>
 292:	01 d0                	add    %edx,%eax
  dst = vdst;
 294:	89 d7                	mov    %edx,%edi
 296:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 29d:	00 
 29e:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 2a0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2a1:	39 f8                	cmp    %edi,%eax
 2a3:	75 fb                	jne    2a0 <memmove+0x20>
  return vdst;
}
 2a5:	5e                   	pop    %esi
 2a6:	89 d0                	mov    %edx,%eax
 2a8:	5f                   	pop    %edi
 2a9:	5d                   	pop    %ebp
 2aa:	c3                   	ret

000002ab <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2ab:	b8 01 00 00 00       	mov    $0x1,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret

000002b3 <exit>:
SYSCALL(exit)
 2b3:	b8 02 00 00 00       	mov    $0x2,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret

000002bb <wait>:
SYSCALL(wait)
 2bb:	b8 03 00 00 00       	mov    $0x3,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret

000002c3 <pipe>:
SYSCALL(pipe)
 2c3:	b8 04 00 00 00       	mov    $0x4,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret

000002cb <read>:
SYSCALL(read)
 2cb:	b8 05 00 00 00       	mov    $0x5,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret

000002d3 <write>:
SYSCALL(write)
 2d3:	b8 10 00 00 00       	mov    $0x10,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret

000002db <close>:
SYSCALL(close)
 2db:	b8 15 00 00 00       	mov    $0x15,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret

000002e3 <kill>:
SYSCALL(kill)
 2e3:	b8 06 00 00 00       	mov    $0x6,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret

000002eb <exec>:
SYSCALL(exec)
 2eb:	b8 07 00 00 00       	mov    $0x7,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret

000002f3 <open>:
SYSCALL(open)
 2f3:	b8 0f 00 00 00       	mov    $0xf,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret

000002fb <mknod>:
SYSCALL(mknod)
 2fb:	b8 11 00 00 00       	mov    $0x11,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret

00000303 <unlink>:
SYSCALL(unlink)
 303:	b8 12 00 00 00       	mov    $0x12,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret

0000030b <fstat>:
SYSCALL(fstat)
 30b:	b8 08 00 00 00       	mov    $0x8,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret

00000313 <link>:
SYSCALL(link)
 313:	b8 13 00 00 00       	mov    $0x13,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret

0000031b <mkdir>:
SYSCALL(mkdir)
 31b:	b8 14 00 00 00       	mov    $0x14,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret

00000323 <chdir>:
SYSCALL(chdir)
 323:	b8 09 00 00 00       	mov    $0x9,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret

0000032b <dup>:
SYSCALL(dup)
 32b:	b8 0a 00 00 00       	mov    $0xa,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret

00000333 <getpid>:
SYSCALL(getpid)
 333:	b8 0b 00 00 00       	mov    $0xb,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret

0000033b <sbrk>:
SYSCALL(sbrk)
 33b:	b8 0c 00 00 00       	mov    $0xc,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret

00000343 <sleep>:
SYSCALL(sleep)
 343:	b8 0d 00 00 00       	mov    $0xd,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret

0000034b <uptime>:
SYSCALL(uptime)
 34b:	b8 0e 00 00 00       	mov    $0xe,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret
 353:	66 90                	xchg   %ax,%ax
 355:	66 90                	xchg   %ax,%ax
 357:	66 90                	xchg   %ax,%ax
 359:	66 90                	xchg   %ax,%ax
 35b:	66 90                	xchg   %ax,%ax
 35d:	66 90                	xchg   %ax,%ax
 35f:	90                   	nop

00000360 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	56                   	push   %esi
 365:	53                   	push   %ebx
 366:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 368:	89 d1                	mov    %edx,%ecx
{
 36a:	83 ec 3c             	sub    $0x3c,%esp
 36d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 370:	85 d2                	test   %edx,%edx
 372:	0f 89 80 00 00 00    	jns    3f8 <printint+0x98>
 378:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 37c:	74 7a                	je     3f8 <printint+0x98>
    x = -xx;
 37e:	f7 d9                	neg    %ecx
    neg = 1;
 380:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 385:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 388:	31 f6                	xor    %esi,%esi
 38a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 390:	89 c8                	mov    %ecx,%eax
 392:	31 d2                	xor    %edx,%edx
 394:	89 f7                	mov    %esi,%edi
 396:	f7 f3                	div    %ebx
 398:	8d 76 01             	lea    0x1(%esi),%esi
 39b:	0f b6 92 6c 0a 00 00 	movzbl 0xa6c(%edx),%edx
 3a2:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 3a6:	89 ca                	mov    %ecx,%edx
 3a8:	89 c1                	mov    %eax,%ecx
 3aa:	39 da                	cmp    %ebx,%edx
 3ac:	73 e2                	jae    390 <printint+0x30>
  if(neg)
 3ae:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 3b1:	85 c0                	test   %eax,%eax
 3b3:	74 07                	je     3bc <printint+0x5c>
    buf[i++] = '-';
 3b5:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 3ba:	89 f7                	mov    %esi,%edi
 3bc:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 3bf:	8b 75 c0             	mov    -0x40(%ebp),%esi
 3c2:	01 df                	add    %ebx,%edi
 3c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 3c8:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 3cb:	83 ec 04             	sub    $0x4,%esp
 3ce:	88 45 d7             	mov    %al,-0x29(%ebp)
 3d1:	8d 45 d7             	lea    -0x29(%ebp),%eax
 3d4:	6a 01                	push   $0x1
 3d6:	50                   	push   %eax
 3d7:	56                   	push   %esi
 3d8:	e8 f6 fe ff ff       	call   2d3 <write>
  while(--i >= 0)
 3dd:	89 f8                	mov    %edi,%eax
 3df:	83 c4 10             	add    $0x10,%esp
 3e2:	83 ef 01             	sub    $0x1,%edi
 3e5:	39 c3                	cmp    %eax,%ebx
 3e7:	75 df                	jne    3c8 <printint+0x68>
}
 3e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3ec:	5b                   	pop    %ebx
 3ed:	5e                   	pop    %esi
 3ee:	5f                   	pop    %edi
 3ef:	5d                   	pop    %ebp
 3f0:	c3                   	ret
 3f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 3f8:	31 c0                	xor    %eax,%eax
 3fa:	eb 89                	jmp    385 <printint+0x25>
 3fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000400 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
 404:	56                   	push   %esi
 405:	53                   	push   %ebx
 406:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 409:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 40c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 40f:	0f b6 1e             	movzbl (%esi),%ebx
 412:	83 c6 01             	add    $0x1,%esi
 415:	84 db                	test   %bl,%bl
 417:	74 67                	je     480 <printf+0x80>
 419:	8d 4d 10             	lea    0x10(%ebp),%ecx
 41c:	31 d2                	xor    %edx,%edx
 41e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 421:	eb 34                	jmp    457 <printf+0x57>
 423:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 428:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 42b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 430:	83 f8 25             	cmp    $0x25,%eax
 433:	74 18                	je     44d <printf+0x4d>
  write(fd, &c, 1);
 435:	83 ec 04             	sub    $0x4,%esp
 438:	8d 45 e7             	lea    -0x19(%ebp),%eax
 43b:	88 5d e7             	mov    %bl,-0x19(%ebp)
 43e:	6a 01                	push   $0x1
 440:	50                   	push   %eax
 441:	57                   	push   %edi
 442:	e8 8c fe ff ff       	call   2d3 <write>
 447:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 44a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 44d:	0f b6 1e             	movzbl (%esi),%ebx
 450:	83 c6 01             	add    $0x1,%esi
 453:	84 db                	test   %bl,%bl
 455:	74 29                	je     480 <printf+0x80>
    c = fmt[i] & 0xff;
 457:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 45a:	85 d2                	test   %edx,%edx
 45c:	74 ca                	je     428 <printf+0x28>
      }
    } else if(state == '%'){
 45e:	83 fa 25             	cmp    $0x25,%edx
 461:	75 ea                	jne    44d <printf+0x4d>
      if(c == 'd'){
 463:	83 f8 25             	cmp    $0x25,%eax
 466:	0f 84 04 01 00 00    	je     570 <printf+0x170>
 46c:	83 e8 63             	sub    $0x63,%eax
 46f:	83 f8 15             	cmp    $0x15,%eax
 472:	77 1c                	ja     490 <printf+0x90>
 474:	ff 24 85 14 0a 00 00 	jmp    *0xa14(,%eax,4)
 47b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 480:	8d 65 f4             	lea    -0xc(%ebp),%esp
 483:	5b                   	pop    %ebx
 484:	5e                   	pop    %esi
 485:	5f                   	pop    %edi
 486:	5d                   	pop    %ebp
 487:	c3                   	ret
 488:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 48f:	00 
  write(fd, &c, 1);
 490:	83 ec 04             	sub    $0x4,%esp
 493:	8d 55 e7             	lea    -0x19(%ebp),%edx
 496:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 49a:	6a 01                	push   $0x1
 49c:	52                   	push   %edx
 49d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 4a0:	57                   	push   %edi
 4a1:	e8 2d fe ff ff       	call   2d3 <write>
 4a6:	83 c4 0c             	add    $0xc,%esp
 4a9:	88 5d e7             	mov    %bl,-0x19(%ebp)
 4ac:	6a 01                	push   $0x1
 4ae:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 4b1:	52                   	push   %edx
 4b2:	57                   	push   %edi
 4b3:	e8 1b fe ff ff       	call   2d3 <write>
        putc(fd, c);
 4b8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4bb:	31 d2                	xor    %edx,%edx
 4bd:	eb 8e                	jmp    44d <printf+0x4d>
 4bf:	90                   	nop
        printint(fd, *ap, 16, 0);
 4c0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 4c3:	83 ec 0c             	sub    $0xc,%esp
 4c6:	b9 10 00 00 00       	mov    $0x10,%ecx
 4cb:	8b 13                	mov    (%ebx),%edx
 4cd:	6a 00                	push   $0x0
 4cf:	89 f8                	mov    %edi,%eax
        ap++;
 4d1:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 4d4:	e8 87 fe ff ff       	call   360 <printint>
        ap++;
 4d9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 4dc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4df:	31 d2                	xor    %edx,%edx
 4e1:	e9 67 ff ff ff       	jmp    44d <printf+0x4d>
        s = (char*)*ap;
 4e6:	8b 45 d0             	mov    -0x30(%ebp),%eax
 4e9:	8b 18                	mov    (%eax),%ebx
        ap++;
 4eb:	83 c0 04             	add    $0x4,%eax
 4ee:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 4f1:	85 db                	test   %ebx,%ebx
 4f3:	0f 84 87 00 00 00    	je     580 <printf+0x180>
        while(*s != 0){
 4f9:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 4fc:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 4fe:	84 c0                	test   %al,%al
 500:	0f 84 47 ff ff ff    	je     44d <printf+0x4d>
 506:	8d 55 e7             	lea    -0x19(%ebp),%edx
 509:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 50c:	89 de                	mov    %ebx,%esi
 50e:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 510:	83 ec 04             	sub    $0x4,%esp
 513:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 516:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 519:	6a 01                	push   $0x1
 51b:	53                   	push   %ebx
 51c:	57                   	push   %edi
 51d:	e8 b1 fd ff ff       	call   2d3 <write>
        while(*s != 0){
 522:	0f b6 06             	movzbl (%esi),%eax
 525:	83 c4 10             	add    $0x10,%esp
 528:	84 c0                	test   %al,%al
 52a:	75 e4                	jne    510 <printf+0x110>
      state = 0;
 52c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 52f:	31 d2                	xor    %edx,%edx
 531:	e9 17 ff ff ff       	jmp    44d <printf+0x4d>
        printint(fd, *ap, 10, 1);
 536:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 539:	83 ec 0c             	sub    $0xc,%esp
 53c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 541:	8b 13                	mov    (%ebx),%edx
 543:	6a 01                	push   $0x1
 545:	eb 88                	jmp    4cf <printf+0xcf>
        putc(fd, *ap);
 547:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 54a:	83 ec 04             	sub    $0x4,%esp
 54d:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 550:	8b 03                	mov    (%ebx),%eax
        ap++;
 552:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 555:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 558:	6a 01                	push   $0x1
 55a:	52                   	push   %edx
 55b:	57                   	push   %edi
 55c:	e8 72 fd ff ff       	call   2d3 <write>
        ap++;
 561:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 564:	83 c4 10             	add    $0x10,%esp
      state = 0;
 567:	31 d2                	xor    %edx,%edx
 569:	e9 df fe ff ff       	jmp    44d <printf+0x4d>
 56e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 570:	83 ec 04             	sub    $0x4,%esp
 573:	88 5d e7             	mov    %bl,-0x19(%ebp)
 576:	8d 55 e7             	lea    -0x19(%ebp),%edx
 579:	6a 01                	push   $0x1
 57b:	e9 31 ff ff ff       	jmp    4b1 <printf+0xb1>
 580:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 585:	bb 0d 0a 00 00       	mov    $0xa0d,%ebx
 58a:	e9 77 ff ff ff       	jmp    506 <printf+0x106>
 58f:	90                   	nop

00000590 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 590:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 591:	a1 40 0e 00 00       	mov    0xe40,%eax
{
 596:	89 e5                	mov    %esp,%ebp
 598:	57                   	push   %edi
 599:	56                   	push   %esi
 59a:	53                   	push   %ebx
 59b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 59e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5a8:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5aa:	39 c8                	cmp    %ecx,%eax
 5ac:	73 32                	jae    5e0 <free+0x50>
 5ae:	39 d1                	cmp    %edx,%ecx
 5b0:	72 04                	jb     5b6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5b2:	39 d0                	cmp    %edx,%eax
 5b4:	72 32                	jb     5e8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5b6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5b9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5bc:	39 fa                	cmp    %edi,%edx
 5be:	74 30                	je     5f0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 5c0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 5c3:	8b 50 04             	mov    0x4(%eax),%edx
 5c6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5c9:	39 f1                	cmp    %esi,%ecx
 5cb:	74 3a                	je     607 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 5cd:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 5cf:	5b                   	pop    %ebx
  freep = p;
 5d0:	a3 40 0e 00 00       	mov    %eax,0xe40
}
 5d5:	5e                   	pop    %esi
 5d6:	5f                   	pop    %edi
 5d7:	5d                   	pop    %ebp
 5d8:	c3                   	ret
 5d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5e0:	39 d0                	cmp    %edx,%eax
 5e2:	72 04                	jb     5e8 <free+0x58>
 5e4:	39 d1                	cmp    %edx,%ecx
 5e6:	72 ce                	jb     5b6 <free+0x26>
{
 5e8:	89 d0                	mov    %edx,%eax
 5ea:	eb bc                	jmp    5a8 <free+0x18>
 5ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 5f0:	03 72 04             	add    0x4(%edx),%esi
 5f3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5f6:	8b 10                	mov    (%eax),%edx
 5f8:	8b 12                	mov    (%edx),%edx
 5fa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5fd:	8b 50 04             	mov    0x4(%eax),%edx
 600:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 603:	39 f1                	cmp    %esi,%ecx
 605:	75 c6                	jne    5cd <free+0x3d>
    p->s.size += bp->s.size;
 607:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 60a:	a3 40 0e 00 00       	mov    %eax,0xe40
    p->s.size += bp->s.size;
 60f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 612:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 615:	89 08                	mov    %ecx,(%eax)
}
 617:	5b                   	pop    %ebx
 618:	5e                   	pop    %esi
 619:	5f                   	pop    %edi
 61a:	5d                   	pop    %ebp
 61b:	c3                   	ret
 61c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000620 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 620:	55                   	push   %ebp
 621:	89 e5                	mov    %esp,%ebp
 623:	57                   	push   %edi
 624:	56                   	push   %esi
 625:	53                   	push   %ebx
 626:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 629:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 62c:	8b 15 40 0e 00 00    	mov    0xe40,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 632:	8d 78 07             	lea    0x7(%eax),%edi
 635:	c1 ef 03             	shr    $0x3,%edi
 638:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 63b:	85 d2                	test   %edx,%edx
 63d:	0f 84 8d 00 00 00    	je     6d0 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 643:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 645:	8b 48 04             	mov    0x4(%eax),%ecx
 648:	39 f9                	cmp    %edi,%ecx
 64a:	73 64                	jae    6b0 <malloc+0x90>
  if(nu < 4096)
 64c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 651:	39 df                	cmp    %ebx,%edi
 653:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 656:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 65d:	eb 0a                	jmp    669 <malloc+0x49>
 65f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 660:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 662:	8b 48 04             	mov    0x4(%eax),%ecx
 665:	39 f9                	cmp    %edi,%ecx
 667:	73 47                	jae    6b0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 669:	89 c2                	mov    %eax,%edx
 66b:	3b 05 40 0e 00 00    	cmp    0xe40,%eax
 671:	75 ed                	jne    660 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 673:	83 ec 0c             	sub    $0xc,%esp
 676:	56                   	push   %esi
 677:	e8 bf fc ff ff       	call   33b <sbrk>
  if(p == (char*)-1)
 67c:	83 c4 10             	add    $0x10,%esp
 67f:	83 f8 ff             	cmp    $0xffffffff,%eax
 682:	74 1c                	je     6a0 <malloc+0x80>
  hp->s.size = nu;
 684:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 687:	83 ec 0c             	sub    $0xc,%esp
 68a:	83 c0 08             	add    $0x8,%eax
 68d:	50                   	push   %eax
 68e:	e8 fd fe ff ff       	call   590 <free>
  return freep;
 693:	8b 15 40 0e 00 00    	mov    0xe40,%edx
      if((p = morecore(nunits)) == 0)
 699:	83 c4 10             	add    $0x10,%esp
 69c:	85 d2                	test   %edx,%edx
 69e:	75 c0                	jne    660 <malloc+0x40>
        return 0;
  }
}
 6a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 6a3:	31 c0                	xor    %eax,%eax
}
 6a5:	5b                   	pop    %ebx
 6a6:	5e                   	pop    %esi
 6a7:	5f                   	pop    %edi
 6a8:	5d                   	pop    %ebp
 6a9:	c3                   	ret
 6aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 6b0:	39 cf                	cmp    %ecx,%edi
 6b2:	74 4c                	je     700 <malloc+0xe0>
        p->s.size -= nunits;
 6b4:	29 f9                	sub    %edi,%ecx
 6b6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 6b9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 6bc:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 6bf:	89 15 40 0e 00 00    	mov    %edx,0xe40
}
 6c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 6c8:	83 c0 08             	add    $0x8,%eax
}
 6cb:	5b                   	pop    %ebx
 6cc:	5e                   	pop    %esi
 6cd:	5f                   	pop    %edi
 6ce:	5d                   	pop    %ebp
 6cf:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 6d0:	c7 05 40 0e 00 00 44 	movl   $0xe44,0xe40
 6d7:	0e 00 00 
    base.s.size = 0;
 6da:	b8 44 0e 00 00       	mov    $0xe44,%eax
    base.s.ptr = freep = prevp = &base;
 6df:	c7 05 44 0e 00 00 44 	movl   $0xe44,0xe44
 6e6:	0e 00 00 
    base.s.size = 0;
 6e9:	c7 05 48 0e 00 00 00 	movl   $0x0,0xe48
 6f0:	00 00 00 
    if(p->s.size >= nunits){
 6f3:	e9 54 ff ff ff       	jmp    64c <malloc+0x2c>
 6f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 6ff:	00 
        prevp->s.ptr = p->s.ptr;
 700:	8b 08                	mov    (%eax),%ecx
 702:	89 0a                	mov    %ecx,(%edx)
 704:	eb b9                	jmp    6bf <malloc+0x9f>
 706:	66 90                	xchg   %ax,%ax
 708:	66 90                	xchg   %ax,%ax
 70a:	66 90                	xchg   %ax,%ax
 70c:	66 90                	xchg   %ax,%ax
 70e:	66 90                	xchg   %ax,%ax

00000710 <thread_init>:
 
static void thread_stub(void (*fn)(void*), void *arg);

void thread_init(void) {

  for (int i = 0; i < MAX_THREADS; i++)
 710:	b8 80 0e 00 00       	mov    $0xe80,%eax
 715:	8d 76 00             	lea    0x0(%esi),%esi
    table[i].state = FREE;
 718:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  for (int i = 0; i < MAX_THREADS; i++)
 71e:	83 c0 20             	add    $0x20,%eax
    table[i].state = FREE;
 721:	c7 40 f0 00 00 00 00 	movl   $0x0,-0x10(%eax)
  for (int i = 0; i < MAX_THREADS; i++)
 728:	3d 80 0f 00 00       	cmp    $0xf80,%eax
 72d:	75 e9                	jne    718 <thread_init+0x8>
 
  table[0].state = RUNNING;
  table[0].tid   = next_tid++;
 72f:	a1 38 0e 00 00       	mov    0xe38,%eax
  table[0].state = RUNNING;
 734:	c7 05 80 0e 00 00 02 	movl   $0x2,0xe80
 73b:	00 00 00 
  table[0].stack = 0;   
 73e:	c7 05 88 0e 00 00 00 	movl   $0x0,0xe88
 745:	00 00 00 
  table[0].tid   = next_tid++;
 748:	8d 50 01             	lea    0x1(%eax),%edx
 74b:	a3 84 0e 00 00       	mov    %eax,0xe84
 750:	89 15 38 0e 00 00    	mov    %edx,0xe38
  table[0].ctx   = &main_ctx;
 756:	c7 05 8c 0e 00 00 60 	movl   $0xe60,0xe8c
 75d:	0e 00 00 
  current = 0;
 760:	c7 05 74 0e 00 00 00 	movl   $0x0,0xe74
 767:	00 00 00 
}
 76a:	c3                   	ret
 76b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000770 <thread_create>:
      return idx;
  }
  return -1;
}
 
tid_t thread_create(void (*fn)(void*), void *arg) {
 770:	55                   	push   %ebp
  int slot = -1;
  for (int i = 1; i < MAX_THREADS; i++) {
 771:	b8 01 00 00 00       	mov    $0x1,%eax
tid_t thread_create(void (*fn)(void*), void *arg) {
 776:	89 e5                	mov    %esp,%ebp
 778:	56                   	push   %esi
 779:	53                   	push   %ebx
 77a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if (table[i].state == FREE) { slot = i; break; }
 780:	89 c3                	mov    %eax,%ebx
 782:	c1 e3 04             	shl    $0x4,%ebx
 785:	8b 93 80 0e 00 00    	mov    0xe80(%ebx),%edx
 78b:	85 d2                	test   %edx,%edx
 78d:	74 19                	je     7a8 <thread_create+0x38>
  for (int i = 1; i < MAX_THREADS; i++) {
 78f:	83 c0 01             	add    $0x1,%eax
 792:	83 f8 10             	cmp    $0x10,%eax
 795:	75 e9                	jne    780 <thread_create+0x10>
  }
  if (slot == -1) return -1;
 797:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 79c:	e9 98 00 00 00       	jmp    839 <thread_create+0xc9>
 7a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 
  char *stk = malloc(STACK_SIZE);
 7a8:	83 ec 0c             	sub    $0xc,%esp
 7ab:	68 00 20 00 00       	push   $0x2000
 7b0:	e8 6b fe ff ff       	call   620 <malloc>
  if (!stk) return -1;
 7b5:	83 c4 10             	add    $0x10,%esp
  char *stk = malloc(STACK_SIZE);
 7b8:	89 c6                	mov    %eax,%esi
  if (!stk) return -1;
 7ba:	85 c0                	test   %eax,%eax
 7bc:	74 d9                	je     797 <thread_create+0x27>
  memset(stk, 0, STACK_SIZE);
 7be:	83 ec 04             	sub    $0x4,%esp
 7c1:	68 00 20 00 00       	push   $0x2000
 7c6:	6a 00                	push   $0x0
 7c8:	56                   	push   %esi
 7c9:	e8 62 f9 ff ff       	call   130 <memset>

  uint *sp = (uint*)(stk + STACK_SIZE);
  sp--;  *sp = (uint)arg;
 7ce:	8b 45 0c             	mov    0xc(%ebp),%eax
  sp--;  *sp = 0;   /* esi */
  sp--;  *sp = 0;   /* edi */

  table[slot].state = RUNNABLE;
  table[slot].tid   = next_tid++;
  table[slot].stack = stk;
 7d1:	89 b3 88 0e 00 00    	mov    %esi,0xe88(%ebx)
  table[slot].ctx   = (struct context*)sp;

  return table[slot].tid;
 7d7:	83 c4 10             	add    $0x10,%esp
  sp--;  *sp = 0xffffffff;
 7da:	c7 86 f4 1f 00 00 ff 	movl   $0xffffffff,0x1ff4(%esi)
 7e1:	ff ff ff 
  sp--;  *sp = 0;   /* edi */
 7e4:	81 c6 e0 1f 00 00    	add    $0x1fe0,%esi
  sp--;  *sp = (uint)arg;
 7ea:	89 46 1c             	mov    %eax,0x1c(%esi)
  sp--;  *sp = (uint)fn;
 7ed:	8b 45 08             	mov    0x8(%ebp),%eax
  sp--;  *sp = (uint)thread_stub;
 7f0:	c7 46 10 e0 08 00 00 	movl   $0x8e0,0x10(%esi)
  sp--;  *sp = (uint)fn;
 7f7:	89 46 18             	mov    %eax,0x18(%esi)
  table[slot].tid   = next_tid++;
 7fa:	a1 38 0e 00 00       	mov    0xe38,%eax
  sp--;  *sp = 0;   /* ebp */
 7ff:	c7 46 0c 00 00 00 00 	movl   $0x0,0xc(%esi)
  table[slot].tid   = next_tid++;
 806:	8d 48 01             	lea    0x1(%eax),%ecx
  sp--;  *sp = 0;   /* ebx */
 809:	c7 46 08 00 00 00 00 	movl   $0x0,0x8(%esi)
  sp--;  *sp = 0;   /* esi */
 810:	c7 46 04 00 00 00 00 	movl   $0x0,0x4(%esi)
  sp--;  *sp = 0;   /* edi */
 817:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  table[slot].state = RUNNABLE;
 81d:	c7 83 80 0e 00 00 01 	movl   $0x1,0xe80(%ebx)
 824:	00 00 00 
  table[slot].tid   = next_tid++;
 827:	89 0d 38 0e 00 00    	mov    %ecx,0xe38
 82d:	89 83 84 0e 00 00    	mov    %eax,0xe84(%ebx)
  sp--;  *sp = 0;   /* edi */
 833:	89 b3 8c 0e 00 00    	mov    %esi,0xe8c(%ebx)
}
 839:	8d 65 f8             	lea    -0x8(%ebp),%esp
 83c:	5b                   	pop    %ebx
 83d:	5e                   	pop    %esi
 83e:	5d                   	pop    %ebp
 83f:	c3                   	ret

00000840 <thread_yield>:
  thread_yield();
 
  exit();
}
 
void thread_yield(void) {
 840:	55                   	push   %ebp
 841:	89 e5                	mov    %esp,%ebp
 843:	56                   	push   %esi
 844:	53                   	push   %ebx
    int idx = (current + i) % MAX_THREADS;
 845:	8b 35 74 0e 00 00    	mov    0xe74,%esi
 84b:	8d 4e 01             	lea    0x1(%esi),%ecx
 84e:	8d 5e 11             	lea    0x11(%esi),%ebx
 851:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 858:	89 ca                	mov    %ecx,%edx
 85a:	c1 fa 1f             	sar    $0x1f,%edx
 85d:	c1 ea 1c             	shr    $0x1c,%edx
 860:	8d 04 11             	lea    (%ecx,%edx,1),%eax
 863:	83 e0 0f             	and    $0xf,%eax
 866:	29 d0                	sub    %edx,%eax
    if (table[idx].state == RUNNABLE)
 868:	89 c2                	mov    %eax,%edx
 86a:	c1 e2 04             	shl    $0x4,%edx
 86d:	83 ba 80 0e 00 00 01 	cmpl   $0x1,0xe80(%edx)
 874:	74 12                	je     888 <thread_yield+0x48>
  for (int i = 1; i <= MAX_THREADS; i++) {
 876:	83 c1 01             	add    $0x1,%ecx
 879:	39 d9                	cmp    %ebx,%ecx
 87b:	75 db                	jne    858 <thread_yield+0x18>
    table[prev].state = RUNNABLE;
  table[next].state = RUNNING;
  current = next;

  uswtch(&table[prev].ctx, table[next].ctx);
}
 87d:	8d 65 f8             	lea    -0x8(%ebp),%esp
 880:	5b                   	pop    %ebx
 881:	5e                   	pop    %esi
 882:	5d                   	pop    %ebp
 883:	c3                   	ret
 884:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if (next == -1) return;
 888:	83 f8 ff             	cmp    $0xffffffff,%eax
 88b:	74 f0                	je     87d <thread_yield+0x3d>
  if (table[prev].state == RUNNING)
 88d:	89 f2                	mov    %esi,%edx
 88f:	c1 e2 04             	shl    $0x4,%edx
 892:	83 ba 80 0e 00 00 02 	cmpl   $0x2,0xe80(%edx)
 899:	75 0a                	jne    8a5 <thread_yield+0x65>
    table[prev].state = RUNNABLE;
 89b:	c7 82 80 0e 00 00 01 	movl   $0x1,0xe80(%edx)
 8a2:	00 00 00 
  table[next].state = RUNNING;
 8a5:	89 c2                	mov    %eax,%edx
  uswtch(&table[prev].ctx, table[next].ctx);
 8a7:	c1 e6 04             	shl    $0x4,%esi
 8aa:	83 ec 08             	sub    $0x8,%esp
  current = next;
 8ad:	a3 74 0e 00 00       	mov    %eax,0xe74
  table[next].state = RUNNING;
 8b2:	c1 e2 04             	shl    $0x4,%edx
  uswtch(&table[prev].ctx, table[next].ctx);
 8b5:	81 c6 8c 0e 00 00    	add    $0xe8c,%esi
  table[next].state = RUNNING;
 8bb:	c7 82 80 0e 00 00 02 	movl   $0x2,0xe80(%edx)
 8c2:	00 00 00 
  uswtch(&table[prev].ctx, table[next].ctx);
 8c5:	ff b2 8c 0e 00 00    	push   0xe8c(%edx)
 8cb:	56                   	push   %esi
 8cc:	e8 1d 01 00 00       	call   9ee <uswtch>
 8d1:	83 c4 10             	add    $0x10,%esp
}
 8d4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 8d7:	5b                   	pop    %ebx
 8d8:	5e                   	pop    %esi
 8d9:	5d                   	pop    %ebp
 8da:	c3                   	ret
 8db:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

000008e0 <thread_stub>:
static void thread_stub(void (*fn)(void*), void *arg) {
 8e0:	55                   	push   %ebp
 8e1:	89 e5                	mov    %esp,%ebp
 8e3:	83 ec 14             	sub    $0x14,%esp
  fn(arg);
 8e6:	ff 75 0c             	push   0xc(%ebp)
 8e9:	ff 55 08             	call   *0x8(%ebp)
  table[current].state = ZOMBIE;
 8ec:	a1 74 0e 00 00       	mov    0xe74,%eax
 8f1:	c1 e0 04             	shl    $0x4,%eax
 8f4:	c7 80 80 0e 00 00 03 	movl   $0x3,0xe80(%eax)
 8fb:	00 00 00 
  thread_yield();
 8fe:	e8 3d ff ff ff       	call   840 <thread_yield>
  exit();
 903:	e8 ab f9 ff ff       	call   2b3 <exit>
 908:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 90f:	00 

00000910 <thread_join>:


int thread_join(tid_t tid) {
 910:	55                   	push   %ebp
 911:	89 e5                	mov    %esp,%ebp
 913:	56                   	push   %esi
 914:	53                   	push   %ebx
 915:	8b 45 08             	mov    0x8(%ebp),%eax

  int slot = -1;
  for (int i = 0; i < MAX_THREADS; i++) {
 918:	31 db                	xor    %ebx,%ebx
 91a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if (table[i].tid == tid) { slot = i; break; }
 920:	89 de                	mov    %ebx,%esi
 922:	c1 e6 04             	shl    $0x4,%esi
 925:	39 86 84 0e 00 00    	cmp    %eax,0xe84(%esi)
 92b:	74 20                	je     94d <thread_join+0x3d>
  for (int i = 0; i < MAX_THREADS; i++) {
 92d:	83 c3 01             	add    $0x1,%ebx
 930:	83 fb 10             	cmp    $0x10,%ebx
 933:	75 eb                	jne    920 <thread_join+0x10>
  table[slot].state = FREE;
  table[slot].stack = 0;
  table[slot].ctx   = 0;
 
  return 0;
 935:	8d 65 f8             	lea    -0x8(%ebp),%esp
  if (slot == -1) return -1;
 938:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 93d:	5b                   	pop    %ebx
 93e:	5e                   	pop    %esi
 93f:	5d                   	pop    %ebp
 940:	c3                   	ret
 941:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    thread_yield();
 948:	e8 f3 fe ff ff       	call   840 <thread_yield>
  while (table[slot].state != ZOMBIE)
 94d:	83 be 80 0e 00 00 03 	cmpl   $0x3,0xe80(%esi)
 954:	75 f2                	jne    948 <thread_join+0x38>
  if (table[slot].stack)
 956:	89 d8                	mov    %ebx,%eax
 958:	c1 e0 04             	shl    $0x4,%eax
 95b:	8b 80 88 0e 00 00    	mov    0xe88(%eax),%eax
 961:	85 c0                	test   %eax,%eax
 963:	74 0c                	je     971 <thread_join+0x61>
    free(table[slot].stack);
 965:	83 ec 0c             	sub    $0xc,%esp
 968:	50                   	push   %eax
 969:	e8 22 fc ff ff       	call   590 <free>
 96e:	83 c4 10             	add    $0x10,%esp
  table[slot].state = FREE;
 971:	c1 e3 04             	shl    $0x4,%ebx
  return 0;
 974:	31 c0                	xor    %eax,%eax
  table[slot].state = FREE;
 976:	c7 83 80 0e 00 00 00 	movl   $0x0,0xe80(%ebx)
 97d:	00 00 00 
  table[slot].stack = 0;
 980:	c7 83 88 0e 00 00 00 	movl   $0x0,0xe88(%ebx)
 987:	00 00 00 
  table[slot].ctx   = 0;
 98a:	c7 83 8c 0e 00 00 00 	movl   $0x0,0xe8c(%ebx)
 991:	00 00 00 
 994:	8d 65 f8             	lea    -0x8(%ebp),%esp
 997:	5b                   	pop    %ebx
 998:	5e                   	pop    %esi
 999:	5d                   	pop    %ebp
 99a:	c3                   	ret
 99b:	66 90                	xchg   %ax,%ax
 99d:	66 90                	xchg   %ax,%ax
 99f:	90                   	nop

000009a0 <mutex_init>:
#include "stat.h"
#include "user.h"
#include "uthread.h"
#include "umutex.h"

void mutex_init(umutex_t *m){ m->locked = 0; }
 9a0:	55                   	push   %ebp
 9a1:	89 e5                	mov    %esp,%ebp
 9a3:	8b 45 08             	mov    0x8(%ebp),%eax
 9a6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 9ac:	5d                   	pop    %ebp
 9ad:	c3                   	ret
 9ae:	66 90                	xchg   %ax,%ax

000009b0 <mutex_lock>:
void mutex_lock(umutex_t *m){ while(m->locked){ thread_yield(); } m->locked = 1; }
 9b0:	55                   	push   %ebp
 9b1:	89 e5                	mov    %esp,%ebp
 9b3:	53                   	push   %ebx
 9b4:	83 ec 04             	sub    $0x4,%esp
 9b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
 9ba:	8b 03                	mov    (%ebx),%eax
 9bc:	85 c0                	test   %eax,%eax
 9be:	74 0b                	je     9cb <mutex_lock+0x1b>
 9c0:	e8 7b fe ff ff       	call   840 <thread_yield>
 9c5:	8b 03                	mov    (%ebx),%eax
 9c7:	85 c0                	test   %eax,%eax
 9c9:	75 f5                	jne    9c0 <mutex_lock+0x10>
 9cb:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
 9d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9d4:	c9                   	leave
 9d5:	c3                   	ret
 9d6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 9dd:	00 
 9de:	66 90                	xchg   %ax,%ax

000009e0 <mutex_unlock>:
void mutex_unlock(umutex_t *m){ m->locked = 0; }
 9e0:	55                   	push   %ebp
 9e1:	89 e5                	mov    %esp,%ebp
 9e3:	8b 45 08             	mov    0x8(%ebp),%eax
 9e6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 9ec:	5d                   	pop    %ebp
 9ed:	c3                   	ret

000009ee <uswtch>:
.text
.globl uswtch
uswtch:
  movl 4(%esp), %eax
 9ee:	8b 44 24 04          	mov    0x4(%esp),%eax
  movl 8(%esp), %edx
 9f2:	8b 54 24 08          	mov    0x8(%esp),%edx

  pushl %ebp
 9f6:	55                   	push   %ebp
  pushl %ebx
 9f7:	53                   	push   %ebx
  pushl %esi
 9f8:	56                   	push   %esi
  pushl %edi
 9f9:	57                   	push   %edi

  movl %esp, (%eax)
 9fa:	89 20                	mov    %esp,(%eax)
  movl %edx, %esp
 9fc:	89 d4                	mov    %edx,%esp

  popl %edi
 9fe:	5f                   	pop    %edi
  popl %esi
 9ff:	5e                   	pop    %esi
  popl %ebx
 a00:	5b                   	pop    %ebx
  popl %ebp
 a01:	5d                   	pop    %ebp
 a02:	c3                   	ret
