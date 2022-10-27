.include "../map.s"

.text
RAYCAST_SIZE: .double 0.001

raycast:
    push %rbp
    mov %rsp, %rbp

    

    push %rbp, %rsp
    pop %rbp
    ret