@echo off
cd /d %~dp0
setlocal enabledelayedexpansion
set tmp=
set WORD=
set len=

echo 将来の実装用に残しているだけですので、使用しないでください。現在、バッチファイルを使用してのモバイル用Bing検索ポイントは獲得できません。
pause > nul
exit /b

echo ****************************************************
echo * Initialize Process
echo ****************************************************
start "" msedge.exe --new-window
echo %date% %time% : Opening a new window in Microsoft Edge.
echo %date% %time% : Wait 3 seconds...
timeout /nobreak 3 > nul

echo ****************************************************
echo * Change to Mobile User Agent
echo ****************************************************
taskkill /im msedge.exe /f > nul 2>&1
echo %date% %time% : Stopping Microsoft Edge's processes.
echo %date% %time% : Wait 3 seconds...
timeout /nobreak 3 > nul

start "" msedge.exe --new-window --user-agent="Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Mobile Safari/537.36"
echo %date% %time% : Opening a new window in Microsoft Edge.
echo %date% %time% : Wait 3 seconds...
timeout /nobreak 3 > nul

echo ****************************************************
echo * Search with Bing by Mobile User Agent
echo ****************************************************
call :SEARCH_MOBILE
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
rem SEARCH_MOBILE
rem ****************************************************
:SEARCH_MOBILE
for /l %%i in (1,1,25) do (
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
start "" msedge.exe --user-agent="Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Mobile Safari/537.36" https://www.bing.com/search?q="!WORD!"+^&qs=n^&form=QBRE^&sp=-1^&lq=0^&pq=^&sc=0-0^&sk=^&cvid=H7L7C41D09MZ4DS3G2BA0X9KWM85VNFI^&ghsh=0^&ghacc=0^&ghpl=
start "" msedge.exe https://www.bing.com/search?q="!WORD!"^&qs=PN^&sk=HS4^&sc=10-0^&cvid=B6DAA5FE235348EDB35FA0CFF913609E^&FORM=QBLH^&sp=5^&lq=0
start "" msedge.exe https://www.bing.com/search?q="!WORD!"^&pc=EMMX04^&FORM=EMMXA2^&mkt=ja-jp^&darkschemeovr=1
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
if %1 == 00 set tmp=あ
if %1 == 01 set tmp=い
if %1 == 02 set tmp=う
if %1 == 03 set tmp=え
if %1 == 04 set tmp=お
if %1 == 05 set tmp=か
if %1 == 06 set tmp=き
if %1 == 07 set tmp=く
if %1 == 08 set tmp=け
if %1 == 09 set tmp=こ
if %1 == 10 set tmp=さ
if %1 == 11 set tmp=し
if %1 == 12 set tmp=す
if %1 == 13 set tmp=せ
if %1 == 14 set tmp=そ
if %1 == 15 set tmp=た
if %1 == 16 set tmp=ち
if %1 == 17 set tmp=つ
if %1 == 18 set tmp=て
if %1 == 19 set tmp=と
if %1 == 20 set tmp=な
if %1 == 21 set tmp=に
if %1 == 22 set tmp=ぬ
if %1 == 23 set tmp=ね
if %1 == 24 set tmp=の
if %1 == 25 set tmp=は
if %1 == 26 set tmp=ひ
if %1 == 27 set tmp=ふ
if %1 == 28 set tmp=へ
if %1 == 29 set tmp=ほ
if %1 == 30 set tmp=ま
if %1 == 31 set tmp=み
if %1 == 32 set tmp=む
if %1 == 33 set tmp=め
if %1 == 34 set tmp=も
if %1 == 35 set tmp=や
if %1 == 36 set tmp=ゆ
if %1 == 37 set tmp=よ
if %1 == 38 set tmp=ら
if %1 == 39 set tmp=り
if %1 == 40 set tmp=る
if %1 == 41 set tmp=れ
if %1 == 42 set tmp=ろ
if %1 == 43 set tmp=わ
if %1 == 44 set tmp=を
if %1 == 45 set tmp=ん
if %1 == 46 set tmp=が
if %1 == 47 set tmp=ぎ
if %1 == 48 set tmp=ぐ
if %1 == 49 set tmp=げ
if %1 == 50 set tmp=ご
if %1 == 51 set tmp=ざ
if %1 == 52 set tmp=じ
if %1 == 53 set tmp=ず
if %1 == 54 set tmp=ぜ
if %1 == 55 set tmp=ぞ
if %1 == 56 set tmp=だ
if %1 == 57 set tmp=ぢ
if %1 == 58 set tmp=づ
if %1 == 59 set tmp=で
if %1 == 60 set tmp=ど
if %1 == 61 set tmp=ば
if %1 == 62 set tmp=び
if %1 == 63 set tmp=ぶ
if %1 == 64 set tmp=べ
if %1 == 65 set tmp=ぼ
if %1 == 66 set tmp=ぱ
if %1 == 67 set tmp=ぴ
if %1 == 68 set tmp=ぷ
if %1 == 69 set tmp=ぺ
if %1 == 70 set tmp=ぽ
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
if %1 == 97 set tmp=ゐ
if %1 == 98 set tmp=ゑ
if %1 == 99 set tmp=ヴ
exit /b
