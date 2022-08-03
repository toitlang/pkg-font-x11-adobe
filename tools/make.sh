#!/bin/sh

TOIT_FONT_TOOLS=third_party/toit-font-tools/app
DIR_100DPI=xorg-adobe-100dpi
DIR_75DPI=xorg-adobe-75dpi
TOIT_RUN=toit.run
CONVERT=$TOIT_FONT_TOOLS/convertfont.toit
VERBOSE=
OUTPUT=src

set -e

if [ ! -f "COPYING" -o ! -d "third_party" ]
then
  echo "Please run from top level directory"
  exit 1
fi

git submodule update --recursive --init

mkdir -p src

cp $DIR_100DPI/COPYING .

(cd $TOIT_FONT_TOOLS && toit.pkg install)

for size in 08 10 12 14 18 24
do
  echo $size
  echo serif
  $TOIT_RUN $CONVERT $VERBOSE $DIR_100DPI/timR$size.bdf "serif_$size" $OUTPUT/serif_$size.toit
  $TOIT_RUN $CONVERT $VERBOSE $DIR_100DPI/timB$size.bdf "serif_${size}_bold" $OUTPUT/serif_${size}_bold.toit &
  $TOIT_RUN $CONVERT $VERBOSE $DIR_100DPI/timI$size.bdf "serif_${size}_italic" $OUTPUT/serif_${size}_italic.toit &
  $TOIT_RUN $CONVERT $VERBOSE $DIR_100DPI/timBI$size.bdf "serif_${size}_bold_italic" $OUTPUT/serif_${size}_bold_italic.toit &

  echo typewriter
  $TOIT_RUN $CONVERT $VERBOSE $DIR_100DPI/courR$size.bdf "typewriter_$size" $OUTPUT/typewriter_$size.toit
  $TOIT_RUN $CONVERT $VERBOSE $DIR_100DPI/courB$size.bdf "typewriter_${size}_bold" $OUTPUT/typewriter_${size}_bold.toit &
  $TOIT_RUN $CONVERT $VERBOSE $DIR_100DPI/courO$size.bdf "typewriter_${size}_oblique" $OUTPUT/typewriter_${size}_oblique.toit &
  $TOIT_RUN $CONVERT $VERBOSE $DIR_100DPI/courBO$size.bdf "typewriter_${size}_bold_oblique" $OUTPUT/typewriter_${size}_bold_oblique.toit &

  echo book
  $TOIT_RUN $CONVERT $VERBOSE $DIR_100DPI/ncenR$size.bdf "book_$size" $OUTPUT/book_$size.toit
  $TOIT_RUN $CONVERT $VERBOSE $DIR_100DPI/ncenB$size.bdf "book_${size}_bold" $OUTPUT/book_${size}_bold.toit &
  $TOIT_RUN $CONVERT $VERBOSE $DIR_100DPI/ncenI$size.bdf "book_${size}_italic" $OUTPUT/book_${size}_italic.toit &
  $TOIT_RUN $CONVERT $VERBOSE $DIR_100DPI/ncenBI$size.bdf "book_${size}_bold_italic" $OUTPUT/book_${size}_bold_italic.toit &

  echo sans
  $TOIT_RUN $CONVERT $VERBOSE $DIR_100DPI/helvR$size.bdf "sans_$size" $OUTPUT/sans_$size.toit
  $TOIT_RUN $CONVERT $VERBOSE $DIR_100DPI/helvB$size.bdf "sans_${size}_bold" $OUTPUT/sans_${size}_bold.toit &
  $TOIT_RUN $CONVERT $VERBOSE $DIR_100DPI/helvO$size.bdf "sans_${size}_oblique" $OUTPUT/sans_${size}_oblique.toit &
  $TOIT_RUN $CONVERT $VERBOSE $DIR_100DPI/helvBO$size.bdf "sans_${size}_bold_oblique" $OUTPUT/sans_${size}_bold_oblique.toit &
done

echo 06
echo serif
$TOIT_RUN $CONVERT $VERBOSE $DIR_75DPI/timR08.bdf "serif_06" $OUTPUT/serif_06.toit
$TOIT_RUN $CONVERT $VERBOSE $DIR_75DPI/timB08.bdf "serif_06_bold" $OUTPUT/serif_06_bold.toit &
$TOIT_RUN $CONVERT $VERBOSE $DIR_75DPI/timI08.bdf "serif_06_italic" $OUTPUT/serif_06_italic.toit &
$TOIT_RUN $CONVERT $VERBOSE $DIR_75DPI/timBI08.bdf "serif_06_bold_italic" $OUTPUT/serif_06_bold_italic.toit &

echo typewriter
$TOIT_RUN $CONVERT $VERBOSE $DIR_75DPI/courR08.bdf "typewriter_06" $OUTPUT/typewriter_06.toit
$TOIT_RUN $CONVERT $VERBOSE $DIR_75DPI/courB08.bdf "typewriter_06_bold" $OUTPUT/typewriter_06_bold.toit &
$TOIT_RUN $CONVERT $VERBOSE $DIR_75DPI/courO08.bdf "typewriter_06_oblique" $OUTPUT/typewriter_06_oblique.toit &
$TOIT_RUN $CONVERT $VERBOSE $DIR_75DPI/courBO08.bdf "typewriter_06_bold_oblique" $OUTPUT/typewriter_06_bold_oblique.toit &

echo book
$TOIT_RUN $CONVERT $VERBOSE $DIR_75DPI/ncenR08.bdf "book_06" $OUTPUT/book_06.toit
$TOIT_RUN $CONVERT $VERBOSE $DIR_75DPI/ncenB08.bdf "book_06_bold" $OUTPUT/book_06_bold.toit &
$TOIT_RUN $CONVERT $VERBOSE $DIR_75DPI/ncenI08.bdf "book_06_italic" $OUTPUT/book_06_italic.toit &
$TOIT_RUN $CONVERT $VERBOSE $DIR_75DPI/ncenBI08.bdf "book_06_bold_italic" $OUTPUT/book_06_bold_italic.toit &

echo sans
$TOIT_RUN $CONVERT $VERBOSE $DIR_75DPI/helvR08.bdf "sans_06" $OUTPUT/sans_06.toit
$TOIT_RUN $CONVERT $VERBOSE $DIR_75DPI/helvB08.bdf "sans_06_bold" $OUTPUT/sans_06_bold.toit &
$TOIT_RUN $CONVERT $VERBOSE $DIR_75DPI/helvO08.bdf "sans_06_oblique" $OUTPUT/sans_06_oblique.toit &
$TOIT_RUN $CONVERT $VERBOSE $DIR_75DPI/helvBO08.bdf "sans_06_bold_oblique" $OUTPUT/sans_06_bold_oblique.toit &

wait  # Wait for backgrounded jobs.
