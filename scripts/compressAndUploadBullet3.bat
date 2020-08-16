::
cd..

::
cd install

:: delete old file
del /F /Q bullet3-x64.zip

:: compress folder
7z.exe a ./bullet3-x64.zip -w ./bullet3 -r 

:: upload to s3 bucker
aws s3 cp bullet3-x64.zip s3://s-trace.dependencies/

:: give public READ permission
aws --endpoint-url https://s3-ap-southeast-1.amazonaws.com/ s3api put-object-acl --bucket s-trace.dependencies --key bullet3-x64.zip --acl public-read

::
cd ..

::
cd scripts
