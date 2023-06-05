@ECHO OFF
setlocal enabledelayedexpansion
@REM ****************************************************
@REM * Bing Search for PC
@REM ****************************************************
SET WORD_PC=accommodate accounting actually
SET CNT_PC=0
START "" msedge.exe --new-window

FOR %%a IN (%WORD_PC%) DO (
  SET %!%WORD_PC[!CNT_PC!]%!%=%%a
  SET /A CNT_PC+=1
)

SET /A CNT_PC-=1
FOR /L %%I in (0,1,%CNT_PC%) DO (
  TIMEOUT /NOBREAK 7 > NUL
  ECHO %!%WORD_PC[%%I]%!%=!WORD_PC[%%I]!
  START "" msedge.exe https://www.bing.com/search?q=!WORD_PC[%%I]!
)

@REM ****************************************************
@REM * Bing Search for Mobile
@REM ****************************************************
@REM terminate Edge's processes 
TIMEOUT /NOBREAK 7 > NUL
TASKKILL /IM msedge.exe /F > NUL 2>&1
TIMEOUT /NOBREAK 7 > NUL

SET WORD_MOBILE=delighted department designate
SET CNT_MOBILE=0
START "" msedge.exe --new-window --user-agent="Mozilla/5.0 (iPhone; CPU iPhone OS 12_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.1 EdgiOS/44.5.0.10 Mobile/15E148 Safari/604.1"

FOR %%a IN (%WORD_MOBILE%) DO (
  SET %!%WORD_MOBILE[!CNT_MOBILE!]%!%=%%a
  SET /A CNT_MOBILE+=1
)

SET /A CNT_MOBILE-=1
FOR /L %%I in (0,1,%CNT_MOBILE%) DO (
  TIMEOUT /NOBREAK 7 > NUL
  ECHO %!%WORD_MOBILE[%%I]%!%=!WORD_MOBILE[%%I]!
  START "" msedge.exe https://www.bing.com/search?q=!WORD_MOBILE[%%I]!
)

TASKKILL /IM msedge.exe /F > NUL 2>&1
@REM START "" msedge.exe --no-startup-window --win-session-start /prefetch:5
START "" msedge.exe