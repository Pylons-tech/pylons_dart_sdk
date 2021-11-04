**Pylons**
A Flutter plugin project to connect any app with pylons blockchain.


Note in order to be able to connect with pylons blockchain you must have pylons wallet already installed on your mobile device.

**Installation**
To use the plugin, add pylons_flutter as a dependency in your pubspec.yaml file.


**Permission**
Android and iOS require to declare links permission in a configuration file.

Feel free to examine tha example app in the example directory for Deep Links (Android) and Custom URL schemes (iOS).

The following steps are not Flutter specific, but platform specific.

**For Android**

You need to declare the following intent filters in android/app/src/main/AndroidManifest.xml:

```
<manifest ...>
    <!-- ... other tags -->
    <application ...>
        <activity ...>
        <!-- ... other tags -->

        <!-- Pylons Links -->
        <intent-filter>
            <action android:name="android.intent.action.VIEW" />
                <category android:name="android.intent.category.DEFAULT" />
                <category android:name="android.intent.category.BROWSABLE" />
                <!-- Accepts URIs that begin with YOUR_SCHEME://YOUR_HOST -->
                <data
                    android:scheme="pylons"
                    android:host="[YOUR_HOST]" />
        </intent-filter>


        </activity>
    </application>
</manifest>
```    
The android:host attribute variable is the one that you need to put it must be as unique as possible

**For IOS**
You need to declare the following  in ios/Runner/Info.plist:
```
	<key>CFBundleURLTypes</key>
	<array>
		<dict>
			<key>CFBundleTypeRole</key>
			<string>Editor</string>
			<key>CFBundleURLName</key>
			<string>[Put your bundle id here]</string>
			<key>CFBundleURLSchemes</key>
			<array>
				<string>pylons-[YOUR_HOST]</string>
			</array>
		</dict>
	</array>
    <key>LSApplicationQueriesSchemes</key>
    <array>
        <string>pylons-wallet</string>
    </array>
```

Note: Dont't put underscore in the host name. The iOS system will not send response from wallet to your app.

**For Dart side:**
Initialise the sdk before the run app.


    WidgetsFlutterBinding.ensureInitialized();  
    
    PylonsWallet.setup(mode: PylonsMode.prod, host: 'example');  
 
    runApp(const MyApp());

Here host should be same what you put in the


> android/app/src/main/AndroidManifest.xml:
> ios/Runner/Info.plist:
