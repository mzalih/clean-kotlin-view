# Check if a filename is provided as an argument
if [ $# -eq 0 ]; then
    echo "Please provide a filename as an argument."
    exit 1
fi
# Get the module name from the argument
moduleName=$1

lowername=$(echo "$moduleName" | tr '[:upper:]' '[:lower:]')

filename=$(echo "$moduleName" | awk '{print toupper(substr($0,1,1)) substr($0,2)}')

#get the package from the config file with name PACKAGE
package=$(cat config | grep PACKAGE | awk '{print $2}')
packagePath=$(echo "$package" | tr '.' '/')

rootPath=$(cat config | grep ROOT | awk '{print $2}')

presenationPath=$(cat config | grep PRESENTATIONPATH | awk '{print $2}')

fullPath="./../$rootPath/$packagePath/$presenationPath"

cd  $fullPath


filePath1=$(echo "$lowername/viewmodel/"$filename"ViewAction.kt")
filePath2=$(echo "$lowername/viewmodel/"$filename"ViewEvent.kt")
filePath3=$(echo "$lowername/viewmodel/"$filename"ViewState.kt")



#FILE 1 ACTION
echo "package $package.$presenationPath.$lowername.viewmodel" > "$filePath1"
echo "sealed interface "$filename"ViewAction {" >> "$filePath1"
echo "" >> "$filePath1"
echo "    data object OnBack : "$filename"ViewAction" >> "$filePath1"
echo "}" >> "$filePath1"


#FILE 2 EVENT
echo "package $package.$presenationPath.$lowername.viewmodel" > "$filePath2"
echo "sealed interface "$filename"ViewEvent {" >> "$filePath2"
echo "" >> "$filePath2"
echo "    data object OnBack : "$filename"ViewEvent" >> "$filePath2"
echo "}" >> "$filePath2"


#FILE 3 STATE
echo "package $package.$presenationPath.$lowername.viewmodel" > "$filePath3"
echo "" >> "$filePath2"
echo "data class "$filename"ViewState(val isLoading:Boolean= false)" >> "$filePath3"
