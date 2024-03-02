@echo off
setlocal enabledelayedexpansion

REM Set the path to ffmpeg executable
set "ffmpeg_path=C:\FilePathTo...\ffmpeg.exe"

REM Check if ffmpeg executable exists
if not exist "%ffmpeg_path%" (
    echo FFmpeg not found at specified path.
    pause
    exit /b
)

REM Set start and end times, output file name, and output folder
set /p start_time=Enter start time (in seconds, e.g., 10.5): 
set /p end_time=Enter end time (in seconds, e.g., 30): 
set /p output_filename=Enter output filename (without extension): 
set /p output_folder=Enter output folder directory: 

REM Execute FFmpeg command
"%ffmpeg_path%" -i "%1" -vcodec libx265 -crf 28 -ss !start_time! -to !end_time! "%output_folder%\!output_filename!.mp4"

echo Conversion complete. Output file: !output_filename!.mp4
pause
exit /b
