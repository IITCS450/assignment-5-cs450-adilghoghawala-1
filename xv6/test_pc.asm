
_test_pc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
}

int
main(void)
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
  tid_t p1, p2, c1;

  thread_init();
  14:	e8 97 08 00 00       	call   8b0 <thread_init>
  mutex_init(&mu);
  19:	83 ec 0c             	sub    $0xc,%esp
  1c:	68 80 10 00 00       	push   $0x1080
  21:	e8 1a 0b 00 00       	call   b40 <mutex_init>

  p1 = thread_create(producer, (void*)1);
  26:	59                   	pop    %ecx
  27:	5b                   	pop    %ebx
  28:	6a 01                	push   $0x1
  2a:	68 70 01 00 00       	push   $0x170
  2f:	e8 dc 08 00 00       	call   910 <thread_create>
  p2 = thread_create(producer, (void*)2);
  34:	5e                   	pop    %esi
  p1 = thread_create(producer, (void*)1);
  35:	89 c7                	mov    %eax,%edi
  p2 = thread_create(producer, (void*)2);
  37:	58                   	pop    %eax
  38:	6a 02                	push   $0x2
  3a:	68 70 01 00 00       	push   $0x170
  3f:	e8 cc 08 00 00       	call   910 <thread_create>
  44:	89 c6                	mov    %eax,%esi
  c1 = thread_create(consumer, 0);
  46:	58                   	pop    %eax
  47:	5a                   	pop    %edx
  48:	6a 00                	push   $0x0
  4a:	68 b0 00 00 00       	push   $0xb0
  4f:	e8 bc 08 00 00       	call   910 <thread_create>

  if(p1 < 0 || p2 < 0 || c1 < 0){
  54:	83 c4 10             	add    $0x10,%esp
  c1 = thread_create(consumer, 0);
  57:	89 c3                	mov    %eax,%ebx
  if(p1 < 0 || p2 < 0 || c1 < 0){
  59:	89 f8                	mov    %edi,%eax
  5b:	09 f0                	or     %esi,%eax
  5d:	09 d8                	or     %ebx,%eax
  5f:	79 14                	jns    75 <main+0x75>
    printf(1, "thread_create failed\n");
  61:	83 ec 08             	sub    $0x8,%esp
  64:	68 c5 0b 00 00       	push   $0xbc5
  69:	6a 01                	push   $0x1
  6b:	e8 30 05 00 00       	call   5a0 <printf>
    exit();
  70:	e8 de 03 00 00       	call   453 <exit>
  }

  thread_join(p1);
  75:	83 ec 0c             	sub    $0xc,%esp
  78:	57                   	push   %edi
  79:	e8 32 0a 00 00       	call   ab0 <thread_join>
  thread_join(p2);
  7e:	89 34 24             	mov    %esi,(%esp)
  81:	e8 2a 0a 00 00       	call   ab0 <thread_join>
  thread_join(c1);
  86:	89 1c 24             	mov    %ebx,(%esp)
  89:	e8 22 0a 00 00       	call   ab0 <thread_join>

  printf(1, "test_pc: done\n");
  8e:	58                   	pop    %eax
  8f:	5a                   	pop    %edx
  90:	68 db 0b 00 00       	push   $0xbdb
  95:	6a 01                	push   $0x1
  97:	e8 04 05 00 00       	call   5a0 <printf>
  exit();
  9c:	e8 b2 03 00 00       	call   453 <exit>
  a1:	66 90                	xchg   %ax,%ax
  a3:	66 90                	xchg   %ax,%ax
  a5:	66 90                	xchg   %ax,%ax
  a7:	66 90                	xchg   %ax,%ax
  a9:	66 90                	xchg   %ax,%ax
  ab:	66 90                	xchg   %ax,%ax
  ad:	66 90                	xchg   %ax,%ax
  af:	90                   	nop

000000b0 <consumer>:
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	56                   	push   %esi
  b4:	53                   	push   %ebx
  got = 0;
  b5:	31 db                	xor    %ebx,%ebx
  b7:	eb 1c                	jmp    d5 <consumer+0x25>
  b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      mutex_unlock(&mu);
  c0:	83 ec 0c             	sub    $0xc,%esp
  c3:	68 80 10 00 00       	push   $0x1080
  c8:	e8 b3 0a 00 00       	call   b80 <mutex_unlock>
      thread_yield();
  cd:	e8 0e 09 00 00       	call   9e0 <thread_yield>
      mutex_lock(&mu);
  d2:	83 c4 10             	add    $0x10,%esp
  d5:	83 ec 0c             	sub    $0xc,%esp
  d8:	68 80 10 00 00       	push   $0x1080
  dd:	e8 6e 0a 00 00       	call   b50 <mutex_lock>
      if(count > 0){
  e2:	a1 84 10 00 00       	mov    0x1084,%eax
  e7:	83 c4 10             	add    $0x10,%esp
  ea:	85 c0                	test   %eax,%eax
  ec:	7e d2                	jle    c0 <consumer+0x10>
        item = buf[head];
  ee:	8b 15 8c 10 00 00    	mov    0x108c,%edx
        count--;
  f4:	83 e8 01             	sub    $0x1,%eax
        mutex_unlock(&mu);
  f7:	83 ec 0c             	sub    $0xc,%esp
        got++;
  fa:	83 c3 01             	add    $0x1,%ebx
        count--;
  fd:	a3 84 10 00 00       	mov    %eax,0x1084
        item = buf[head];
 102:	8b 34 95 a0 10 00 00 	mov    0x10a0(,%edx,4),%esi
        head = (head + 1) % NBUFSLOTS;
 109:	83 c2 01             	add    $0x1,%edx
 10c:	89 d1                	mov    %edx,%ecx
 10e:	c1 f9 1f             	sar    $0x1f,%ecx
 111:	c1 e9 1d             	shr    $0x1d,%ecx
 114:	01 ca                	add    %ecx,%edx
 116:	83 e2 07             	and    $0x7,%edx
 119:	29 ca                	sub    %ecx,%edx
 11b:	89 15 8c 10 00 00    	mov    %edx,0x108c
        mutex_unlock(&mu);
 121:	68 80 10 00 00       	push   $0x1080
 126:	e8 55 0a 00 00       	call   b80 <mutex_unlock>
        got++;
 12b:	69 c3 29 5c 8f c2    	imul   $0xc28f5c29,%ebx,%eax
 131:	83 c4 10             	add    $0x10,%esp
 134:	c1 c8 02             	ror    $0x2,%eax
        if((got % 100) == 0)
 137:	3d 28 5c 8f 02       	cmp    $0x28f5c28,%eax
 13c:	76 12                	jbe    150 <consumer+0xa0>
  while(got < 2 * NITEMS){
 13e:	81 fb 90 01 00 00    	cmp    $0x190,%ebx
 144:	75 8f                	jne    d5 <consumer+0x25>
}
 146:	8d 65 f8             	lea    -0x8(%ebp),%esp
 149:	5b                   	pop    %ebx
 14a:	5e                   	pop    %esi
 14b:	5d                   	pop    %ebp
 14c:	c3                   	ret
 14d:	8d 76 00             	lea    0x0(%esi),%esi
          printf(1, "consumer got %d items (last=%d)\n", got, item);
 150:	56                   	push   %esi
 151:	53                   	push   %ebx
 152:	68 a4 0b 00 00       	push   $0xba4
 157:	6a 01                	push   $0x1
 159:	e8 42 04 00 00       	call   5a0 <printf>
 15e:	83 c4 10             	add    $0x10,%esp
 161:	eb db                	jmp    13e <consumer+0x8e>
 163:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 16a:	00 
 16b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000170 <producer>:
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	56                   	push   %esi
 174:	53                   	push   %ebx
        buf[tail] = id * 100000 + i;
 175:	69 5d 08 a0 86 01 00 	imul   $0x186a0,0x8(%ebp),%ebx
 17c:	8d b3 c8 00 00 00    	lea    0xc8(%ebx),%esi
 182:	eb 19                	jmp    19d <producer+0x2d>
 184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      mutex_unlock(&mu);
 188:	83 ec 0c             	sub    $0xc,%esp
 18b:	68 80 10 00 00       	push   $0x1080
 190:	e8 eb 09 00 00       	call   b80 <mutex_unlock>
      thread_yield();
 195:	e8 46 08 00 00       	call   9e0 <thread_yield>
      mutex_lock(&mu);
 19a:	83 c4 10             	add    $0x10,%esp
 19d:	83 ec 0c             	sub    $0xc,%esp
 1a0:	68 80 10 00 00       	push   $0x1080
 1a5:	e8 a6 09 00 00       	call   b50 <mutex_lock>
      if(count < NBUFSLOTS){
 1aa:	a1 84 10 00 00       	mov    0x1084,%eax
 1af:	83 c4 10             	add    $0x10,%esp
 1b2:	83 f8 07             	cmp    $0x7,%eax
 1b5:	7f d1                	jg     188 <producer+0x18>
        buf[tail] = id * 100000 + i;
 1b7:	8b 15 88 10 00 00    	mov    0x1088,%edx
        mutex_unlock(&mu);
 1bd:	83 ec 0c             	sub    $0xc,%esp
        count++;
 1c0:	83 c0 01             	add    $0x1,%eax
 1c3:	a3 84 10 00 00       	mov    %eax,0x1084
        buf[tail] = id * 100000 + i;
 1c8:	89 1c 95 a0 10 00 00 	mov    %ebx,0x10a0(,%edx,4)
        tail = (tail + 1) % NBUFSLOTS;
 1cf:	83 c2 01             	add    $0x1,%edx
  for(i = 0; i < NITEMS; i++){
 1d2:	83 c3 01             	add    $0x1,%ebx
        tail = (tail + 1) % NBUFSLOTS;
 1d5:	89 d1                	mov    %edx,%ecx
 1d7:	c1 f9 1f             	sar    $0x1f,%ecx
 1da:	c1 e9 1d             	shr    $0x1d,%ecx
 1dd:	01 ca                	add    %ecx,%edx
 1df:	83 e2 07             	and    $0x7,%edx
 1e2:	29 ca                	sub    %ecx,%edx
 1e4:	89 15 88 10 00 00    	mov    %edx,0x1088
        mutex_unlock(&mu);
 1ea:	68 80 10 00 00       	push   $0x1080
 1ef:	e8 8c 09 00 00       	call   b80 <mutex_unlock>
  for(i = 0; i < NITEMS; i++){
 1f4:	83 c4 10             	add    $0x10,%esp
 1f7:	39 f3                	cmp    %esi,%ebx
 1f9:	75 a2                	jne    19d <producer+0x2d>
}
 1fb:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1fe:	5b                   	pop    %ebx
 1ff:	5e                   	pop    %esi
 200:	5d                   	pop    %ebp
 201:	c3                   	ret
 202:	66 90                	xchg   %ax,%ax
 204:	66 90                	xchg   %ax,%ax
 206:	66 90                	xchg   %ax,%ax
 208:	66 90                	xchg   %ax,%ax
 20a:	66 90                	xchg   %ax,%ax
 20c:	66 90                	xchg   %ax,%ax
 20e:	66 90                	xchg   %ax,%ax

00000210 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 210:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 211:	31 c0                	xor    %eax,%eax
{
 213:	89 e5                	mov    %esp,%ebp
 215:	53                   	push   %ebx
 216:	8b 4d 08             	mov    0x8(%ebp),%ecx
 219:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 21c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 220:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 224:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 227:	83 c0 01             	add    $0x1,%eax
 22a:	84 d2                	test   %dl,%dl
 22c:	75 f2                	jne    220 <strcpy+0x10>
    ;
  return os;
}
 22e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 231:	89 c8                	mov    %ecx,%eax
 233:	c9                   	leave
 234:	c3                   	ret
 235:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 23c:	00 
 23d:	8d 76 00             	lea    0x0(%esi),%esi

00000240 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	53                   	push   %ebx
 244:	8b 55 08             	mov    0x8(%ebp),%edx
 247:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 24a:	0f b6 02             	movzbl (%edx),%eax
 24d:	84 c0                	test   %al,%al
 24f:	75 17                	jne    268 <strcmp+0x28>
 251:	eb 3a                	jmp    28d <strcmp+0x4d>
 253:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 258:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 25c:	83 c2 01             	add    $0x1,%edx
 25f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 262:	84 c0                	test   %al,%al
 264:	74 1a                	je     280 <strcmp+0x40>
 266:	89 d9                	mov    %ebx,%ecx
 268:	0f b6 19             	movzbl (%ecx),%ebx
 26b:	38 c3                	cmp    %al,%bl
 26d:	74 e9                	je     258 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 26f:	29 d8                	sub    %ebx,%eax
}
 271:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 274:	c9                   	leave
 275:	c3                   	ret
 276:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 27d:	00 
 27e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 280:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 284:	31 c0                	xor    %eax,%eax
 286:	29 d8                	sub    %ebx,%eax
}
 288:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 28b:	c9                   	leave
 28c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 28d:	0f b6 19             	movzbl (%ecx),%ebx
 290:	31 c0                	xor    %eax,%eax
 292:	eb db                	jmp    26f <strcmp+0x2f>
 294:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 29b:	00 
 29c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002a0 <strlen>:

uint
strlen(const char *s)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 2a6:	80 3a 00             	cmpb   $0x0,(%edx)
 2a9:	74 15                	je     2c0 <strlen+0x20>
 2ab:	31 c0                	xor    %eax,%eax
 2ad:	8d 76 00             	lea    0x0(%esi),%esi
 2b0:	83 c0 01             	add    $0x1,%eax
 2b3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 2b7:	89 c1                	mov    %eax,%ecx
 2b9:	75 f5                	jne    2b0 <strlen+0x10>
    ;
  return n;
}
 2bb:	89 c8                	mov    %ecx,%eax
 2bd:	5d                   	pop    %ebp
 2be:	c3                   	ret
 2bf:	90                   	nop
  for(n = 0; s[n]; n++)
 2c0:	31 c9                	xor    %ecx,%ecx
}
 2c2:	5d                   	pop    %ebp
 2c3:	89 c8                	mov    %ecx,%eax
 2c5:	c3                   	ret
 2c6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2cd:	00 
 2ce:	66 90                	xchg   %ax,%ax

