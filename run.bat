@echo off
cd D:\uci0600\uciencgui\
title ��ʼ���С���
color 3F
echo ���ι���3���ļ�Ҫ����
echo �����1���ļ�����3��
echo �ļ�·��ΪD:\110����\����\�༶�ճ�\DSC_0003.jpg
imgdec.exe "D:\110����\����\�༶�ճ�\DSC_0003.jpg" "D:\110����\����\�༶�ճ�\DSC_0003.bmp"
ucienc.exe "D:\110����\����\�༶�ճ�\DSC_0003.bmp" -q 0.0
del "D:\110����\����\�༶�ճ�\DSC_0003.bmp"
echo һ���ļ�����ɣ�
echo �����2���ļ�����3��
echo �ļ�·��ΪD:\110����\����\�༶�ճ�\DSC_0001.jpg
imgdec.exe "D:\110����\����\�༶�ճ�\DSC_0001.jpg" "D:\110����\����\�༶�ճ�\DSC_0001.bmp"
ucienc.exe "D:\110����\����\�༶�ճ�\DSC_0001.bmp" -q 0.0
del "D:\110����\����\�༶�ճ�\DSC_0001.bmp"
echo һ���ļ�����ɣ�
echo �����3���ļ�����3��
echo �ļ�·��ΪD:\110����\����\�༶�ճ�\DSC_0002.jpg
imgdec.exe "D:\110����\����\�༶�ճ�\DSC_0002.jpg" "D:\110����\����\�༶�ճ�\DSC_0002.bmp"
ucienc.exe "D:\110����\����\�༶�ճ�\DSC_0002.bmp" -q 0.0
del "D:\110����\����\�༶�ճ�\DSC_0002.bmp"
echo һ���ļ�����ɣ�
echo ȫ���ļ���ɡ���ֱ�ӹرմ��ڡ�
color 2F
title ��ɣ�
pause>nul
exit
