@echo off
setlocal enabledelayedexpansion

REM Check if ffmpeg executable exists
set "ffmpeg_path=C:\FilePathTo...\ffmpeg.exe"
if not exist "%ffmpeg_path%" (
    echo ffmpeg not found at specified path.
    pause
    exit /b
)

REM Prompt user for time range
set /p start_time=Enter start time (in seconds, e.g., 10.5): 
set /p end_time=Enter end time (in seconds, e.g., 30): 

REM Prompt user for output filename and folder
set /p output_filename=Enter output filename (without extension): 
set /p output_folder=Enter output folder directory: 

REM Prompt user for additional ffmpeg options
set /p ffmpeg_options=Enter additional ffmpeg options (press Enter for none): 

REM Create output folder if it doesn't exist
if not exist "%output_folder%" mkdir "%output_folder%"

REM Execute ffmpeg command to create PNG image sequence
"%ffmpeg_path%" -ss !start_time! -to !end_time! -i "%1" -vf %ffmpeg_options% "%output_folder%\%output_filename%_%%04d.png"

echo Image sequence creation complete. Output folder: %output_folder%
pause
exit /b
