#!/bin/bash

for folder in *; do
  if ! test -f "$folder/images/banner.jpg"; then
    echo "$folder needs a banner !"
    cp ~/Images/banner.jpg $folder/images/
        if test -f "$folder/images/banner.jpg"; then 
      echo "Here you are $folder ! A free banner ! Free banner for everyone !"
        else
          echo "Oops, I gave a banner to $folder but he or she does not want it :/ (there was a problem)"
        fi
  fi
done