000002d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	57                   	push   %edi
 2d4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2da:	8b 45 0c             	mov    0xc(%ebp),%eax
 2dd:	89 d7                	mov    %edx,%edi
 2df:	fc                   	cld
 2e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2e2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2e5:	89 d0                	mov    %edx,%eax
 2e7:	c9                   	leave
 2e8:	c3                   	ret
 2e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002f0 <strchr>:

char*
strchr(const char *s, char c)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	8b 45 08             	mov    0x8(%ebp),%eax
 2f6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2fa:	0f b6 10             	movzbl (%eax),%edx
 2fd:	84 d2                	test   %dl,%dl
 2ff:	75 12                	jne    313 <strchr+0x23>
 301:	eb 1d                	jmp    320 <strchr+0x30>
 303:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 308:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 30c:	83 c0 01             	add    $0x1,%eax
 30f:	84 d2                	test   %dl,%dl
 311:	74 0d                	je     320 <strchr+0x30>
    if(*s == c)
 313:	38 d1                	cmp    %dl,%cl
 315:	75 f1                	jne    308 <strchr+0x18>
      return (char*)s;
  return 0;
}
 317:	5d                   	pop    %ebp
 318:	c3                   	ret
 319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 320:	31 c0                	xor    %eax,%eax
}
 322:	5d                   	pop    %ebp
 323:	c3                   	ret
 324:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 32b:	00 
 32c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000330 <gets>:

