# Latex Protocol Template

Template for lab protocols. Especially at the FH-JOANNEUM.

## Setup

To setup this template for a protocol you can use the shell script `./setup/setup.sh`. This script will ask you for name, subject, a new repository to connect to etc. All parameters are optional.

At the moment there is only a setup script for unix. If you how to write a similar script for windows I would be really happy about your contribution.

The template works best when working in Visual Studio Code with the [Latex Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) extension.

## Structure

The latex part of the project is all located in the `src` folder. The entry-file in each folder is called `index.tex`. When using Visual Studio Code the pdf will generated into the `build` folder.

### params.tex

This file is generated by the setup script. It contains a set of commands with information given in the setup process. You can always change this information by yourself.

### Config

This folder contains the different configurations for the document.

### Pages

This folder is used for the actual content of the document.

The devicelist folder contains a preset of laboratory equipment wich can be changed and added to the document depending on your needs.