@echo off
echo ========================================
echo    Task Manager CLI - Quick Start
echo ========================================
echo.

REM Check if Dart is installed
where dart >nul 2>nul
if %errorlevel% neq 0 (
    echo ERROR: Dart SDK is not installed or not in PATH!
    echo.
    echo Please install Dart SDK from: https://dart.dev/get-dart
    echo.
    echo After installation, restart your terminal and run this script again.
    echo.
    pause
    exit /b 1
)

echo Dart SDK found! Starting Task Manager...
echo.

REM Run the Dart application
dart run bin/main.dart

pause
