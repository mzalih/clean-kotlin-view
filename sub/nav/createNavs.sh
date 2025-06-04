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
if [[ ! -d core/navigation ]]; then
    mkdir core/navigation
fi 
#check a file named Screen.kt inside core/views
if [[ ! -f core/navigation/Screen.kt ]]; then
    echo  $(pwd)
    touch core/navigation/Screen.kt
    echo "package $package.$presenationPath.core.navigation" > core/navigation/Screen.kt
    #copy contents of loader.txt to LoaderBox.kt
    cat "$currentPath"/sub/nav/screen.txt >> core/navigation/Screen.kt
fi

#check a file named Screen.kt inside core/views
if [[ ! -f core/navigation/NavigationCoordinator.kt ]]; then
    echo  $(pwd)
    touch core/navigation/NavigationCoordinator.kt
    echo "package $package.$presenationPath.core.navigation" > core/navigation/NavigationCoordinator.kt
    #copy contents of loader.txt to LoaderBox.kt
    cat "$currentPath"/sub/nav/navigate.txt >> core/navigation/NavigationCoordinator.kt
fi

#check a file named NavigationCoordinator.kt inside core/views
if [[ ! -f core/navigation/NavHostNavigator.kt ]]; then
    echo  $(pwd)
    touch core/navigation/NavHostNavigator.kt
    echo "package $package.$presenationPath.core.navigation" > core/navigation/NavHostNavigator.kt
    #copy contents of loader.txt to LoaderBox.kt
    cat "$currentPath"/sub/nav/navhost.txt >> core/navigation/NavHostNavigator.kt
fi