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

filePath=$(echo "$lowername/view/"$filename"Screen.kt")

echo "package $package.$presenationPath.$lowername.view" >> "$filePath"
echo "" >>  "$filePath"
echo "import androidx.compose.foundation.background" >>  "$filePath"
echo "import androidx.compose.foundation.layout.Column" >>  "$filePath"
echo "import androidx.compose.foundation.layout.fillMaxWidth" >>  "$filePath"
echo "import androidx.compose.foundation.layout.padding" >>  "$filePath"
echo "import androidx.compose.material.icons.Icons" >>  "$filePath"
echo "import androidx.compose.material.icons.automirrored.filled.ArrowBack" >>  "$filePath"
echo "import androidx.compose.material3.ExperimentalMaterial3Api" >>  "$filePath"
echo "import androidx.compose.material3.Icon" >>  "$filePath"
echo "import androidx.compose.material3.IconButton" >>  "$filePath"
echo "import androidx.compose.material3.Scaffold" >>  "$filePath"
echo "import androidx.compose.material3.Text" >>  "$filePath"
echo "import androidx.compose.material3.TopAppBar" >>  "$filePath"
echo "import androidx.compose.runtime.Composable" >>  "$filePath"
echo "import androidx.compose.ui.Alignment" >>  "$filePath"
echo "import androidx.compose.ui.Modifier" >>  "$filePath"
echo "import androidx.compose.ui.text.style.TextAlign" >>  "$filePath"
echo "import androidx.compose.ui.unit.dp" >>  "$filePath"

echo "import $package.$presenationPath.core.views.LoaderBox" >>  "$filePath"
echo "import $package.$presenationPath.$lowername.viewmodel."$filename"ViewModel" >>  "$filePath"
echo "import $package.$presenationPath.$lowername.viewmodel."$filename"ViewAction" >>  "$filePath"
echo "import $package.$presenationPath.$lowername.viewmodel."$filename"ViewState" >>  "$filePath"

echo "@OptIn(ExperimentalMaterial3Api::class)" >>  "$filePath"
echo "@Composable" >>  "$filePath"
echo "fun "$filename"Screen(" >>  "$filePath"
echo "    state: "$filename"ViewState," >>  "$filePath"
echo "    action: ("$filename"ViewAction) -> Unit" >>  "$filePath"
echo ") {" >>  "$filePath"
echo "    Scaffold(" >>  "$filePath"
echo "        topBar = {" >>  "$filePath"
echo "            TopAppBar(" >>  "$filePath"
echo "                title = { Text(""$filename" Settings") }," >>  "$filePath"
echo "                navigationIcon = {" >>  "$filePath"
echo "                    IconButton(onClick = {" >>  "$filePath"
echo "                        action("$filename"ViewAction.OnBack)" >>  "$filePath"
echo "                    })  {" >>  "$filePath"
echo "                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Go back")" >>  "$filePath"
echo "                    }" >>  "$filePath"
echo "" >>  "$filePath"
echo "                }" >>  "$filePath"
echo "" >>  "$filePath"
echo "            )" >>  "$filePath"
echo "        }," >>  "$filePath"
echo "        content = {" >>  "$filePath"
echo "            LoaderBox(" >>  "$filePath"
echo "                isLoading = false," >>  "$filePath"
echo "                content = {" >>  "$filePath"
echo "                    Column(modifier = Modifier" >>  "$filePath"
echo "                        .padding(top = it.calculateTopPadding())" >>  "$filePath"
echo "                        .fillMaxWidth()" >>  "$filePath"
echo "                    ) {" >>  "$filePath"
echo "                        Text(" >>  "$filePath"
echo "                            "This Page is For Development Time Access Only,\nIf you reached this page accidentally,\nplease click back arrow"," >>  "$filePath"
echo "                            textAlign = TextAlign.Center," >>  "$filePath"
echo "                            modifier = Modifier" >>  "$filePath"
echo "                                .padding(top = 24.dp)" >>  "$filePath"
echo "                                .align(alignment = Alignment.CenterHorizontally)" >>  "$filePath"
echo "                        )" >>  "$filePath"
echo "" >>  "$filePath"
echo "                    }" >>  "$filePath"
echo "                }" >>  "$filePath"
echo "            )" >>  "$filePath"
echo "        }" >>  "$filePath"
echo "    )" >>  "$filePath"
echo "}" >>  "$filePath"