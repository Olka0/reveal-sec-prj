#!/bin/bash
FILE_YQ=/usr/bin/yq
if [ -f "$FILE_YQ" ]; then
  echo "YQ is installed"
else
  sudo wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_a>
  yq version
  sudo chmod a+x /usr/bin/yq
fi
 #merge two files
echo "Merge two files"

yq eval-all '. as $item ireduce ({}; . * $item)' config1.yml config2.yml


#Extract the Unique keys along with their values
echo "Extract the Unique keys along with their values"
diff <(yq -P 'sort_keys(..)' config1.yml) <(yq -P 'sort_keys(..)' config2.yml) 

#Extract the Common (key, value) pairs
echo "Extract the Common (key, value) pairs"


#Sort the files by key
echo "Sort the files by key"

