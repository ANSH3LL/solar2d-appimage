if [ ! -f "Solar2D-Linux-2023.3690_amd64.snap" ]; then
    echo "Solar2D snap package not found in directory, downloading..."

    wget https://github.com/coronalabs/corona/releases/download/3690/Solar2D-Linux-2023.3690_amd64.snap
fi

echo "Unpacking build files..."

tar -xzvf build.tar.gz

echo "Unpacking snap image..."

unsquashfs -d appdir Solar2D-Linux-2023.3690_amd64.snap

echo "Cleaning appdir..."

rm -rf appdir/meta
rm -rf appdir/snap

cd appdir/usr/bin

echo "Copying libraries & creating symlinks..."

ln -s ../lib/jvm/java-8-openjdk-amd64/bin/keytool keytool
ln -s ../lib/jvm/java-8-openjdk-amd64/bin/jarsigner jarsigner
ln -s ../lib/jvm/java-8-openjdk-amd64/bin/java java

ln -s ../share/vulkan vulkan

ln -s ../lib/x86_64-linux-gnu/dri/swrast_dri.so swrast_dri.so
ln -s ../lib/x86_64-linux-gnu/dri/vmwgfx_dri.so vmwgfx_dri.so

cd ../../../

cp build/libs/libhogweed.so.5 appdir/usr/lib/libhogweed.so.5
cp build/libs/libhogweed.so.5.0 appdir/usr/lib/libhogweed.so.5.0

cp build/libs/libnettle.so.7 appdir/usr/lib/libnettle.so.7
cp build/libs/libnettle.so.7.0 appdir/usr/lib/libnettle.so.7.0

cp build/libs/libunistring.so.2 appdir/usr/lib/libunistring.so.2
cp build/libs/libunistring.so.2.2.0 appdir/usr/lib/libunistring.so.2.2.0

echo "Copying application metadata..."

# mkdir appdir/usr/share/metainfo
# cp build/Solar2D.appdata.xml appdir/usr/share/metainfo/Solar2D.appdata.xml

cp build/AppRun appdir/AppRun
cp build/Solar2D.svg appdir/Solar2D.svg
cp build/Solar2D.desktop appdir/Solar2D.desktop

chmod a+x appdir/AppRun

if [ ! -f "appimagetool-x86_64.AppImage" ]; then
    echo "AppImageTool not found in directory, downloading..."

    wget https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage

    chmod a+x appimagetool-x86_64.AppImage
fi

echo "Building AppImage..."

ARCH=x86_64 ./appimagetool-x86_64.AppImage appdir

echo "Cleaning up..."

rm -rf appdir build

echo "Done, run ./Solar2D-x86_64.AppImage to launch the Solar2D Simulator."

