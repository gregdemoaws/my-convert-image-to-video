#!/bin/bash

convert_image_to_video() {
    local relative_path_to_input=$1
    local relative_path_to_output=$2
    local output_width=$3
    local output_height=$4
    local output_duration=$5

    echo ""
    echo "relative_path_to_input: ${relative_path_to_input}"; echo ""
    echo "relative_path_to_output: ${relative_path_to_output}"; echo ""
    echo "starting now the ffmpeg command (showing only errors)"; echo ""

    ffmpeg -loglevel error -loop 1 -i "$relative_path_to_input" -c:v libx264 -t "$output_duration" -pix_fmt yuv420p -vf "scale=$output_width:$output_height" "$relative_path_to_output" -y

    echo "end of convert_image_to_video succeeded!"
}

# $1 = relative_path_to_input
# $2 = relative_path_to_output
# $3 = output_width
# $4 = output_height
# $5 = output_duration
convert_image_to_video $1 $2 $3 $4 $5
