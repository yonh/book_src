; TAB=4

;��������Ǳ�׼FAT12��ʽ����ר�ô��룬�Ҳ������

db 0xeb,0x4e,0x90
db "HELLOIPL"       ;�����������ƿ����������ַ���(8�ֽ�)
dw 512              ;ÿ������(sector)�Ĵ�С(����Ϊ512�ֽ�)
db 1                ;��(cluster)�Ĵ�С(����Ϊһ������)
dw 1                ;FAT����ʼλ��(һ��ӵ�һ��������ʼ)
db 2                ;FAT�ĸ���(����Ϊ2)
dw 224              ;��Ŀ¼��С(һ�����ó�224��)
dw 2880             ;�ô��̵Ĵ�С(������2880����)
db 0xf0             ;���̵�����(������0xf0)
dw 9                ;FAT�ĳ���(������9����)
dw 18               ;1���ŵ�(track)�м�������(������18)
dw 2                ;��ͷ��(������2)
dd 0                ;��ʹ�÷�����������0
dd 2880             ;��дһ�δ��̴�С
db 0,0,0x29         ;���岻��,�̶�
dd 0xffffffff       ;(������)�������
db "TOFU-OS    "    ;���̵�����(11�ֽ�)
db "FAT12   "       ;���̸�ʽ����(8�ֽ�)
resb 18             ;�ȿճ�18�ֽ�

; ��������
db 0xb8,0x00,0x00,0x8e,0xd0,0xbc,0x00,0x7c
db 0x8e,0xd8,0x8e,0xc0,0xbe,0x74,0x7c,0x8a
db 0x04,0x83,0xc6,0x01,0x3c,0x00,0x74,0x09
db 0xb4,0x0e,0xbb,0x0f,0x00,0xcd,0x10,0xeb
db 0xee,0xf4,0xeb,0xfd

; ��Ϣ��ʾ����
db 0x0a,0x0a        ;2������
db "hello, world"
db 0x0a             ;����
db 0

RESB   0x1fe - $	;��д0x00,ֱ��0x001fe
db 0x55,0xaa

; ���������������ⲿ�ֵ����
db 0xf0,0xff,0xff,0x00,0x00,0x00,0x00,0x00
resb 4600
db 0xf0,0xff,0xff,0x00,0x00,0x00,0x00,0x00
resb 1469432
