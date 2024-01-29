@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

ECHO アーカイブ用に残しているだけですので、使用しないでください。
PAUSE > nul
EXIT /B

SET WORD=accommodate accounting actually additional administration advance advertising afford analyst annual appear applicant appreciate architect assess attend attract benefit budget cater colleague compare complicated concern conference consumer contract current decide delay delighted department designate develop donate eliminate encourage enroll estate exceed

ECHO ****************************************************
ECHO * Initialize Process
ECHO ****************************************************
START "" msedge.exe --new-window
ECHO %DATE% %TIME% : Opening a new window in Microsoft Edge.
ECHO %DATE% %TIME% : Wait 3 seconds...
TIMEOUT /NOBREAK 3 > NUL

ECHO ****************************************************
ECHO * Search with Bing by PC User Agent
ECHO ****************************************************
SET CNT_PC=0

FOR %%a IN (%WORD%) DO (
  SET %!%WORD[!CNT_PC!]%!%=%%a
  SET /A CNT_PC+=1
)

SET /A CNT_PC-=1
FOR /L %%I in (0,1,%CNT_PC%) DO (
  TIMEOUT /NOBREAK 1 > NUL
  @REM ECHO %!%WORD[%%I]%!%=!WORD[%%I]!
  @REM ECHO [%%I]!WORD[%%I]!
  ECHO !DATE! !TIME! : Searching for !WORD[%%I]!
  START "" msedge.exe https://www.bing.com/search?q=!WORD[%%I]!^&qs=n^&form=QBRE^&sp=-1^&ghc=1^&lq=0^&pq=!WORD[%%I]!^&sc=11-4^&sk=^&cvid=C9DAAFE5BF104B4A94198111D7754C41^&ghsh=0^&ghacc=0^&ghpl=
)

ECHO %DATE% %TIME% : Waiting for Bing searches to be completed.
ECHO %DATE% %TIME% : Wait 15 seconds...
TIMEOUT /NOBREAK 15 > NUL

ECHO ****************************************************
ECHO * Change to Mobile User Agent
ECHO ****************************************************
TASKKILL /IM msedge.exe /F > NUL 2>&1
ECHO %DATE% %TIME% : Stopping Microsoft Edge's processes.
ECHO %DATE% %TIME% : Wait 3 seconds...
TIMEOUT /NOBREAK 3 > NUL

START "" msedge.exe --new-window --user-agent="Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Mobile Safari/537.36"
ECHO %DATE% %TIME% : Opening a new window in Microsoft Edge.
ECHO %DATE% %TIME% : Wait 3 seconds...
TIMEOUT /NOBREAK 3 > NUL

ECHO ****************************************************
ECHO * Search with Bing by Mobile User Agent
ECHO ****************************************************
SET CNT_MOBILE=0

FOR %%a IN (%WORD%) DO (
  SET %!%WORD[!CNT_MOBILE!]%!%=%%a
  SET /A CNT_MOBILE+=1
)

SET /A CNT_MOBILE-=1
FOR /L %%I in (0,1,%CNT_MOBILE%) DO (
  TIMEOUT /NOBREAK 1 > NUL
  @REM ECHO %!%WORD[%%I]%!%=!WORD[%%I]!
  @REM ECHO [%%I]!WORD[%%I]!
  ECHO !DATE! !TIME! : Searching for !WORD[%%I]!
  START "" msedge.exe https://www.bing.com/search?q=!WORD[%%I]!+^&qs=n^&form=QBRE^&sp=-1^&lq=0^&pq=^&sc=0-0^&sk=^&cvid=H7L7C41D09MZ4DS3G2BA0X9KWM85VNFI^&ghsh=0^&ghacc=0^&ghpl=
)

ECHO %DATE% %TIME% : Waiting for Bing searches to be completed.
ECHO %DATE% %TIME% : Wait 15 seconds...
TIMEOUT /NOBREAK 15 > NUL

ECHO ****************************************************
ECHO * Finalize Process
ECHO ****************************************************
TASKKILL /IM msedge.exe /F > NUL 2>&1
ECHO %DATE% %TIME% : Starting Microsoft Edge's processes(--no-startup-window).
START "" msedge.exe --no-startup-window --win-session-start /prefetch:5
ECHO %DATE% %TIME% : Wait 3 seconds...
TIMEOUT /NOBREAK 3 > NUL
ECHO %DATE% %TIME% : Starting Microsoft Edge's processes.
START "" msedge.exe --window-size=1000,600
ECHO %DATE% %TIME% : Wait 3 seconds...
TIMEOUT /NOBREAK 3 > NUL

ECHO Press the ENTER Key...
PAUSE > NUL