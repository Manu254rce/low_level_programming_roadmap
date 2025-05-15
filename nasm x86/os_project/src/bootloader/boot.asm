org 0x7C00
bits 16

%define ENDL 0x0D, 0x0A

JMP short start
NOP

bdb_oem:                        db 'MSWIN4.1'
bdb_bytes_per_sector:           dw 512
bdb_sectors_per_cluster:        db 1
bdb_reserved_sectors:           dw 1
bdb_number_of_fats:             db 2
bdb_dir_entries_count:          dw 0E0h
bdb_total_sectors:              dw 2880
bdb_media_descriptor:           db 0F0h
bdb_sectors_per_fat:            dw 9
bdb_sectors_per_track:          dw 18
bdb_heads:                      dw 2
bdb_hidden_sectors:             dd 0
bdb_large_sector_count:         dd 0

ebr_drive_number:               db 0
                                db 0
ebr_signature:                  db 0x29
ebr_volume_id:                  dd 12h, 45h, 01h, 38h
ebr_volume_label:               db 'NO NAME      '
ebr_system_id:                  db 'FAT12   '

start:
    JMP main

puts:
    PUSH si
    PUSH ax

.loop:
    LODSB
    OR al, al
    JZ .done

    MOV ah, 0x0E
    INT 0x10

    JMP .loop

.done:
    POP ax
    POP si
    RET

main:
    MOV ax, 0
    MOV ds, ax
    MOV es, ax

    MOV ss, ax
    MOV sp, 0x7C00

    MOV [ebr_drive_number], dl
    MOV ax, 1
    MOV cl, 1
    MOV bx, 0x7E00
    CALL disk_read

    MOV si, msg_hello
    CALL puts

    HLT

floppy_error:
    MOV si, msg_read_fail
    CALL puts
    JMP wait_key_and_reboot

wait_key_and_reboot:
    MOV ah, 0x00
    INT 0x16
    JMP 0xFFFF:0
    HLT

.halt:
    CLI
    HLT

lba_to_chs:
    PUSH ax
    PUSH dx

    XOR dx, dx
    DIV word [bdb_sectors_per_track]

    INC dx, 0x0A
    MOV cx, dx

    XOR dx, dx
    DIV word [bdb_heads]

    MOV dh, dl
    MOV ch, al
    SHL ah, 6
    OR cl, ah

    POP ax
    MOV dl, al
    POP ax

    RET

disk_read:
    PUSH ax
    PUSH bx
    PUSH cx
    PUSH dx
    PUSH di

    PUSH cx
    CALL lba_to_chs
    POP ax

    MOV ah, 0x2
    MOV di, 3

.retry:
    PUSHA
    STC 
    INT 0x13
    JNC .done


    POPA
    CALL disk_reset
    TEST di, di
    JNZ .retry

.fail
    JMP floppy_error
.done:
    POPA

    PUSH di
    PUSH dx
    PUSH cx
    PUSH bx
    PUSH ax

    RET

disk_reset:
    PUSHA
    MOV ah, 0x00
    STC
    INT 0x13
    JC floppy_error
    POPA

    RET

msg_hello:              DB 'Hi Zphyr!', ENDL, 0
msg_read_fail:          DB 'Read failed!', ENDL, 0

times 510 - ($ - $$) DB 0
DW 0xAA55