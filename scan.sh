#!/bin/sh

DUPLEX=''

while getopts dn: OPT
#while getopts dt:n: OPT
do
  case $OPT in
  d)
    DUPLEX='--duplex';;
  n)
    NAME=${OPTARG};;
  \?)
    exit 1;;
  esac
done

FORMAT=$(echo $NAME | sed 's/^.*\.\([^\.]*\)$/\1/')
case $FORMAT in
  pdf)
    FORMAT='PDF'
    ;;
  png)
    FORMAT='PNG'
    break
    ;;
  *)
    echo "-n : [Filename].png or [Filename].pdf."
    ;;
esac

scan() 
{
  #--blank-threshold=15 \
  #15：裏写りスキップ
  #10：裏写りスキャン、白地に文字スキップ
  #5:真っ白スキップ
  imagescan --no-interface \
    --image-format=$FORMAT \
    $DUPLEX \
    --rotate Auto \
    --resolution=300 \
    --deskew \
    --double-feed-detection \
    --blank-threshold=5 \
    --scan-area='Auto Detect' > $NAME;
}

if [ -f $NAME ]
then
  echo -n "overwrite (y/n)?"
  read yn
  if echo "$yn" | grep -iq "^y" ;then
    scan
  fi
else
  scan
fi

if [ -n "$NAME" ]
then
  firefox $NAME
  wmctrl -a tmux
fi
