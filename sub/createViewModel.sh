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

filePath=$(echo "$lowername/viewmodel/"$filename"ViewModel.kt")

echo "package $package.$presenationPath.$lowername.viewmodel" > "$filePath"


echo "import androidx.compose.runtime.State" >>  "$filePath"
echo "import androidx.compose.runtime.mutableStateOf" >>  "$filePath"
echo "import androidx.lifecycle.ViewModel" >>  "$filePath"
echo "import androidx.lifecycle.viewModelScope" >>  "$filePath"
echo "import dagger.hilt.android.lifecycle.HiltViewModel" >>  "$filePath"
echo "import kotlinx.coroutines.channels.Channel" >>  "$filePath"
echo "import kotlinx.coroutines.flow.receiveAsFlow" >>  "$filePath"
echo "import kotlinx.coroutines.launch" >>  "$filePath"
echo "import javax.inject.Inject" >>  "$filePath"

echo "@HiltViewModel" >>  "$filePath"
echo "class "$filename"ViewModel @Inject constructor() : ViewModel() {" >>  "$filePath"
echo "    private val _state = mutableStateOf("$filename"ViewState())" >>  "$filePath"
echo "    val state: State<"$filename"ViewState> = _state" >>  "$filePath"
echo "" >>  "$filePath"
echo "    private val _events = Channel<"$filename"ViewEvent>()" >>  "$filePath"
echo "    val events = _events.receiveAsFlow()" >>  "$filePath"
echo "" >>  "$filePath"
echo "" >>  "$filePath"
echo "" >>  "$filePath"
echo "    fun onAction(action: "$filename"ViewAction) {" >>  "$filePath"
echo "" >>  "$filePath"
echo "        when (action) {" >>  "$filePath"
echo "            "$filename"ViewAction.OnBack ->{" >>  "$filePath"
echo "                viewModelScope.launch {" >>  "$filePath"
echo "                    _events.send("$filename"ViewEvent.OnBack)" >>  "$filePath"
echo "                }" >>  "$filePath"
echo "            }" >>  "$filePath"
echo "        }" >>  "$filePath"
echo "    }" >>  "$filePath"
echo "}" >>  "$filePath"
