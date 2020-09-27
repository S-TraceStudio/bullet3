# go to folder
cd ..
cd install

#delete old file
rm bullet3-OSX.zip

#compress folder
zip -r -X bullet3-OSX.zip ./bullet3

#upload to s3 bucker
aws s3 cp ./bullet3-OSX.zip s3://s-trace.dependencies/

#give public READ permission
aws --endpoint-url https://s3-ap-southeast-1.amazonaws.com/ s3api put-object-acl --bucket s-trace.dependencies --key bullet3-OSX.zip --acl public-read

#
cd ..
cd scripts
