#!/bin/bash

git submodule add git@github.com:dalehenrich/filetree 3rdparty/gemstone/filetree
git config -f .gitmodules submodule.3rdparty/gemstone/filetree.branch master

git submodule add git@github.com:glassdb/glass.git 3rdparty/gemstone/glass  
git config -f .gitmodules submodule.3rdparty/gemstone/glass.branch master

git submodule add git@github.com:GsDevKit/Grease.git 3rdparty/gemstone/grease     
git config -f .gitmodules submodule.3rdparty/gemstone/grease.branch master

git submodule add git@github.com:GsDevKit/gsUpgrader.git 3rdparty/gemstone/gsUpgrader   
git config -f .gitmodules submodule.3rdparty/gemstone/gsUpgrader.branch master

git submodule add git@github.com:dalehenrich/metacello-work.git 3rdparty/gemstone/metacello-work  
git config -f .gitmodules submodule.3rdparty/gemstone/metacello-work.branch master

git submodule add git@github.com:dalehenrich/metacello-work.git 3rdparty/gemstone/metacelloPreview  
git config -f .gitmodules submodule.3rdparty/gemstone/metacelloPreview.branch configuration
