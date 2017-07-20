@echo off
cd D:\uci0600\uciencgui\
title 开始运行……
color 3F
echo 本次共有3个文件要处理。
echo 处理第1个文件，共3个
echo 文件路径为D:\110回忆\整理\班级日常\DSC_0003.jpg
imgdec.exe "D:\110回忆\整理\班级日常\DSC_0003.jpg" "D:\110回忆\整理\班级日常\DSC_0003.bmp"
ucienc.exe "D:\110回忆\整理\班级日常\DSC_0003.bmp" -q 0.0
del "D:\110回忆\整理\班级日常\DSC_0003.bmp"
echo 一个文件已完成！
echo 处理第2个文件，共3个
echo 文件路径为D:\110回忆\整理\班级日常\DSC_0001.jpg
imgdec.exe "D:\110回忆\整理\班级日常\DSC_0001.jpg" "D:\110回忆\整理\班级日常\DSC_0001.bmp"
ucienc.exe "D:\110回忆\整理\班级日常\DSC_0001.bmp" -q 0.0
del "D:\110回忆\整理\班级日常\DSC_0001.bmp"
echo 一个文件已完成！
echo 处理第3个文件，共3个
echo 文件路径为D:\110回忆\整理\班级日常\DSC_0002.jpg
imgdec.exe "D:\110回忆\整理\班级日常\DSC_0002.jpg" "D:\110回忆\整理\班级日常\DSC_0002.bmp"
ucienc.exe "D:\110回忆\整理\班级日常\DSC_0002.bmp" -q 0.0
del "D:\110回忆\整理\班级日常\DSC_0002.bmp"
echo 一个文件已完成！
echo 全部文件完成。请直接关闭窗口。
color 2F
title 完成！
pause>nul
exit
