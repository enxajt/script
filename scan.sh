#!/bin/sh
while getopts dt:n: OPT
do
  case $OPT in
  d)
    DUPLEX='--duplex';;
  t)
    TYPE=${OPTARG};;
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
    echo "-t : invalid argument"
    ;;
esac

case $TYPE in
  c)
    TYPE='Color'
    ;;
  g)
    TYPE='Grayscale'
    break
    ;;
  *)
    echo "-t : invalid argument"
    ;;
esac

imagescan --no-interface \
  --image-format=$FORMAT \
  $DUPLEX \
  --image-type=$TYPE \
  --resolution=300 \
  --deskew \
  --double-feed-detection \
  --blank-threshold=0.0 \
  --scan-area='Auto Detect' > $NAME;

firefox $NAME
