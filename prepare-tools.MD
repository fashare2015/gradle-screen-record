#prepare ffmpeg
You can use ffmpeg either by **installing** or just by **downloading**. 

##install ffmpeg
###mac
Type these cmd in your terminal.

1.install homebrew
```shell
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
2.install ffmpeg
```shell
brew install ffmpeg
```

###windows
TODO: windows is not supported for `gradle-screen-record` now.
<br/>

##download ffmpeg
https://ffmpeg.org/
Or:
https://raw.githubusercontent.com/fashare2015/gradle-screen-record/master/ffmpeg

### Set ffmpeg path
If you just **download** the ffmpeg instead of **installing** it, **you must set the path of it**.
Add the path of ffmpeg this way:

Config in **rootProject/gradle.properties**:
>FFMPEG_PATH=XXX

**For example:** 
FFMPEG_PATH="./ffmpeg"
<br/>
