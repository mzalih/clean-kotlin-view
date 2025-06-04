#create nav folderes
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
    cat "$currentPath"/sub/utils/loader.txt >> core/views/LoaderBox.kt
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
    cat "$currentPath"/sub/utils/observer.txt >> core/utils/ObserveAsEvents.kt
fi
