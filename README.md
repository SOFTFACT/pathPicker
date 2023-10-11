| Branch | 4D Version |
|----------|--------|
| master (Main branch) | ![version](https://img.shields.io/badge/version-20R2-F070AA) |
| 20.1 | ![version](https://img.shields.io/badge/version-20.1-F070AA) |
| 19R8  | ![version](https://img.shields.io/badge/version-19R8-3E8B93) |


# pathPicker 4D 20R2

# What is it?

The `pathPicker` component is a widget for displaying and selecting the path of a target file or folder as you see it in various 4D application dialogs.

<img src="./assets/patPiker.png">

The main branch continues to evolve as 4D application evolves and now uses, among other things, <a href="https://developer.4d.com/docs/en/Concepts/classes.html">Classes</a> and <a href="https://developer.4d.com/docs/en/FormEditor/stylesheets.html">Style sheets</a> to allow an adaptation to the look & fill of your database.

The last version v18 compatible is available <a href="https://github.com/vdelachaux/pathPicker/releases/tag/v18">here</a>

# Initialization

```4d
$o:=New object
$o.placeHolder:="Select the backup setting file…"
$o.message:="Select a setting file…"
$o.fileTypes:=".4DSettings"
$o.directory:=1
$o.options:=Package open+Use sheet window
$picker:=pathPicker (File(Current backup settings file);$o)
```

# Properties

### Path properties

|Properties|type|Description
|----------|:--------:|--------|
|**.target**|Object|The target **File** or **Folder**|
|**.type**|Integer|The type of the target\*|
|**.platformPath**|Text|The plateforme pathname|
|**.path**|Text|The POSIX pathname|

\*4D constants _Is a document_ or _Is a folder_

### Widget behavior properties

|Properties|type|Description
|----------|:--------:|--------|
|**.placeHolder**|Text|The place holder displayed if the target is empty|
|**.message**|Text|Title of the selection dialog box|
|**.directory**|Text, Integer|Directory access path (text) or memorized access path (Int)\*|
|**.fileTypes**|Text|List of types of documents to filter, or "*" to not filter documents\*|
|**.options**|Integer|Selection option(s)\*|
|**.browse**|Boolean|Display the "Browse" button|
|**.showOnDisk**|Boolean|Display the "Show on disk…" item in the linked menu|
|**.copyPath**|Boolean|Display the "Copy path" item in the linked menu|
|**.openItem**|Boolean|Allow the opening of a folder selected in the linked menu|
|**.label**|Text|Label diplayed into the widget\*\*|

\*See the documentation for the commands **Select a document** and **Select a folder**.    
\*\*The label is displayed in red if the path name is invalid. You shouldn't have to change it

### Default values

|Properties| |
|----------|--------|
|**.fileTypes**|_Is a document_|
|**.options**|_Package selection_ + _Use sheet window_|
|**.browse**|**True**|
|**.showOnDisk**|**True**|
|**.copyPath**|**True**|
|**.openItem**|**True**|

# Methods

### Changing the target

|Methods|Comments|
|-------|--------|
|**.setTarget**(Object)|Waiting for a **File** or **Folder**|
|**.setPlatformPath**(Text)||
|**.setPath**(Text)||

### Widget features

|Methods|Comments|
|-------|--------|
|**.setType**(Int)|Use the 4D constants _Is a document_ or _Is a folder_|
|**.setMessage**(Text)||
|**.setPlaceholder**(Text)||

# How to install

1. To use the widget as is, copy the <a href="https://github.com/vdelachaux/pathPicker/tree/master/Build/Components">pathPicker.4dbase</a> into the `Components` folder of your database.
2. If you want to integrate the component's elements into your code, you must copy the contents of the folders `Classes`, `Forms`, `Methods` & `Resources` to the corresponding folders of your database.
