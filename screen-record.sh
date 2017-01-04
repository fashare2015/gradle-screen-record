TAG="screen-record ---> "

OUTPUT_DIR="./screen-record/"
MP4_POSTFIX=".mp4"
GIF_POSTFIX=".gif"

fileName=$1

# [Required] Get gif $fileName from 1st arg: . Or else do nothing.
if [ "$fileName" != "" ]
then
    echo -e "$TAG specify fileName: $fileName\n"

    mobilePath="/sdcard/$fileName"
    pcPath="$OUTPUT_DIR$fileName"

    # [Optional] Get gif $size from 2nd arg: . default size: "360x600".
    size="360x600"
    if [ "$2" != "" ]
    then
        size=$2
        echo -e "$TAG specify size: $size\n"
    fi

    # [Optional] Get gif $time from 3rd arg. default time: 10s.
    time=10
    if [ "$3" != "" ]
    then
        time=$3
        echo -e "$TAG specify limited time: $time\n"
    fi

    # Make output dir if absent.
    ./mkdir-if-absent.sh $OUTPUT_DIR

    # Execute cmd screenrecord and then you get a video (XXX.mp4) in your sdcard.
    echo -e "$TAG begin screenrecord\n"
    adb shell screenrecord "$mobilePath$MP4_POSTFIX" --size 368x608 --time-limit $time
    echo -e "$TAG end screenrecord\n"

    # Upload the video into OUTPUT_DIR of your PC .
    adb pull "$mobilePath$MP4_POSTFIX" "$pcPath$MP4_POSTFIX"

    # Convert the video (XXX.mp4) to a gif (XXX.gif).
    ./ffmpeg -t $time -i "$pcPath$MP4_POSTFIX" -s $size "$pcPath$GIF_POSTFIX"

    # Delete the redundant file (XXX.mp4).
    rm "$pcPath$MP4_POSTFIX"

else
    echo -e "$TAG PARAM ERROR! Please specify a fileName (without postfix)!\n"
fi
