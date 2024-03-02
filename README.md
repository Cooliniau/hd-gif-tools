# hd-gif-tools
A set of tools that use ffmpeg, gifski, and a combination of both for video compression, image sequence extraction, and the creation of high quality GIFs from video files.

### **A (Not-So) Quick Tutorial on Making HD GIFs for Twitter !!**

**by ini of Cooliniau**

***Disclaimer:*** This is a **Windows**-based tutorial—keeping it real, I have ZERO idea how this would work for Linux, Ubuntu, and Mac !! - ini

---------

**{ HEY—it's SETUP TIME. }**
- Download ffmpeg-essentials (https://www.gyan.dev/ffmpeg/builds) and the command line version of gifski (https://gif.ski/gifski-1.14.4.zip, or "Download CLI binaries" on https://gif.ski)
  - If you want, you can *also* get the GUI version of gifski—just be aware that it's got less precision when it comes to adjusting FPS and (iirc) *nothing* for adjusting the resolution.

- Add the file directories of both folders to your system PATH (look up "How to edit environment variables on Windows" if you don't know how to do this!)

- Open up cmd for a sec and type "ffmpeg", press enter; then type "gifski" and also press enter. If both give you basic instructions on how to use them, it means you've installed them correctly.

- Go ahead and close cmd now, and extract those 4 .bat files if you haven't already to a folder where you'll be doing your HD GIF process. Depending on what you'd prefer, at least 1-2 of these is what you'll be working in when it comes to the HD Twitter GIF process.

- Right-click each one, click Edit, and replace either "FilePathTo..." or the whole template directory with your actual directories for ffmpeg and/or gifski respectively.

---------

**{ Time for the Test Runs! }**
- If you haven't already done so, extract both "Beyond_GIF-Setup.mp4" and "Matrix_GIF-Setup.mp4" from the .zip and place it in the same folder as the .bat files.

- In order to make use of the .bat files on any videos of yours, make sure to simply use ( - ) and/or ( _ ) for white/empty spaces—also, NO special characters!

- ***「 ffmpeg_video-to-frames 」*** is kind of self-explanatory. Try to drag-n-drop video onto it and follow the on-screen prompts. Doing so correctly should result in a folder full of frames from your video.
  - In regards to inputting time: the format is HH:MM:SS.mmm; hours, minutes, seconds, and milliseconds respectively. Of course, if your clip is say 5 minutes and you only want the first 2, then you put 0 for start time and 2:00 for end time—since this is based on seconds. If you want frames of the whole thing, then it'll be 0 to [insert video end time here].
  - Make sure your video player has the option to display milliseconds for precise trimming !!
  - If you have a directory in mind but want the program to make a folder for the frames, just place the whole directory there and add a "\[insert folder name here]" (barring the quotes, obviously).
  - In regards to using additional ffmpeg options: the first option you MUST do is "scale=[insert width]:[insert height]".
    - For instance, if your clip is inherently 1280x720 and you want it the same, then it'll be "scale=1280:720". If you want it smaller, then it could be "scale=1053:592"—you get the idea. From what I understand, this effectively sets a max res for the frames (or GIF for the gifski_video-to-gif.bat file).
    - I placed the "-vf" command directly in the .bat to save some typing, but if you want to have this whole step to be completely optional, then just remove it from the file.
    - Aside from that, any other ffmpeg options are truly optional. This and **especially** "-r", which is used to change frame rate, EXTREMELY valuable to know and make use of. It's somewhat of a no-brainer, but changing the frame rate of the GIF can make a large difference in its file size depending on how far down you decrease it. Just don't go too far down, otherwise the GIF will be too fast in playback.
      - Using -r for this option would be like this: "scale=width:height -r [FPS; ex. 29.994, 30, 59.94, etc.]
      - Do NOT use a comma to separate the two elements, just use a white/blank space!

- ***「 ffmpeg_video-compressor 」*** is also more self-explanatory, but extremely useful for those 1080p-to-4K video clips that can be 100s of MB or more. To give a short example: this has managed to compress a ~30 sec. 4K60FPS clip from 148 MB to (iirc) 36 MB; all the while keeping the resolution and frame rate the same, and only changing the bitrate. Try to drag-and-drop a video of similar nature onto this and follow the prompts—and be warned that the time this may take easily depends on how long the duration of the video is! After all is said and done, you should have a smaller-sized but still high quality video.
  - You can also use this to trim your clip some more for whatever GIFs you plan to make with it; follow the guidelines in the video-to-frames section! 
  - From what I've noticed, doing this for HQ videos before the video-to-frames process can help reduce the image frame file size(s).

- ***「 gifski_imgseq-to-gif 」*** is meant as a follow-up to ffmpeg_video-to-frames. So, after you've got all your frames inside a folder, go ahead and double-click on the .bat file—no need to drag-and-drop anything onto it. Follow the prompts like usual, and for the gifski options in particular...
  - I typically use --width for resolution, --quality for...well—quality, and --fps for speed.
    - For --width, you only need to specify the WIDTH of a resolution (i.e. for 1920x1080, you only need to use 1920 !!). You can set the width lower or higher to decrease or increase the resolution, the former being good for longer duration GIFs.
    - For --quality, iirc you can go from 0-100. I'd recommend a range of 70 to 90 depending on the duration of the clip—only use 90 and above if you're ABSOLUTELY sure the file size can remain under 14.9MB !!
    - For --fps, I'd say if you want your GIF's speed to match that of the clip, then simply find out your clip's framerate and place that as a value. If you want to speed up the GIF, go higher than the clip's FPS—if you want to slow it down, go lower.
    - Example: --width 1280 --quality 80 --fps 29.94
      - "1280" for 720p res, and 29.94 as it's close enough to 30FPS!

- ***「 gifski_video-to-gif 」*** is meant as a straight-to-the-point solution. Obviously there's going to be more steps (as in more prompts), so take in everything you've learned from the prior tutorials (ffmpeg and gifski options in particular) and apply them here!

---------

**Reference:**

*Start/End time format* = HH:MM:SS.mmm

*ffmpeg resolution, FPS* = scale=width:height, -r [FPS]

*gifski resolution, quality, FPS* = --width [res width ONLY], --quality [0-100], --fps [FPS]

---------

With all that said, thanks for reading all of this!
Hopefully you've gotten at least a decent idea of how to use these programs——all that's left is to put that idea to practice. Happy high quality GIF making !! - ini
