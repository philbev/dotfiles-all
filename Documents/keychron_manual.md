# KEYCHRON MANUAL
## Wired Conection
1. Connect USB cable
2. Set switch at side of keyboard to 'cable'.

## Bluetooth Connection
1. Set switch to at side of keyboard to 'Bluetooth'.
2. Press and hold \<Fn\>+\<1\> for 4 seconds to pair connection.
3. Keyboard will be in pairing mode for 3 minutes.
4. Set device to be connected to pairing mode.
5. For other devices use \<Fn\>+\<2\> \<Fn\>+\<3\> keys with the above procedure.
6. To switch devices use \<Fn\>+\<1\>, \<Fn\>+\<2\> or \<Fn\>+\<3\>

**NOTE!** Once all devices have been paired, switching on bluetooth will automatically switch to last connected device.

In bluetooth mode the keyboard will automatically switch off to save battery.

To toggle battery saver mode:-
> \<Fn\>+\<S\>+\<O\>

## RGB

1. Change colour - \<Fn\>+\<Right\> or \<Fn\>+\<Left\>
2. Change lighting effects - \<Lighting Effect\> key.
3. Lower RGB brightness - \<Fn\>+\<F5\>
4. Increase RGB brightness - \<Fn\>+\<F6\>
5. Switch RGB off - \<Fn\>+\<Lighting Effect\> key.
6. Change RGB speed - \<Fn\>+\<+\> (increase) or \<Fn\>+\<-\> (decrease)

## Factory Reset
To factory reset keyboard:-
>   \<Fn\>+\<J\>+\<z\>

## Keychron Linux Function Keys
On Linux, the Keychron K2 doesn’t register any of
the F1-F12 function keys as actual F keys, instead, treating them as multimedia
keys by default. Here’s how to fix it!

They keyboard has 2 modes: Windows/Android and MacOS, but neither mode worked
properly out of the box.

To fix this:

Set the keyboard to Windows mode via the side switch. then use  keys:

>    \<Fn\>+\<X\>+\<L\>

(hold for 4 seconds) to set the function key row to “Function” mode. (usually
all that’s necessary on Windows)

>    echo 0 | sudo tee /sys/module/hid_apple/parameters/fnmode

Once complete, F1-F12 keys should work properly, and holding Fn turns them into
multimedia keys. Use the **evtest** utility to check how keyboard keys are
registering until the above combination of settings are configured properly.

To persist this change, add a module option for hid_apple:

>    echo "options hid_apple fnmode=0" | sudo tee -a /etc/modprobe.d/hid_apple.conf

initramfs may need to be rebuilt if hid_apple is included.

ubuntu:
>   sudo update-initramfs -u

arch:
>   mkinitcpio -P See also:

Thanks to Mike Shade for this information:

https://mikeshade.com/posts/keychron-linux-function-keys/?fbclid=IwAR2BEpM_nbaMgU38qqtz0QUSdVT4WmUTBby88h4QhK4qXGfhHuJ6QeqPHnc

## Dismantling/Reassembling
To remove aluminium side panels use T6H bit from bit set.
