# Windows requirements install instructions

These instructions have been tested on Windows 10.

> NOTE: To change the system `PATH` you can use GUI at 
> `System Properties > Advanced > Environment Variables... > System Variables`.

### 1. Install [MinGW](http://sourceforge.net/projects/mingw/files/Installer/mingw-get-setup.exe/download) (default install)

- Select 'msys-base' from the install options
- Select 'msys-patch (bin)' and 'msys-zip' from All Packages
- Select 'Apply changes' from Installation menu
  
### 2. Add msys to System Path

- `C:\MinGW\msys\1.0\bin`

### 3. Install [Git](http://git-scm.com/download/win)

### 4. Download and Install [Microsoft Visual Studio Community 2017](https://www.visualstudio.com/en-us/products/visual-studio-community-vs.aspx) for Windows Desktop

### 5. Add MSBuild to System Path:
   
- `C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin\amd64`

### 6. Download and Install Boost 1.59.0 binaries

[boost_1_59_0-msvc-14.0-64.exe](http://sourceforge.net/projects/boost/files/boost-binaries/1.59.0/boost_1_59_0-msvc-14.0-64.exe/download)

### 7. Set Environment Variables for Boost

- `BOOST_ROOT`: `C:\local\boost_1_59_0`
- `BOOST_LIBRARYDIR`: `C:\local\boost_1_59_0\lib64-msvc-14.0`

### 8. Install the Latest Version of [Cmake](https://cmake.org/files/v3.10/cmake-3.10.1-win64-x64.msi)

### 9. Add CMake to System Path:

- `C:\Program Files (x86)\CMake\bin`

### 10. Install [Python 2.7](https://www.python.org/ftp/python/2.7.14/python-2.7.14.amd64.msi)

### 11. Add Python to System Path

- `C:\Python27`

### 12. Generate and compile your coin with `msys`

- Open `C:\MinGW\msys\1.0\msys.bat` from Windows Explorer
- Navigate to your project directory
- Run `bash compile.sh -c "/maxcpucount:X" -z`
