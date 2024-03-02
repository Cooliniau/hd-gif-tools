@echo off
setlocal enabledelayedexpansion

REM Check if ffmpeg and gifski executables exist
set "ffmpeg_path=C:\FilePathTo...\ffmpeg.exe"
set "gifski_path=C:\FilePathTo...\gifski.exe"

if not exist "%ffmpeg_path%" (
    echo ffmpeg not found at specified path.
    pause
    exit /b
)

if not exist "%gifski_path%" (
    echo Gifski not found at specified path.
    pause
    exit /b
)

REM Get user input for time range, output filename, output folder, ffmpeg options, and gifski options
set /p start_time=Enter start time (format can be SS, SS.mmm, MM:SS.mmm, or HH:MM:SS.mmm): 
set /p end_time=Enter end time (format can be SS, SS.mmm, MM:SS.mmm, or HH:MM:SS.mmm): 
set /p output_filename=Enter output filename (including .gif extension): 
set /p output_folder=Enter output folder directory: 
set /p ffmpeg_options=Enter ffmpeg options (e.g., -vf scale=640:480): 
set /p gifski_options=Enter gifski options (e.g., --quality 80): 

REM Set intermediate frames directory
set "frames_dir=%output_folder%\frames"

REM Create frames directory
mkdir "%frames_dir%"

REM Use ffmpeg to extract frames
"%ffmpeg_path%" -ss !start_time! -to !end_time! -i "%1" -vf %ffmpeg_options% "%frames_dir%\frame_%%04d.png"

REM Use gifski to compile frames into animated gif
"%gifski_path%" %gifski_options% -o "%output_folder%\%output_filename%" "%frames_dir%\*.png"

REM Remove intermediate frames
rmdir /s /q "%frames_dir%"

echo Conversion complete. Output file: %output_folder%\%output_filename%
pause
exit /b

