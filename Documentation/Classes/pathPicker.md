<!-- Type your summary here -->
Create a new path picker

https://github.com/vdelachaux/pathPicker
## Description


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
| ||Added by LT|
|**.formBelongsToTableID**|Longint|table ID to which the form belongs. If form belongs to a project form, to not fill in|
|**.formWidth**|Longint|If form is a project form, set width returns from FORM GET PROPERTIES(Current form name; $formWidth; $formHeight)|
|**.formHeight**|Longint|If form is a project form, set height returns from FORM GET PROPERTIES(Current form name; $formWidth; $formHeight)|

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