<h1>Running LandOS on Debian/Ubunutu    <img src="Resources/Debian_logo.png" alt="Debian Logo" height="40px">   <img src="Resources/Ubuntu-Logo.png" alt="Ubuntu Logo" height="40px"></h1>
<hr />
<h3>Requirements</h3>
<p>You will need these tools to run LandOS (unless marked "Optional).</p>
<ul>
  <li>
    QEMU x86_64
  </li>
  <li>
    NASM
  </li>
</ul>
<br />
<h3>Running LandOS</h3>
<p>Running LandOS is very easy to do and all you need is a graphic enviroment such as KDE or GNOME and QEMU x86_64.  There are two ways to run LandOS: Using the build script (LandOS/build.sh) or by typing in a simple command</p>
<h4>Running LandOS without the Build Script</h4>
<p>You can run LandOS without the build script because you are provided with a pre-built image on download.  To run LandOS, type in the following command</p>

```~ $ qemu-system-x86_64 -fda Images/LandOS.flp -m 1M```<br />
<p>LandOS needs 1MB of ram at max.  It wouldn't hurt and wouldn't change much if you were to up the amount of ram.</p>
<br />
<h4>Running LandOS using the build script:</h4>
<p>To run the build script all you need to do is give the necessary permissions to build.sh and run it. Heres what it would look like</p>

```~ $ chmod +x build.sh && ./build.sh``` <br />
<p>If you do everything properly, you should be greeted with this screen:</p>
<img src="Resources/LandOS.png" alt="LandOS Welcome Screen">
<br />
<h3>Building LandOS</h3>
<p>If you modified LandOS and need to rebuild or just want to build from source code, there is a build script that has been provided for you already.  </p>
