#!/bin/bash

# Move screenshots into screenshot folder

# if Screenshots directory not on desktop, make 

if [[ ! -d ~/Desktop/Screenshots ]];
then
  mkdir ~/Desktop/Screenshots
  echo $'\nmaking screenshots folder..\n'
else
  echo $'\nfound screenshots folder..\n'
fi

# store number of screenshots found and total screenshots in folder
# move screenshots to folder

FOUND_SCREENSHOTS=$(find ~/Desktop/ -maxdepth 1 -type f -name 'Screen Shot*png' | wc -l)
find ~/Desktop/ -maxdepth 1 -type f -name 'Screen Shot*png' -exec mv {} ~/Desktop/Screenshots/ \;
NUM_SCREENSHOTS=$(ls ~/Desktop/Screenshots | wc -l)

# tell user how many images are moved
# delete folder if no screenshots inside

echo "${FOUND_SCREENSHOTS} screenshots found on Desktop."
if [[ ${NUM_SCREENSHOTS} -ne 0 ]];
then
  echo "${NUM_SCREENSHOTS} screenshots in Screenshots folder."
else
  rm -rf ~/Desktop/Screenshots
  echo $'No screenshots. Folder removed.\n'
fi

exit 0

