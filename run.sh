# Check if a Module Name is provided as an argument
if [ $# -eq 0 ]; then
    echo "Please provide a Module Name as an argument."
    exit 1
fi

moduleName=$1

#execute the Createfile
./sub/createFiles.sh $moduleName
./sub/createView.sh $moduleName
./sub/createScreen.sh $moduleName
./sub/createViewModel.sh $moduleName
./sub/createViewSupport.sh $moduleName

echo "Module created successfully!"
exit 0
# /generate
