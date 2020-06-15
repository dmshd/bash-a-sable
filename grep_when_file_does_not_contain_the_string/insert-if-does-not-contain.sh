#!/bin/bash
# grep when file does not contain

if ! grep -q 'LANG=C.UTF8' /etc/cron.d/wcs; then
  sed -i '2i LANG=C.UTF-8' /etc/cron.d/wcs
  echo " --- LANG=C.UTF-8 has been added to /etc/cron.d/wcs ..."
else
  echo " --- the /etc/cron.d/wcs file is well configured with the LANG=C.UTF-8 option"
fi