char*
gets(char *buf, int max)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	57                   	push   %edi
 334:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 335:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 338:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 339:	31 db                	xor    %ebx,%ebx
{
 33b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 33e:	eb 27                	jmp    367 <gets+0x37>
    cc = read(0, &c, 1);
 340:	83 ec 04             	sub    $0x4,%esp
 343:	6a 01                	push   $0x1
 345:	56                   	push   %esi
 346:	6a 00                	push   $0x0
 348:	e8 1e 01 00 00       	call   46b <read>
    if(cc < 1)
 34d:	83 c4 10             	add    $0x10,%esp
 350:	85 c0                	test   %eax,%eax
 352:	7e 1d                	jle    371 <gets+0x41>
      break;
    buf[i++] = c;
 354:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 358:	8b 55 08             	mov    0x8(%ebp),%edx
 35b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 35f:	3c 0a                	cmp    $0xa,%al
 361:	74 10                	je     373 <gets+0x43>
 363:	3c 0d                	cmp    $0xd,%al
 365:	74 0c                	je     373 <gets+0x43>
  for(i=0; i+1 < max; ){
 367:	89 df                	mov    %ebx,%edi
 369:	83 c3 01             	add    $0x1,%ebx
 36c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 36f:	7c cf                	jl     340 <gets+0x10>
 371:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 373:	8b 45 08             	mov    0x8(%ebp),%eax
 376:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 37a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 37d:	5b                   	pop    %ebx
 37e:	5e                   	pop    %esi
 37f:	5f                   	pop    %edi
 380:	5d                   	pop    %ebp
 381:	c3                   	ret
 382:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 389:	00 
 38a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000390 <stat>:

int
stat(const char *n, struct stat *st)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	56                   	push   %esi
 394:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 395:	83 ec 08             	sub    $0x8,%esp
 398:	6a 00                	push   $0x0
 39a:	ff 75 08             	push   0x8(%ebp)
 39d:	e8 f1 00 00 00       	call   493 <open>
  if(fd < 0)
 3a2:	83 c4 10             	add    $0x10,%esp
 3a5:	85 c0                	test   %eax,%eax
 3a7:	78 27                	js     3d0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 3a9:	83 ec 08             	sub    $0x8,%esp
 3ac:	ff 75 0c             	push   0xc(%ebp)
 3af:	89 c3                	mov    %eax,%ebx
 3b1:	50                   	push   %eax
 3b2:	e8 f4 00 00 00       	call   4ab <fstat>
  close(fd);
 3b7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 3ba:	89 c6                	mov    %eax,%esi
  close(fd);
 3bc:	e8 ba 00 00 00       	call   47b <close>
  return r;
 3c1:	83 c4 10             	add    $0x10,%esp
}
 3c4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3c7:	89 f0                	mov    %esi,%eax
 3c9:	5b                   	pop    %ebx
 3ca:	5e                   	pop    %esi
 3cb:	5d                   	pop    %ebp
 3cc:	c3                   	ret
 3cd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 3d0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3d5:	eb ed                	jmp    3c4 <stat+0x34>
 3d7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3de:	00 
 3df:	90                   	nop

000003e0 <atoi>:

int
atoi(const char *s)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	53                   	push   %ebx
 3e4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3e7:	0f be 02             	movsbl (%edx),%eax
 3ea:	8d 48 d0             	lea    -0x30(%eax),%ecx
 3ed:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 3f0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 3f5:	77 1e                	ja     415 <atoi+0x35>
 3f7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3fe:	00 
 3ff:	90                   	nop
    n = n*10 + *s++ - '0';
 400:	83 c2 01             	add    $0x1,%edx
 403:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 406:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 40a:	0f be 02             	movsbl (%edx),%eax
 40d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 410:	80 fb 09             	cmp    $0x9,%bl
 413:	76 eb                	jbe    400 <atoi+0x20>
  return n;
}
 415:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 418:	89 c8                	mov    %ecx,%eax
 41a:	c9                   	leave
 41b:	c3                   	ret
 41c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000420 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	57                   	push   %edi
 424:	8b 45 10             	mov    0x10(%ebp),%eax
 427:	8b 55 08             	mov    0x8(%ebp),%edx
 42a:	56                   	push   %esi
 42b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 42e:	85 c0                	test   %eax,%eax
 430:	7e 13                	jle    445 <memmove+0x25>
 432:	01 d0                	add    %edx,%eax
  dst = vdst;
 434:	89 d7                	mov    %edx,%edi
 436:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 43d:	00 
 43e:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 440:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 441:	39 f8                	cmp    %edi,%eax
 443:	75 fb                	jne    440 <memmove+0x20>
  return vdst;
}
 445:	5e                   	pop    %esi
 446:	89 d0                	mov    %edx,%eax
 448:	5f                   	pop    %edi
 449:	5d                   	pop    %ebp
 44a:	c3                   	ret

0000044b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 44b:	b8 01 00 00 00       	mov    $0x1,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret

00000453 <exit>:
SYSCALL(exit)
 453:	b8 02 00 00 00       	mov    $0x2,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret

0000045b <wait>:
SYSCALL(wait)
 45b:	b8 03 00 00 00       	mov    $0x3,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret

00000463 <pipe>:
SYSCALL(pipe)
 463:	b8 04 00 00 00       	mov    $0x4,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret

0000046b <read>:
SYSCALL(read)
 46b:	b8 05 00 00 00       	mov    $0x5,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret

00000473 <write>:
SYSCALL(write)
 473:	b8 10 00 00 00       	mov    $0x10,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret

0000047b <close>:
SYSCALL(close)
 47b:	b8 15 00 00 00       	mov    $0x15,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret

00000483 <kill>:
SYSCALL(kill)
 483:	b8 06 00 00 00       	mov    $0x6,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret

0000048b <exec>:
SYSCALL(exec)
 48b:	b8 07 00 00 00       	mov    $0x7,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret

00000493 <open>:
SYSCALL(open)
 493:	b8 0f 00 00 00       	mov    $0xf,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret

0000049b <mknod>:
SYSCALL(mknod)
 49b:	b8 11 00 00 00       	mov    $0x11,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret

000004a3 <unlink>:
SYSCALL(unlink)
 4a3:	b8 12 00 00 00       	mov    $0x12,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret

000004ab <fstat>:
SYSCALL(fstat)
 4ab:	b8 08 00 00 00       	mov    $0x8,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret

