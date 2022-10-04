#!/usr/bin/env bash

# Original version by Corellium
# Modified by Nick Chan to support one-dtbpack-for-all

DTBPATH='arch/arm64/boot/dts/apple'
S5L8960X_DEVICES='J71 J72 J73 J85 J85m J86 J87m N51 N53'
T7000_DEVICES='J96 J97 N102 N56 N61 J42d'
T7001_DEVICES='J81 J82'
S8000_DEVICES='J71s J72s N66 N69u N71'
S8001_DEVICES='J127 J128 J98a J99a'
S8003_DEVICES='J71t J72t N66m N69 N71m'
T8010_DEVICES='D10 D11 D101 D111 J171 J172 J71b J72b N112'
T8011_DEVICES='J120 J121 J207 J208'
T8012_DEVICES=''
T8015_DEVICES='D20 D21 D22 D201 D211 D221'

DEVICES="${S5L8960X_DEVICES} ${T7000_DEVICES} ${T7001_DEVICES} ${S8000_DEVICES} ${S8001_DEVICES} ${S8003_DEVICES} ${T8010_DEVICES} ${T8011_DEVICES} ${T8015_DEVICES}"

OUTPUT='dtbpack'

echo -n 'Cows' > "${OUTPUT}"
for DEV in $DEVICES; do
    DEV_LC=`echo -n $DEV | tr '[:upper:]' '[:lower:]'`
    DTB_FILE_PATH=$(echo ${DTBPATH}/*-${DEV_LC}.dtb)
    DTB=`printf "${DTB_FILE_PATH}" $DEV_LC`
    echo -ne $DEV'\0' >> "${OUTPUT}"
    SIZE=`stat -c'%s' $DTB`
    printf '%08x' $SIZE | xxd -r -p >> "${OUTPUT}"
    cat $DTB >> "${OUTPUT}"
done
echo -ne '\0\0\0\0\0' >> "${OUTPUT}"
