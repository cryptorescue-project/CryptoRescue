#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

CRYPTORESCUED=${CRYPTORESCUED:-$SRCDIR/cryptorescued}
CRYPTORESCUECLI=${CRYPTORESCUECLI:-$SRCDIR/cryptorescue-cli}
CRYPTORESCUETX=${CRYPTORESCUETX:-$SRCDIR/cryptorescue-tx}
CRYPTORESCUEQT=${CRYPTORESCUEQT:-$SRCDIR/qt/cryptorescue-qt}

[ ! -x $CRYPTORESCUED ] && echo "$CRYPTORESCUED not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
CPRVER=($($CRYPTORESCUECLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for cryptorescued if --version-string is not set,
# but has different outcomes for cryptorescue-qt and cryptorescue-cli.
echo "[COPYRIGHT]" > footer.h2m
$CRYPTORESCUED --version | sed -n '1!p' >> footer.h2m

for cmd in $CRYPTORESCUED $CRYPTORESCUECLI $CRYPTORESCUETX $CRYPTORESCUEQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${CPRVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${CPRVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
