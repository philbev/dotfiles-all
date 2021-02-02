# KEYCHRON LINUX FUNCTION KEYS
On Linux, the Keychron K2 doesn’t register any of
the F1-F12 function keys as actual F keys, instead, treating them as multimedia
keys by default. Here’s how to fix it!

They keyboard has 2 modes: Windows/Android and MacOS, but neither mode worked
properly out of the box.

To fix this:

Set the keyboard to Windows mode via the side switch. then use  keys:
```bash
    <Fn>+<X>+<L>
```
(hold for 4 seconds) to set the function key row to “Function” mode. (usually
all that’s necessary on Windows)

```bash
    echo 0 | sudo tee /sys/module/hid_apple/parameters/fnmode
```

Once complete, my F1-F12 keys work properly, and holding Fn turns them into
multimedia keys. You can use the evtest utility to check how keyboard keys are
registering until you get the above combination of settings configured properly.

To persist this change, add a module option for hid_apple:

```bash
    echo "options hid_apple fnmode=0" | sudo tee -a /etc/modprobe.d/hid_apple.conf
```

You may need to rebuild your initramfs if hid_apple is included.

ubuntu:
```bash
sudo update-initramfs -u
```

arch:
```bash
mkinitcpio -P See also:
```

Thanks to Mike Shade for this information:

https://mikeshade.com/posts/keychron-linux-function-keys/?fbclid=IwAR2BEpM_nbaMgU38qqtz0QUSdVT4WmUTBby88h4QhK4qXGfhHuJ6QeqPHnc

JUST TESTING :-)