000004b3 <link>:
SYSCALL(link)
 4b3:	b8 13 00 00 00       	mov    $0x13,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret

000004bb <mkdir>:
SYSCALL(mkdir)
 4bb:	b8 14 00 00 00       	mov    $0x14,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret

000004c3 <chdir>:
SYSCALL(chdir)
 4c3:	b8 09 00 00 00       	mov    $0x9,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret

000004cb <dup>:
SYSCALL(dup)
 4cb:	b8 0a 00 00 00       	mov    $0xa,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret

000004d3 <getpid>:
SYSCALL(getpid)
 4d3:	b8 0b 00 00 00       	mov    $0xb,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret

000004db <sbrk>:
SYSCALL(sbrk)
 4db:	b8 0c 00 00 00       	mov    $0xc,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret

000004e3 <sleep>:
SYSCALL(sleep)
 4e3:	b8 0d 00 00 00       	mov    $0xd,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret

000004eb <uptime>:
SYSCALL(uptime)
 4eb:	b8 0e 00 00 00       	mov    $0xe,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret
 4f3:	66 90                	xchg   %ax,%ax
 4f5:	66 90                	xchg   %ax,%ax
 4f7:	66 90                	xchg   %ax,%ax
 4f9:	66 90                	xchg   %ax,%ax
 4fb:	66 90                	xchg   %ax,%ax
 4fd:	66 90                	xchg   %ax,%ax
 4ff:	90                   	nop

