#!/bin/sh

sudo pacman -S pkgstats curl bc --noconfirm
echo 'This would take a while to complete.'
file=$(mktemp)
file2=$(mktemp)
pkgstats -s > $file
sed -n '/^packages=/,/^arch=/p;/^arch=/q' $file > $file2
> $file
tail -n +2 $file2 > $file
> $file2
head -n -2 $file > $file2
> $file
<$file2 xargs -I % curl -s 'https://pkgstats.archlinux.de/api/packages/%' | jq -r '.name + " " + ( .popularity|tostring ) ' >> $file
echo 'The combined popularity of your chosen packages is:'
echo "$(<$file awk '{s+=$2} END {print s}')/$(wc -l $file)" | cut -d' ' -f1 | bc
rm $file
rm $file2
