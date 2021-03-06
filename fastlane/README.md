fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

## Choose your installation method:

<table width="100%" >
<tr>
<th width="33%"><a href="http://brew.sh">Homebrew</a></td>
<th width="33%">Installer Script</td>
<th width="33%">Rubygems</td>
</tr>
<tr>
<td width="33%" align="center">macOS</td>
<td width="33%" align="center">macOS</td>
<td width="33%" align="center">macOS or Linux with Ruby 2.0.0 or above</td>
</tr>
<tr>
<td width="33%"><code>brew cask install fastlane</code></td>
<td width="33%"><a href="https://download.fastlane.tools">Download the zip file</a>. Then double click on the <code>install</code> script (or run it in a terminal window).</td>
<td width="33%"><code>sudo gem install fastlane -NV</code></td>
</tr>
</table>

# Available Actions
### installProfiles
```
fastlane installProfiles
```
Installs any provisioning profiles in $PROFILE_DIRECTORY, relative to fastlane's execution path.
### generateStoryboardExtensions
```
fastlane generateStoryboardExtensions
```
Generates the Storyboard extensions
### generateAll
```
fastlane generateAll
```
Generates all generated assets

----

## iOS
### ios runTests
```
fastlane ios runTests
```
Runs all the tests.
### ios incrementBuildNumber
```
fastlane ios incrementBuildNumber
```
Sets the version number to the given version or, if none is given, increments it.
### ios build
```
fastlane ios build
```
Build the archive and ipa with options (configuration (Release), include_bitcode (false), export_method (enterprise)).
### ios uploadToCrashlytics
```
fastlane ios uploadToCrashlytics
```
Upload a local IPA to Crashlytics with (group).
### ios beta
```
fastlane ios beta
```
Build and upload to Crashlytics with (configuration (Release)), (include_bitcode (false)), (export_method (enterprise)), and (group).
### ios cleanupArchive
```
fastlane ios cleanupArchive
```
Deletes the archive generated by gym.
### ios betaQA
```
fastlane ios betaQA
```
Builds and uploads to Crashlytics a QA build.
### ios cleanup
```
fastlane ios cleanup
```
Cleanup simulator

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
