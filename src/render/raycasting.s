.include "../map/map.s"

.text

raycast_size: .double 0.001

raycast:
    push %rbp
    mov %rsp, %rbp

    

    push %rbp, %rsp
    pop %rbp
    ret