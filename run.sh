  GNU nano 4.8                                                           run.sh                                                                      
#!/bin/bash
FILE_YQ=/usr/bin/yq
if [ -f "$FILE_YQ" ]; then
  echo "YQ is installed"
else
  sudo wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq
  yq version
  sudo chmod a+x /usr/bin/yq
fi
 #merge two files
echo "Merge two files"
yq '. *= load("config2.yaml")' config1.yaml
echo "****************"
yq eval-all '. as $item ireduce ({}; . * $item)' config1.yaml config2.yaml


#Extract the Unique keys along with their values
echo "Extract the Unique keys along with their values"
diff <(yq -P 'sort_keys(..)' config1.yaml) <(yq -P 'sort_keys(..)' config2.yaml) 

#Extract the Common (key, value) pairs
echo "Extract the Common (key, value) pairs"
yq compare config2.yaml
yq eval-all '[.info.version] | .[0] == .[1]' config1.yaml config2.yaml

#Sort the files by key
echo "Sort the files by key"
yq -i -P 'sort_keys(..)' config1.yaml
yq -i -P 'sort_keys(..)' config2.yaml
yq ea config1.yaml config2.yaml