00000500 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	57                   	push   %edi
 504:	56                   	push   %esi
 505:	53                   	push   %ebx
 506:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 508:	89 d1                	mov    %edx,%ecx
{
 50a:	83 ec 3c             	sub    $0x3c,%esp
 50d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 510:	85 d2                	test   %edx,%edx
 512:	0f 89 80 00 00 00    	jns    598 <printint+0x98>
 518:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 51c:	74 7a                	je     598 <printint+0x98>
    x = -xx;
 51e:	f7 d9                	neg    %ecx
    neg = 1;
 520:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 525:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 528:	31 f6                	xor    %esi,%esi
 52a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 530:	89 c8                	mov    %ecx,%eax
 532:	31 d2                	xor    %edx,%edx
 534:	89 f7                	mov    %esi,%edi
 536:	f7 f3                	div    %ebx
 538:	8d 76 01             	lea    0x1(%esi),%esi
 53b:	0f b6 92 4c 0c 00 00 	movzbl 0xc4c(%edx),%edx
 542:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 546:	89 ca                	mov    %ecx,%edx
 548:	89 c1                	mov    %eax,%ecx
 54a:	39 da                	cmp    %ebx,%edx
 54c:	73 e2                	jae    530 <printint+0x30>
  if(neg)
 54e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 551:	85 c0                	test   %eax,%eax
 553:	74 07                	je     55c <printint+0x5c>
    buf[i++] = '-';
 555:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 55a:	89 f7                	mov    %esi,%edi
 55c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 55f:	8b 75 c0             	mov    -0x40(%ebp),%esi
 562:	01 df                	add    %ebx,%edi
 564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 568:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 56b:	83 ec 04             	sub    $0x4,%esp
 56e:	88 45 d7             	mov    %al,-0x29(%ebp)
 571:	8d 45 d7             	lea    -0x29(%ebp),%eax
 574:	6a 01                	push   $0x1
 576:	50                   	push   %eax
 577:	56                   	push   %esi
 578:	e8 f6 fe ff ff       	call   473 <write>
  while(--i >= 0)
 57d:	89 f8                	mov    %edi,%eax
 57f:	83 c4 10             	add    $0x10,%esp
 582:	83 ef 01             	sub    $0x1,%edi
 585:	39 c3                	cmp    %eax,%ebx
 587:	75 df                	jne    568 <printint+0x68>
}
 589:	8d 65 f4             	lea    -0xc(%ebp),%esp
 58c:	5b                   	pop    %ebx
 58d:	5e                   	pop    %esi
 58e:	5f                   	pop    %edi
 58f:	5d                   	pop    %ebp
 590:	c3                   	ret
 591:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 598:	31 c0                	xor    %eax,%eax
 59a:	eb 89                	jmp    525 <printint+0x25>
 59c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000005a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	57                   	push   %edi
 5a4:	56                   	push   %esi
 5a5:	53                   	push   %ebx
 5a6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5a9:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 5ac:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 5af:	0f b6 1e             	movzbl (%esi),%ebx
 5b2:	83 c6 01             	add    $0x1,%esi
 5b5:	84 db                	test   %bl,%bl
 5b7:	74 67                	je     620 <printf+0x80>
 5b9:	8d 4d 10             	lea    0x10(%ebp),%ecx
 5bc:	31 d2                	xor    %edx,%edx
 5be:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 5c1:	eb 34                	jmp    5f7 <printf+0x57>
 5c3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 5c8:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5cb:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 5d0:	83 f8 25             	cmp    $0x25,%eax
 5d3:	74 18                	je     5ed <printf+0x4d>
  write(fd, &c, 1);
 5d5:	83 ec 04             	sub    $0x4,%esp
 5d8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5db:	88 5d e7             	mov    %bl,-0x19(%ebp)
 5de:	6a 01                	push   $0x1
 5e0:	50                   	push   %eax
 5e1:	57                   	push   %edi
 5e2:	e8 8c fe ff ff       	call   473 <write>
 5e7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 5ea:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 5ed:	0f b6 1e             	movzbl (%esi),%ebx
 5f0:	83 c6 01             	add    $0x1,%esi
 5f3:	84 db                	test   %bl,%bl
 5f5:	74 29                	je     620 <printf+0x80>
    c = fmt[i] & 0xff;
 5f7:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 5fa:	85 d2                	test   %edx,%edx
 5fc:	74 ca                	je     5c8 <printf+0x28>
      }
    } else if(state == '%'){
 5fe:	83 fa 25             	cmp    $0x25,%edx
 601:	75 ea                	jne    5ed <printf+0x4d>
      if(c == 'd'){
 603:	83 f8 25             	cmp    $0x25,%eax
 606:	0f 84 04 01 00 00    	je     710 <printf+0x170>
 60c:	83 e8 63             	sub    $0x63,%eax
 60f:	83 f8 15             	cmp    $0x15,%eax
 612:	77 1c                	ja     630 <printf+0x90>
 614:	ff 24 85 f4 0b 00 00 	jmp    *0xbf4(,%eax,4)
 61b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 620:	8d 65 f4             	lea    -0xc(%ebp),%esp
 623:	5b                   	pop    %ebx
 624:	5e                   	pop    %esi
 625:	5f                   	pop    %edi
 626:	5d                   	pop    %ebp
 627:	c3                   	ret
 628:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 62f:	00 
  write(fd, &c, 1);
 630:	83 ec 04             	sub    $0x4,%esp
 633:	8d 55 e7             	lea    -0x19(%ebp),%edx
 636:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 63a:	6a 01                	push   $0x1
 63c:	52                   	push   %edx
 63d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 640:	57                   	push   %edi
 641:	e8 2d fe ff ff       	call   473 <write>
 646:	83 c4 0c             	add    $0xc,%esp
 649:	88 5d e7             	mov    %bl,-0x19(%ebp)
 64c:	6a 01                	push   $0x1
 64e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 651:	52                   	push   %edx
 652:	57                   	push   %edi
 653:	e8 1b fe ff ff       	call   473 <write>
        putc(fd, c);
 658:	83 c4 10             	add    $0x10,%esp
      state = 0;
 65b:	31 d2                	xor    %edx,%edx
 65d:	eb 8e                	jmp    5ed <printf+0x4d>
 65f:	90                   	nop
        printint(fd, *ap, 16, 0);
 660:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 663:	83 ec 0c             	sub    $0xc,%esp
 666:	b9 10 00 00 00       	mov    $0x10,%ecx
 66b:	8b 13                	mov    (%ebx),%edx
 66d:	6a 00                	push   $0x0
 66f:	89 f8                	mov    %edi,%eax
        ap++;
 671:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 674:	e8 87 fe ff ff       	call   500 <printint>
        ap++;
 679:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 67c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 67f:	31 d2                	xor    %edx,%edx
 681:	e9 67 ff ff ff       	jmp    5ed <printf+0x4d>
        s = (char*)*ap;
 686:	8b 45 d0             	mov    -0x30(%ebp),%eax
 689:	8b 18                	mov    (%eax),%ebx
        ap++;
 68b:	83 c0 04             	add    $0x4,%eax
 68e:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 691:	85 db                	test   %ebx,%ebx
 693:	0f 84 87 00 00 00    	je     720 <printf+0x180>
        while(*s != 0){
 699:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 69c:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 69e:	84 c0                	test   %al,%al
 6a0:	0f 84 47 ff ff ff    	je     5ed <printf+0x4d>
 6a6:	8d 55 e7             	lea    -0x19(%ebp),%edx
 6a9:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 6ac:	89 de                	mov    %ebx,%esi
 6ae:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 6b0:	83 ec 04             	sub    $0x4,%esp
 6b3:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 6b6:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 6b9:	6a 01                	push   $0x1
 6bb:	53                   	push   %ebx
 6bc:	57                   	push   %edi
 6bd:	e8 b1 fd ff ff       	call   473 <write>
        while(*s != 0){
 6c2:	0f b6 06             	movzbl (%esi),%eax
 6c5:	83 c4 10             	add    $0x10,%esp
 6c8:	84 c0                	test   %al,%al
 6ca:	75 e4                	jne    6b0 <printf+0x110>
      state = 0;
 6cc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 6cf:	31 d2                	xor    %edx,%edx
 6d1:	e9 17 ff ff ff       	jmp    5ed <printf+0x4d>
        printint(fd, *ap, 10, 1);
 6d6:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 6d9:	83 ec 0c             	sub    $0xc,%esp
 6dc:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6e1:	8b 13                	mov    (%ebx),%edx
 6e3:	6a 01                	push   $0x1
 6e5:	eb 88                	jmp    66f <printf+0xcf>
        putc(fd, *ap);
 6e7:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 6ea:	83 ec 04             	sub    $0x4,%esp
 6ed:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 6f0:	8b 03                	mov    (%ebx),%eax
        ap++;
 6f2:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 6f5:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6f8:	6a 01                	push   $0x1
 6fa:	52                   	push   %edx
 6fb:	57                   	push   %edi
 6fc:	e8 72 fd ff ff       	call   473 <write>
        ap++;
 701:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 704:	83 c4 10             	add    $0x10,%esp
      state = 0;
 707:	31 d2                	xor    %edx,%edx
 709:	e9 df fe ff ff       	jmp    5ed <printf+0x4d>
 70e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 710:	83 ec 04             	sub    $0x4,%esp
 713:	88 5d e7             	mov    %bl,-0x19(%ebp)
 716:	8d 55 e7             	lea    -0x19(%ebp),%edx
 719:	6a 01                	push   $0x1
 71b:	e9 31 ff ff ff       	jmp    651 <printf+0xb1>
 720:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 725:	bb ea 0b 00 00       	mov    $0xbea,%ebx
 72a:	e9 77 ff ff ff       	jmp    6a6 <printf+0x106>
 72f:	90                   	nop

00000730 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 730:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 731:	a1 c0 10 00 00       	mov    0x10c0,%eax
{
 736:	89 e5                	mov    %esp,%ebp
 738:	57                   	push   %edi
 739:	56                   	push   %esi
 73a:	53                   	push   %ebx
 73b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 73e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 741:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 748:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 74a:	39 c8                	cmp    %ecx,%eax
 74c:	73 32                	jae    780 <free+0x50>
 74e:	39 d1                	cmp    %edx,%ecx
 750:	72 04                	jb     756 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 752:	39 d0                	cmp    %edx,%eax
 754:	72 32                	jb     788 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 756:	8b 73 fc             	mov    -0x4(%ebx),%esi
 759:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 75c:	39 fa                	cmp    %edi,%edx
 75e:	74 30                	je     790 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 760:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 763:	8b 50 04             	mov    0x4(%eax),%edx
 766:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 769:	39 f1                	cmp    %esi,%ecx
 76b:	74 3a                	je     7a7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 76d:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 76f:	5b                   	pop    %ebx
  freep = p;
 770:	a3 c0 10 00 00       	mov    %eax,0x10c0
}
 775:	5e                   	pop    %esi
 776:	5f                   	pop    %edi
 777:	5d                   	pop    %ebp
 778:	c3                   	ret
 779:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 780:	39 d0                	cmp    %edx,%eax
 782:	72 04                	jb     788 <free+0x58>
 784:	39 d1                	cmp    %edx,%ecx
 786:	72 ce                	jb     756 <free+0x26>
{
 788:	89 d0                	mov    %edx,%eax
 78a:	eb bc                	jmp    748 <free+0x18>
 78c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 790:	03 72 04             	add    0x4(%edx),%esi
 793:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 796:	8b 10                	mov    (%eax),%edx
 798:	8b 12                	mov    (%edx),%edx
 79a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 79d:	8b 50 04             	mov    0x4(%eax),%edx
 7a0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7a3:	39 f1                	cmp    %esi,%ecx
 7a5:	75 c6                	jne    76d <free+0x3d>
    p->s.size += bp->s.size;
 7a7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 7aa:	a3 c0 10 00 00       	mov    %eax,0x10c0
    p->s.size += bp->s.size;
 7af:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7b2:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 7b5:	89 08                	mov    %ecx,(%eax)
}
 7b7:	5b                   	pop    %ebx
 7b8:	5e                   	pop    %esi
 7b9:	5f                   	pop    %edi
 7ba:	5d                   	pop    %ebp
 7bb:	c3                   	ret
 7bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000007c0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7c0:	55                   	push   %ebp
 7c1:	89 e5                	mov    %esp,%ebp
 7c3:	57                   	push   %edi
 7c4:	56                   	push   %esi
 7c5:	53                   	push   %ebx
 7c6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7c9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7cc:	8b 15 c0 10 00 00    	mov    0x10c0,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7d2:	8d 78 07             	lea    0x7(%eax),%edi
 7d5:	c1 ef 03             	shr    $0x3,%edi
 7d8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 7db:	85 d2                	test   %edx,%edx
 7dd:	0f 84 8d 00 00 00    	je     870 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e3:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7e5:	8b 48 04             	mov    0x4(%eax),%ecx
 7e8:	39 f9                	cmp    %edi,%ecx
 7ea:	73 64                	jae    850 <malloc+0x90>
  if(nu < 4096)
 7ec:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7f1:	39 df                	cmp    %ebx,%edi
 7f3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 7f6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 7fd:	eb 0a                	jmp    809 <malloc+0x49>
 7ff:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 800:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 802:	8b 48 04             	mov    0x4(%eax),%ecx
 805:	39 f9                	cmp    %edi,%ecx
 807:	73 47                	jae    850 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 809:	89 c2                	mov    %eax,%edx
 80b:	3b 05 c0 10 00 00    	cmp    0x10c0,%eax
 811:	75 ed                	jne    800 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 813:	83 ec 0c             	sub    $0xc,%esp
 816:	56                   	push   %esi
 817:	e8 bf fc ff ff       	call   4db <sbrk>
  if(p == (char*)-1)
 81c:	83 c4 10             	add    $0x10,%esp
 81f:	83 f8 ff             	cmp    $0xffffffff,%eax
 822:	74 1c                	je     840 <malloc+0x80>
  hp->s.size = nu;
 824:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 827:	83 ec 0c             	sub    $0xc,%esp
 82a:	83 c0 08             	add    $0x8,%eax
 82d:	50                   	push   %eax
 82e:	e8 fd fe ff ff       	call   730 <free>
  return freep;
 833:	8b 15 c0 10 00 00    	mov    0x10c0,%edx
      if((p = morecore(nunits)) == 0)
 839:	83 c4 10             	add    $0x10,%esp
 83c:	85 d2                	test   %edx,%edx
 83e:	75 c0                	jne    800 <malloc+0x40>
        return 0;
  }
}
 840:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 843:	31 c0                	xor    %eax,%eax
}
 845:	5b                   	pop    %ebx
 846:	5e                   	pop    %esi
 847:	5f                   	pop    %edi
 848:	5d                   	pop    %ebp
 849:	c3                   	ret
 84a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 850:	39 cf                	cmp    %ecx,%edi
 852:	74 4c                	je     8a0 <malloc+0xe0>
        p->s.size -= nunits;
 854:	29 f9                	sub    %edi,%ecx
 856:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 859:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 85c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 85f:	89 15 c0 10 00 00    	mov    %edx,0x10c0
}
 865:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 868:	83 c0 08             	add    $0x8,%eax
}
 86b:	5b                   	pop    %ebx
 86c:	5e                   	pop    %esi
 86d:	5f                   	pop    %edi
 86e:	5d                   	pop    %ebp
 86f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 870:	c7 05 c0 10 00 00 c4 	movl   $0x10c4,0x10c0
 877:	10 00 00 
    base.s.size = 0;
 87a:	b8 c4 10 00 00       	mov    $0x10c4,%eax
    base.s.ptr = freep = prevp = &base;
 87f:	c7 05 c4 10 00 00 c4 	movl   $0x10c4,0x10c4
 886:	10 00 00 
    base.s.size = 0;
 889:	c7 05 c8 10 00 00 00 	movl   $0x0,0x10c8
 890:	00 00 00 
    if(p->s.size >= nunits){
 893:	e9 54 ff ff ff       	jmp    7ec <malloc+0x2c>
 898:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 89f:	00 
        prevp->s.ptr = p->s.ptr;
 8a0:	8b 08                	mov    (%eax),%ecx
 8a2:	89 0a                	mov    %ecx,(%edx)
 8a4:	eb b9                	jmp    85f <malloc+0x9f>
 8a6:	66 90                	xchg   %ax,%ax
 8a8:	66 90                	xchg   %ax,%ax
 8aa:	66 90                	xchg   %ax,%ax
 8ac:	66 90                	xchg   %ax,%ax
 8ae:	66 90                	xchg   %ax,%ax

000008b0 <thread_init>:
 
static void thread_stub(void (*fn)(void*), void *arg);

void thread_init(void) {

  for (int i = 0; i < MAX_THREADS; i++)
 8b0:	b8 00 11 00 00       	mov    $0x1100,%eax
 8b5:	8d 76 00             	lea    0x0(%esi),%esi
    table[i].state = FREE;
 8b8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  for (int i = 0; i < MAX_THREADS; i++)
 8be:	83 c0 20             	add    $0x20,%eax
    table[i].state = FREE;
 8c1:	c7 40 f0 00 00 00 00 	movl   $0x0,-0x10(%eax)
  for (int i = 0; i < MAX_THREADS; i++)
 8c8:	3d 00 12 00 00       	cmp    $0x1200,%eax
 8cd:	75 e9                	jne    8b8 <thread_init+0x8>
 
  table[0].state = RUNNING;
  table[0].tid   = next_tid++;
 8cf:	a1 6c 10 00 00       	mov    0x106c,%eax
  table[0].state = RUNNING;
 8d4:	c7 05 00 11 00 00 02 	movl   $0x2,0x1100
 8db:	00 00 00 
  table[0].stack = 0;   
 8de:	c7 05 08 11 00 00 00 	movl   $0x0,0x1108
 8e5:	00 00 00 
  table[0].tid   = next_tid++;
 8e8:	8d 50 01             	lea    0x1(%eax),%edx
 8eb:	a3 04 11 00 00       	mov    %eax,0x1104
 8f0:	89 15 6c 10 00 00    	mov    %edx,0x106c
  table[0].ctx   = &main_ctx;
 8f6:	c7 05 0c 11 00 00 e0 	movl   $0x10e0,0x110c
 8fd:	10 00 00 
  current = 0;
 900:	c7 05 f4 10 00 00 00 	movl   $0x0,0x10f4
 907:	00 00 00 
}
 90a:	c3                   	ret
 90b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000910 <thread_create>:
      return idx;
  }
  return -1;
}
 
