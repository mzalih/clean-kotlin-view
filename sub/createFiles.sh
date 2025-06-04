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
echo $packagePath



rootPath=$(cat config | grep ROOT | awk '{print $2}')

presenationPath=$(cat config | grep PRESENTATIONPATH | awk '{print $2}')

fullPath="./../$rootPath/$packagePath/$presenationPath"

currentPath=$(pwd)
echo $currentPath
echo $rootPath
echo $fullPath 


# make directory to full path if not exst
if [[ ! -d $fullPath ]]; then
    mkdir -p $fullPath
fi
cd  $fullPath
# Create the first folder view
mkdir "$lowername"

# Create the first folder view
mkdir "$lowername"/view

# Create the second folder viewmodel
mkdir "$lowername"/viewmodel

# Create the first file inside folder1

touch "$lowername"/view/"$filename"Screen.kt
touch "$lowername"/view/"$filename"View.kt



# Create the second file inside folder2
touch "$lowername"/viewmodel/"$filename"ViewModel.kt
touch "$lowername"/viewmodel/"$filename"ViewAction.kt
touch "$lowername"/viewmodel/"$filename"ViewEvent.kt
touch "$lowername"/viewmodel/"$filename"ViewState.kt


#check the folder core
if [[ ! -d core ]]; then
    mkdir core
fi 

#check the folder  core/views
if [[ ! -d core/views ]]; then
    mkdir core/views
fi 
#check a file named LoaderBox.kt inside core/views
if [[ ! -f core/views/LoaderBox.kt ]]; then
    echo  $(pwd)
    touch core/views/LoaderBox.kt
    echo "package $package.$presenationPath.core.views" > core/views/LoaderBox.kt
    #copy contents of loader.txt to LoaderBox.kt
    cat "$currentPath"/sub/loader.txt >> core/views/LoaderBox.kt
fi

#check the folder  core/utils
if [[ ! -d core/utils ]]; then
    mkdir core/utils
fi 

#check a file named LoaderBox.kt inside core/utils
if [[ ! -f core/utils/ObserveAsEvents.kt ]]; then
    echo  $(pwd)
    touch core/utils/ObserveAsEvents.kt
    echo "package $package.$presenationPath.core.utils" > core/utils/ObserveAsEvents.kt
    #copy contents of loader.txt to LoaderBox.kt
    cat "$currentPath"/sub/observer.txt >> core/utils/ObserveAsEvents.kt
fi
