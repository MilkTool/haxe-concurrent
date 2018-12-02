@echo off
REM Copyright (c) 2016-2018 Vegard IT GmbH, https://vegardit.com
REM SPDX-License-Identifier: Apache-2.0
REM Author: Sebastian Thomschke, Vegard IT GmbH

call %~dp0_test-prepare.cmd js

echo Compiling...
haxe %~dp0..\tests.hxml -js target\js\TestRunner.js
set rc=%errorlevel%
popd
if not %rc% == 0 exit /b %rc%

echo Testing [Direct Execution]...
phantomjs "%~dp0..\target\js\TestRunner.js"
