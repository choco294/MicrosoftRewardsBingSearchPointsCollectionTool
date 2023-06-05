@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

ECHO ****************************************************
ECHO * START : Search with Bing by PC
ECHO ****************************************************
SET WORD_PC=accommodate accounting actually additional administration annex advance advertising afford analyst annual appear applicant appreciate architect assess appliance attend attract benefit budget cater colleague compare complicated concern conference appropriately consumer contract current decide delay
SET CNT_PC=0
START "" msedge.exe --new-window

FOR %%a IN (%WORD_PC%) DO (
  SET %!%WORD_PC[!CNT_PC!]%!%=%%a
  SET /A CNT_PC+=1
)

SET /A CNT_PC-=1
FOR /L %%I in (0,1,%CNT_PC%) DO (
  @REM TIMEOUT /NOBREAK 3 > NUL
  @REM ECHO %!%WORD_PC[%%I]%!%=!WORD_PC[%%I]!
  ECHO [%%I]!WORD_PC[%%I]!
  START "" msedge.exe https://www.bing.com/search?q=!WORD_PC[%%I]!
)

ECHO ****************************************************
ECHO * END : Search with Bing by PC
ECHO ****************************************************

TIMEOUT /NOBREAK 15 > NUL

ECHO ****************************************************
ECHO * START : Search with Bing by Mobile
ECHO ****************************************************
@REM terminate Edge's processes 
TIMEOUT /NOBREAK 3 > NUL
TASKKILL /IM msedge.exe /F > NUL 2>&1
TIMEOUT /NOBREAK 3 > NUL

SET WORD_MOBILE=delighted department designate develop donate acquisition admit eliminate encourage enroll estate exceed except executive exhibit expect expertise agenda allocate explain facility fail familiar feature
SET CNT_MOBILE=0
START "" msedge.exe --new-window --user-agent="Mozilla/5.0 (iPhone; CPU iPhone OS 16_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.0 EdgiOS/113.1774.50 Mobile/15E148 Safari/605.1.15"

FOR %%a IN (%WORD_MOBILE%) DO (
  SET %!%WORD_MOBILE[!CNT_MOBILE!]%!%=%%a
  SET /A CNT_MOBILE+=1
)

SET /A CNT_MOBILE-=1
FOR /L %%I in (0,1,%CNT_MOBILE%) DO (
  @REM TIMEOUT /NOBREAK 3 > NUL
  @REM ECHO %!%WORD_MOBILE[%%I]%!%=!WORD_MOBILE[%%I]!
  ECHO [%%I]!WORD_MOBILE[%%I]!
  START "" msedge.exe https://www.bing.com/search?q=!WORD_MOBILE[%%I]!
)

ECHO ****************************************************
ECHO * END : Search with Bing by Mobile
ECHO ****************************************************

TIMEOUT /NOBREAK 15 > NUL
TASKKILL /IM msedge.exe /F > NUL 2>&1
START "" msedge.exe --no-startup-window --win-session-start /prefetch:5
START "" msedge.exe --window-size=1000,600

ECHO Press the ENTER Key...
PAUSE > NUL