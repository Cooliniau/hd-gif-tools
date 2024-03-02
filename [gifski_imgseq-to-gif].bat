@echo off
setlocal enabledelayedexpansion

REM Check if gifski executable exists
set "gifski_path=C:\FilePathTo...\gifski.exe"
if not exist "%gifski_path%" (
    echo Gifski not found at specified path.
    pause
    exit /b
)

REM Prompt user for input folder
set /p input_folder=Enter the input folder directory containing image sequence: 

REM Prompt user for output filename
set /p output_filename=Enter the output filename for the animated gif (including .gif extension): 

REM Prompt user for output folder
set /p output_folder=Enter the output folder directory for the gif: 

REM Check if output folder exists, create it if not
if not exist "%output_folder%" mkdir "%output_folder%"

REM Prompt user for gifski options
set /p gifski_options=Enter gifski options (e.g., --quality 80 --fast): 

REM Use gifski to convert image sequence to animated gif
"%gifski_path%" %gifski_options% -o "%output_folder%\%output_filename%" "%input_folder%\*.png"

echo Conversion complete. Animated gif saved to: %output_folder%\%output_filename%
pause
exit /b
