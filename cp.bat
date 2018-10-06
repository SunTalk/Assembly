@echo off

cls

echo COMPILEING...
ml /c /Zd /coff %1.asm

echo CHANGE FILE...
\masm32\bin\Link /SUBSYSTEM:CONSOLE %1.obj

echo FINISH
%1.exe