# Profiles
## init.ps1
This script allows me to setup the windows pc to run the `cmd` files globally just by using the file name without `.cmd`

## hello.cmd
test script to run.
```cmd
// run with default variable
hello 
// returns Hello, World!


// run with different Name
hello shawn
// returns Hello, shawn!

// run with switch variable
hello shawn -Loud
// return HELLO, SHAWN!

```

## docker-tar.cmd
used to generate docker images in tar format. user need to provide the platform to generate the tar. By default, the file will be dumped in RPI path if exist. else fail or user can provide path instead. This has to be ran within the project folder. So meaning the DockerFile should be in the same path