tid_t thread_create(void (*fn)(void*), void *arg) {
 910:	55                   	push   %ebp
  int slot = -1;
  for (int i = 1; i < MAX_THREADS; i++) {
 911:	b8 01 00 00 00       	mov    $0x1,%eax
tid_t thread_create(void (*fn)(void*), void *arg) {
 916:	89 e5                	mov    %esp,%ebp
 918:	56                   	push   %esi
 919:	53                   	push   %ebx
 91a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if (table[i].state == FREE) { slot = i; break; }
 920:	89 c3                	mov    %eax,%ebx
 922:	c1 e3 04             	shl    $0x4,%ebx
 925:	8b 93 00 11 00 00    	mov    0x1100(%ebx),%edx
 92b:	85 d2                	test   %edx,%edx
 92d:	74 19                	je     948 <thread_create+0x38>
  for (int i = 1; i < MAX_THREADS; i++) {
 92f:	83 c0 01             	add    $0x1,%eax
 932:	83 f8 10             	cmp    $0x10,%eax
 935:	75 e9                	jne    920 <thread_create+0x10>
  }
  if (slot == -1) return -1;
 937:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 93c:	e9 98 00 00 00       	jmp    9d9 <thread_create+0xc9>
 941:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 
  char *stk = malloc(STACK_SIZE);
 948:	83 ec 0c             	sub    $0xc,%esp
 94b:	68 00 20 00 00       	push   $0x2000
 950:	e8 6b fe ff ff       	call   7c0 <malloc>
  if (!stk) return -1;
 955:	83 c4 10             	add    $0x10,%esp
  char *stk = malloc(STACK_SIZE);
 958:	89 c6                	mov    %eax,%esi
  if (!stk) return -1;
 95a:	85 c0                	test   %eax,%eax
 95c:	74 d9                	je     937 <thread_create+0x27>
  memset(stk, 0, STACK_SIZE);
 95e:	83 ec 04             	sub    $0x4,%esp
 961:	68 00 20 00 00       	push   $0x2000
 966:	6a 00                	push   $0x0
 968:	56                   	push   %esi
 969:	e8 62 f9 ff ff       	call   2d0 <memset>

  uint *sp = (uint*)(stk + STACK_SIZE);
  sp--;  *sp = (uint)arg;
 96e:	8b 45 0c             	mov    0xc(%ebp),%eax
  sp--;  *sp = 0;   /* esi */
  sp--;  *sp = 0;   /* edi */

  table[slot].state = RUNNABLE;
  table[slot].tid   = next_tid++;
  table[slot].stack = stk;
 971:	89 b3 08 11 00 00    	mov    %esi,0x1108(%ebx)
  table[slot].ctx   = (struct context*)sp;

  return table[slot].tid;
 977:	83 c4 10             	add    $0x10,%esp
  sp--;  *sp = 0xffffffff;
 97a:	c7 86 f4 1f 00 00 ff 	movl   $0xffffffff,0x1ff4(%esi)
 981:	ff ff ff 
  sp--;  *sp = 0;   /* edi */
 984:	81 c6 e0 1f 00 00    	add    $0x1fe0,%esi
  sp--;  *sp = (uint)arg;
 98a:	89 46 1c             	mov    %eax,0x1c(%esi)
  sp--;  *sp = (uint)fn;
 98d:	8b 45 08             	mov    0x8(%ebp),%eax
  sp--;  *sp = (uint)thread_stub;
 990:	c7 46 10 80 0a 00 00 	movl   $0xa80,0x10(%esi)
  sp--;  *sp = (uint)fn;
 997:	89 46 18             	mov    %eax,0x18(%esi)
  table[slot].tid   = next_tid++;
 99a:	a1 6c 10 00 00       	mov    0x106c,%eax
  sp--;  *sp = 0;   /* ebp */
 99f:	c7 46 0c 00 00 00 00 	movl   $0x0,0xc(%esi)
  table[slot].tid   = next_tid++;
 9a6:	8d 48 01             	lea    0x1(%eax),%ecx
  sp--;  *sp = 0;   /* ebx */
 9a9:	c7 46 08 00 00 00 00 	movl   $0x0,0x8(%esi)
  sp--;  *sp = 0;   /* esi */
 9b0:	c7 46 04 00 00 00 00 	movl   $0x0,0x4(%esi)
  sp--;  *sp = 0;   /* edi */
 9b7:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  table[slot].state = RUNNABLE;
 9bd:	c7 83 00 11 00 00 01 	movl   $0x1,0x1100(%ebx)
 9c4:	00 00 00 
  table[slot].tid   = next_tid++;
 9c7:	89 0d 6c 10 00 00    	mov    %ecx,0x106c
 9cd:	89 83 04 11 00 00    	mov    %eax,0x1104(%ebx)
  sp--;  *sp = 0;   /* edi */
 9d3:	89 b3 0c 11 00 00    	mov    %esi,0x110c(%ebx)
}
 9d9:	8d 65 f8             	lea    -0x8(%ebp),%esp
 9dc:	5b                   	pop    %ebx
 9dd:	5e                   	pop    %esi
 9de:	5d                   	pop    %ebp
 9df:	c3                   	ret

000009e0 <thread_yield>:
  thread_yield();
 
  exit();
}
 
void thread_yield(void) {
 9e0:	55                   	push   %ebp
 9e1:	89 e5                	mov    %esp,%ebp
 9e3:	56                   	push   %esi
 9e4:	53                   	push   %ebx
    int idx = (current + i) % MAX_THREADS;
 9e5:	8b 35 f4 10 00 00    	mov    0x10f4,%esi
 9eb:	8d 4e 01             	lea    0x1(%esi),%ecx
 9ee:	8d 5e 11             	lea    0x11(%esi),%ebx
 9f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9f8:	89 ca                	mov    %ecx,%edx
 9fa:	c1 fa 1f             	sar    $0x1f,%edx
 9fd:	c1 ea 1c             	shr    $0x1c,%edx
 a00:	8d 04 11             	lea    (%ecx,%edx,1),%eax
 a03:	83 e0 0f             	and    $0xf,%eax
 a06:	29 d0                	sub    %edx,%eax
    if (table[idx].state == RUNNABLE)
 a08:	89 c2                	mov    %eax,%edx
 a0a:	c1 e2 04             	shl    $0x4,%edx
 a0d:	83 ba 00 11 00 00 01 	cmpl   $0x1,0x1100(%edx)
 a14:	74 12                	je     a28 <thread_yield+0x48>
  for (int i = 1; i <= MAX_THREADS; i++) {
 a16:	83 c1 01             	add    $0x1,%ecx
 a19:	39 d9                	cmp    %ebx,%ecx
 a1b:	75 db                	jne    9f8 <thread_yield+0x18>
    table[prev].state = RUNNABLE;
  table[next].state = RUNNING;
  current = next;

  uswtch(&table[prev].ctx, table[next].ctx);
}
 a1d:	8d 65 f8             	lea    -0x8(%ebp),%esp
 a20:	5b                   	pop    %ebx
 a21:	5e                   	pop    %esi
 a22:	5d                   	pop    %ebp
 a23:	c3                   	ret
 a24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if (next == -1) return;
 a28:	83 f8 ff             	cmp    $0xffffffff,%eax
 a2b:	74 f0                	je     a1d <thread_yield+0x3d>
  if (table[prev].state == RUNNING)
 a2d:	89 f2                	mov    %esi,%edx
 a2f:	c1 e2 04             	shl    $0x4,%edx
 a32:	83 ba 00 11 00 00 02 	cmpl   $0x2,0x1100(%edx)
 a39:	75 0a                	jne    a45 <thread_yield+0x65>
    table[prev].state = RUNNABLE;
 a3b:	c7 82 00 11 00 00 01 	movl   $0x1,0x1100(%edx)
 a42:	00 00 00 
  table[next].state = RUNNING;
 a45:	89 c2                	mov    %eax,%edx
  uswtch(&table[prev].ctx, table[next].ctx);
 a47:	c1 e6 04             	shl    $0x4,%esi
 a4a:	83 ec 08             	sub    $0x8,%esp
  current = next;
 a4d:	a3 f4 10 00 00       	mov    %eax,0x10f4
  table[next].state = RUNNING;
 a52:	c1 e2 04             	shl    $0x4,%edx
  uswtch(&table[prev].ctx, table[next].ctx);
 a55:	81 c6 0c 11 00 00    	add    $0x110c,%esi
  table[next].state = RUNNING;
 a5b:	c7 82 00 11 00 00 02 	movl   $0x2,0x1100(%edx)
 a62:	00 00 00 
  uswtch(&table[prev].ctx, table[next].ctx);
 a65:	ff b2 0c 11 00 00    	push   0x110c(%edx)
 a6b:	56                   	push   %esi
 a6c:	e8 1d 01 00 00       	call   b8e <uswtch>
 a71:	83 c4 10             	add    $0x10,%esp
}
 a74:	8d 65 f8             	lea    -0x8(%ebp),%esp
 a77:	5b                   	pop    %ebx
 a78:	5e                   	pop    %esi
 a79:	5d                   	pop    %ebp
 a7a:	c3                   	ret
 a7b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000a80 <thread_stub>:
static void thread_stub(void (*fn)(void*), void *arg) {
 a80:	55                   	push   %ebp
 a81:	89 e5                	mov    %esp,%ebp
 a83:	83 ec 14             	sub    $0x14,%esp
  fn(arg);
 a86:	ff 75 0c             	push   0xc(%ebp)
 a89:	ff 55 08             	call   *0x8(%ebp)
  table[current].state = ZOMBIE;
 a8c:	a1 f4 10 00 00       	mov    0x10f4,%eax
 a91:	c1 e0 04             	shl    $0x4,%eax
 a94:	c7 80 00 11 00 00 03 	movl   $0x3,0x1100(%eax)
 a9b:	00 00 00 
  thread_yield();
 a9e:	e8 3d ff ff ff       	call   9e0 <thread_yield>
  exit();
 aa3:	e8 ab f9 ff ff       	call   453 <exit>
 aa8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 aaf:	00 

00000ab0 <thread_join>:


int thread_join(tid_t tid) {
 ab0:	55                   	push   %ebp
 ab1:	89 e5                	mov    %esp,%ebp
 ab3:	56                   	push   %esi
 ab4:	53                   	push   %ebx
 ab5:	8b 45 08             	mov    0x8(%ebp),%eax

  int slot = -1;
  for (int i = 0; i < MAX_THREADS; i++) {
 ab8:	31 db                	xor    %ebx,%ebx
 aba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if (table[i].tid == tid) { slot = i; break; }
 ac0:	89 de                	mov    %ebx,%esi
 ac2:	c1 e6 04             	shl    $0x4,%esi
 ac5:	39 86 04 11 00 00    	cmp    %eax,0x1104(%esi)
 acb:	74 20                	je     aed <thread_join+0x3d>
  for (int i = 0; i < MAX_THREADS; i++) {
 acd:	83 c3 01             	add    $0x1,%ebx
 ad0:	83 fb 10             	cmp    $0x10,%ebx
 ad3:	75 eb                	jne    ac0 <thread_join+0x10>
  table[slot].state = FREE;
  table[slot].stack = 0;
  table[slot].ctx   = 0;
 
  return 0;
 ad5:	8d 65 f8             	lea    -0x8(%ebp),%esp
  if (slot == -1) return -1;
 ad8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 add:	5b                   	pop    %ebx
 ade:	5e                   	pop    %esi
 adf:	5d                   	pop    %ebp
 ae0:	c3                   	ret
 ae1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    thread_yield();
 ae8:	e8 f3 fe ff ff       	call   9e0 <thread_yield>
  while (table[slot].state != ZOMBIE)
 aed:	83 be 00 11 00 00 03 	cmpl   $0x3,0x1100(%esi)
 af4:	75 f2                	jne    ae8 <thread_join+0x38>
  if (table[slot].stack)
 af6:	89 d8                	mov    %ebx,%eax
 af8:	c1 e0 04             	shl    $0x4,%eax
 afb:	8b 80 08 11 00 00    	mov    0x1108(%eax),%eax
 b01:	85 c0                	test   %eax,%eax
 b03:	74 0c                	je     b11 <thread_join+0x61>
    free(table[slot].stack);
 b05:	83 ec 0c             	sub    $0xc,%esp
 b08:	50                   	push   %eax
 b09:	e8 22 fc ff ff       	call   730 <free>
 b0e:	83 c4 10             	add    $0x10,%esp
  table[slot].state = FREE;
 b11:	c1 e3 04             	shl    $0x4,%ebx
  return 0;
 b14:	31 c0                	xor    %eax,%eax
  table[slot].state = FREE;
 b16:	c7 83 00 11 00 00 00 	movl   $0x0,0x1100(%ebx)
 b1d:	00 00 00 
  table[slot].stack = 0;
 b20:	c7 83 08 11 00 00 00 	movl   $0x0,0x1108(%ebx)
 b27:	00 00 00 
  table[slot].ctx   = 0;
 b2a:	c7 83 0c 11 00 00 00 	movl   $0x0,0x110c(%ebx)
 b31:	00 00 00 
 b34:	8d 65 f8             	lea    -0x8(%ebp),%esp
 b37:	5b                   	pop    %ebx
 b38:	5e                   	pop    %esi
 b39:	5d                   	pop    %ebp
 b3a:	c3                   	ret
 b3b:	66 90                	xchg   %ax,%ax
 b3d:	66 90                	xchg   %ax,%ax
 b3f:	90                   	nop

00000b40 <mutex_init>:
#include "stat.h"
#include "user.h"
#include "uthread.h"
#include "umutex.h"

void mutex_init(umutex_t *m){ m->locked = 0; }
 b40:	55                   	push   %ebp
 b41:	89 e5                	mov    %esp,%ebp
 b43:	8b 45 08             	mov    0x8(%ebp),%eax
 b46:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 b4c:	5d                   	pop    %ebp
 b4d:	c3                   	ret
 b4e:	66 90                	xchg   %ax,%ax

00000b50 <mutex_lock>:
void mutex_lock(umutex_t *m){ while(m->locked){ thread_yield(); } m->locked = 1; }
 b50:	55                   	push   %ebp
 b51:	89 e5                	mov    %esp,%ebp
 b53:	53                   	push   %ebx
 b54:	83 ec 04             	sub    $0x4,%esp
 b57:	8b 5d 08             	mov    0x8(%ebp),%ebx
 b5a:	8b 03                	mov    (%ebx),%eax
 b5c:	85 c0                	test   %eax,%eax
 b5e:	74 0b                	je     b6b <mutex_lock+0x1b>
 b60:	e8 7b fe ff ff       	call   9e0 <thread_yield>
 b65:	8b 03                	mov    (%ebx),%eax
 b67:	85 c0                	test   %eax,%eax
 b69:	75 f5                	jne    b60 <mutex_lock+0x10>
 b6b:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
 b71:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 b74:	c9                   	leave
 b75:	c3                   	ret
 b76:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 b7d:	00 
 b7e:	66 90                	xchg   %ax,%ax

00000b80 <mutex_unlock>:
void mutex_unlock(umutex_t *m){ m->locked = 0; }
 b80:	55                   	push   %ebp
 b81:	89 e5                	mov    %esp,%ebp
 b83:	8b 45 08             	mov    0x8(%ebp),%eax
 b86:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 b8c:	5d                   	pop    %ebp
 b8d:	c3                   	ret

00000b8e <uswtch>:
.text
.globl uswtch
uswtch:
  movl 4(%esp), %eax
 b8e:	8b 44 24 04          	mov    0x4(%esp),%eax
  movl 8(%esp), %edx
 b92:	8b 54 24 08          	mov    0x8(%esp),%edx

  pushl %ebp
 b96:	55                   	push   %ebp
  pushl %ebx
 b97:	53                   	push   %ebx
  pushl %esi
 b98:	56                   	push   %esi
  pushl %edi
 b99:	57                   	push   %edi

  movl %esp, (%eax)
 b9a:	89 20                	mov    %esp,(%eax)
  movl %edx, %esp
 b9c:	89 d4                	mov    %edx,%esp

  popl %edi
 b9e:	5f                   	pop    %edi
  popl %esi
 b9f:	5e                   	pop    %esi
  popl %ebx
 ba0:	5b                   	pop    %ebx
  popl %ebp
 ba1:	5d                   	pop    %ebp
 ba2:	c3                   	ret
