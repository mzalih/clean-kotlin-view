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

viewFilePath=$(echo "$lowername/view/"$filename"View.kt")

echo "package $package.$presenationPath.$lowername.view" > "$viewFilePath"
echo "" >>  "$viewFilePath"
echo "import androidx.compose.runtime.Composable" >>  "$viewFilePath"
echo "import $package.$presenationPath.$lowername.viewmodel.*" >>  "$viewFilePath"
echo "import androidx.compose.ui.Modifier" >>  "$viewFilePath"
echo "import org.koin.compose.koinInject" >>  "$viewFilePath"
echo "import $package.$presenationPath.core.utils.ObserveAsEvents" >>  "$viewFilePath"
echo "import androidx.compose.foundation.layout.Column" >>  "$viewFilePath"
echo "import androidx.compose.foundation.layout.fillMaxWidth" >>  "$viewFilePath"
echo "import androidx.compose.foundation.layout.padding" >>  "$viewFilePath"
echo "import androidx.compose.material3.ExperimentalMaterial3Api" >>  "$viewFilePath"
echo "import androidx.compose.material3.IconButton" >>  "$viewFilePath"
echo "import androidx.compose.material3.Scaffold" >>  "$viewFilePath"
echo "import androidx.compose.material3.Text" >>  "$viewFilePath"
echo "import androidx.compose.material3.TopAppBar" >>  "$viewFilePath"

echo "import $package.$presenationPath.core.views.LoaderBox" >>  "$viewFilePath"
echo "" >>  "$viewFilePath"
# add "import androidx.compose.runtime.Composable" to bith the above file as third line
# /generate
echo

# insert a composible function to $filenameView.kt
# @Composable fun $filenameView(modifier: Modifier = Modifier) {}
echo "interface $filename""ViewNavigation {" >>   "$viewFilePath"
echo "    fun onBack()" >>  "$viewFilePath"
echo "}" >>  "$viewFilePath"
echo "" >>  "$viewFilePath"
echo "@OptIn(ExperimentalMaterial3Api::class)" >>  "$viewFilePath"
echo "@Composable" >>  "$viewFilePath"
echo "fun $filename""View(modifier: Modifier = Modifier," >>  "$viewFilePath"
echo "       navDelegate: $filename""ViewNavigation," >>  "$viewFilePath"
echo "       viewModel: $filename""ViewModel =  koinInject()" >>  "$viewFilePath"
echo "     ){" >>  "$viewFilePath"
echo "      ObserveAsEvents(viewModel.events) {" >>  "$viewFilePath"
echo "             event ->" >>  "$viewFilePath"
echo "             when (event) {" >>  "$viewFilePath"
echo "                  $filename""ViewEvent.OnBack -> {" >>  "$viewFilePath"
echo "                      navDelegate.onBack()" >>  "$viewFilePath"
echo "                  }" >>  "$viewFilePath"
echo "              }" >>  "$viewFilePath"
echo "      }" >>  "$viewFilePath"

echo "    Scaffold(" >>  "$viewFilePath"
echo "        topBar = {" >>  "$viewFilePath"
echo "            TopAppBar(" >>  "$viewFilePath"
echo "                title = { Text("\"$filename" Settings\") }," >>  "$viewFilePath"
echo "                navigationIcon = {" >>  "$viewFilePath"
echo "                    IconButton(onClick = {" >>  "$viewFilePath"
echo "                        viewModel.onAction("$filename"ViewAction.OnBack)" >>  "$viewFilePath"
echo "                    })  {" >>  "$viewFilePath"
echo "//                        Icon(contentDescription = "Go back")" >>  "$viewFilePath"
echo "                    }" >>  "$viewFilePath"
echo "" >>  "$viewFilePath"
echo "                }" >>  "$viewFilePath"
echo "" >>  "$viewFilePath"
echo "            )" >>  "$viewFilePath"
echo "        }," >>  "$viewFilePath"
echo "        content = {" >>  "$viewFilePath"
echo "            LoaderBox(" >>  "$viewFilePath"
echo "                isLoading = viewModel.state.value.isLoading," >>  "$viewFilePath"
echo "                content = {" >>  "$viewFilePath"
echo "                    Column(modifier = modifier" >>  "$viewFilePath"
echo "                        .padding(top = it.calculateTopPadding())" >>  "$viewFilePath"
echo "                        .fillMaxWidth()" >>  "$viewFilePath"
echo "                    ) {" >>  "$viewFilePath"
echo "                      $filename""Screen(viewModel.state.value,viewModel::onAction)" >>  "$viewFilePath"           
echo "                    }" >>  "$viewFilePath"
echo "                }" >>  "$viewFilePath"
echo "            )" >>  "$viewFilePath"
echo "        }" >>  "$viewFilePath"
echo "    )" >>  "$viewFilePath"


echo "}" >>  "$viewFilePath"
