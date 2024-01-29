@echo off
cd /d %~dp0
setlocal enabledelayedexpansion
set tmp=
set WORD=
set len=

echo ****************************************************
echo * Initialize Process
echo ****************************************************
start "" msedge.exe --new-window
echo %date% %time% : Opening a new window in Microsoft Edge.
echo %date% %time% : Wait 3 seconds...
timeout /nobreak 3 > nul

echo ****************************************************
echo * Search with Bing by PC User Agent
echo ****************************************************
call :SEARCH_PC
echo %date% %time% : Waiting for Bing searches to be completed.
echo %date% %time% : Wait 7 seconds...
timeout /nobreak 7 > nul

echo ****************************************************
echo * Finalize Process
echo ****************************************************
taskkill /im msedge.exe /f > nul 2>&1
echo %date% %time% : Starting Microsoft Edge's processes(--no-startup-window).
start "" msedge.exe --no-startup-window --win-session-start /prefetch:5
echo %date% %time% : Wait 3 seconds...
timeout /nobreak 3 > nul
echo %date% %time% : Starting Microsoft Edge's processes.
start "" msedge.exe --window-size=1000,600
echo %date% %time% : Wait 3 seconds...
timeout /nobreak 3 > nul

echo Press the ENTER Key...
pause > nul
exit /b

rem ****************************************************
rem SEARCH_PC
rem ****************************************************
:SEARCH_PC
for /l %%i in (1,1,35) do (
  for /l %%i in (1,1,10) do (
    for /l %%i in (1,1,1) do (
      set X=!RANDOM:~-2!
      call :RANDOM_NUM_LEN !X!
      if !len! == 1 set X=0!X!
      call :GET_CHAR !X!
      set WORD=!WORD!!tmp!^ 
    )
  )
timeout /nobreak 7 > nul
echo !date! !time! : Searching for !WORD!
start "" msedge.exe https://www.bing.com/search?q="!WORD!"^&qs=n^&form=QBRE^&sp=-1^&ghc=1^&lq=0^&pq="!WORD!"^&sc=11-4^&sk=^&cvid=C9DAAFE5BF104B4A94198111D7754C41^&ghsh=0^&ghacc=0^&ghpl=
set WORD=
)
exit /b

rem ****************************************************
rem RANDOM_NUM_LEN
rem ****************************************************
:RANDOM_NUM_LEN %1
set str=%1
set len=0

:LOOP
if not "%str%"=="" (
  set str=%str:~1%
  set /a len=%len%+1
  goto :LOOP
)
exit /b

rem ****************************************************
rem GET_CHAR
rem ****************************************************
:GET_CHAR
if %1 == 00 set tmp=‚ 
if %1 == 01 set tmp=‚¢
if %1 == 02 set tmp=‚¤
if %1 == 03 set tmp=‚¦
if %1 == 04 set tmp=‚¨
if %1 == 05 set tmp=‚©
if %1 == 06 set tmp=‚«
if %1 == 07 set tmp=‚­
if %1 == 08 set tmp=‚¯
if %1 == 09 set tmp=‚±
if %1 == 10 set tmp=‚³
if %1 == 11 set tmp=‚µ
if %1 == 12 set tmp=‚·
if %1 == 13 set tmp=‚¹
if %1 == 14 set tmp=‚»
if %1 == 15 set tmp=‚½
if %1 == 16 set tmp=‚¿
if %1 == 17 set tmp=‚Â
if %1 == 18 set tmp=‚Ä
if %1 == 19 set tmp=‚Æ
if %1 == 20 set tmp=‚È
if %1 == 21 set tmp=‚É
if %1 == 22 set tmp=‚Ê
if %1 == 23 set tmp=‚Ë
if %1 == 24 set tmp=‚Ì
if %1 == 25 set tmp=‚Í
if %1 == 26 set tmp=‚Ð
if %1 == 27 set tmp=‚Ó
if %1 == 28 set tmp=‚Ö
if %1 == 29 set tmp=‚Ù
if %1 == 30 set tmp=‚Ü
if %1 == 31 set tmp=‚Ý
if %1 == 32 set tmp=‚Þ
if %1 == 33 set tmp=‚ß
if %1 == 34 set tmp=‚à
if %1 == 35 set tmp=‚â
if %1 == 36 set tmp=‚ä
if %1 == 37 set tmp=‚æ
if %1 == 38 set tmp=‚ç
if %1 == 39 set tmp=‚è
if %1 == 40 set tmp=‚é
if %1 == 41 set tmp=‚ê
if %1 == 42 set tmp=‚ë
if %1 == 43 set tmp=‚í
if %1 == 44 set tmp=‚ð
if %1 == 45 set tmp=‚ñ
if %1 == 46 set tmp=‚ª
if %1 == 47 set tmp=‚¬
if %1 == 48 set tmp=‚®
if %1 == 49 set tmp=‚°
if %1 == 50 set tmp=‚²
if %1 == 51 set tmp=‚´
if %1 == 52 set tmp=‚¶
if %1 == 53 set tmp=‚¸
if %1 == 54 set tmp=‚º
if %1 == 55 set tmp=‚¼
if %1 == 56 set tmp=‚¾
if %1 == 57 set tmp=‚À
if %1 == 58 set tmp=‚Ã
if %1 == 59 set tmp=‚Å
if %1 == 60 set tmp=‚Ç
if %1 == 61 set tmp=‚Î
if %1 == 62 set tmp=‚Ñ
if %1 == 63 set tmp=‚Ô
if %1 == 64 set tmp=‚×
if %1 == 65 set tmp=‚Ú
if %1 == 66 set tmp=‚Ï
if %1 == 67 set tmp=‚Ò
if %1 == 68 set tmp=‚Õ
if %1 == 69 set tmp=‚Ø
if %1 == 70 set tmp=‚Û
if %1 == 71 set tmp=A
if %1 == 72 set tmp=B
if %1 == 73 set tmp=C
if %1 == 74 set tmp=D
if %1 == 75 set tmp=E
if %1 == 76 set tmp=F
if %1 == 77 set tmp=G
if %1 == 78 set tmp=H
if %1 == 79 set tmp=I
if %1 == 80 set tmp=J
if %1 == 81 set tmp=K
if %1 == 82 set tmp=L
if %1 == 83 set tmp=M
if %1 == 84 set tmp=N
if %1 == 85 set tmp=O
if %1 == 86 set tmp=P
if %1 == 87 set tmp=Q
if %1 == 88 set tmp=R
if %1 == 89 set tmp=S
if %1 == 90 set tmp=T
if %1 == 91 set tmp=U
if %1 == 92 set tmp=V
if %1 == 93 set tmp=W
if %1 == 94 set tmp=X
if %1 == 95 set tmp=Y
if %1 == 96 set tmp=Z
if %1 == 97 set tmp=‚î
if %1 == 98 set tmp=‚ï
if %1 == 99 set tmp=ƒ”
exit /b
