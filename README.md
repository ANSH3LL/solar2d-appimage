# solar2d-appimage
Convert Solar2D Snap package to AppImage for Linux

## How to use the script
```bash
git clone https://github.com/ANSH3LL/solar2d-appimage.git
cd solar2d-appimage
chmod a+x build.sh
./build.sh
```

## How to use the Solar2D AppImage
- Run `./Solar2D-x86_64.AppImage builder [options]` to use the Solar2D builder
- Run `./Solar2D-x86_64.AppImage simulator` to launch the Solar2D simulator
- Run `./Solar2D-x86_64.AppImage execute /path/to/main.lua` to run a project
- Run `./Solar2D-x86_64.AppImage` to launch the Solar2D simulator. Double-clicking also works

## Disclaimer
- I cannot guarantee that the AppImage will work perfectly. If you find a defect, please open an issue or submit a pull request
- Bugs in Solar2D should be reported on the [Solar2D repo](https://github.com/coronalabs/corona/), not here
