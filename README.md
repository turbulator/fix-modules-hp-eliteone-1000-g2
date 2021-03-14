# HP EliteOne 1000 G2's troubles

During the COVID-19 pandemic I bought HP EliteOne 1000 G2. The native OS is Windows 10. With Fedora I got such troubles as:

* Integrated speakers don't work. Only headphones.
* Brightness of monitor doesn't change.

I have to share my experience about fixing kernel modules

# Fix kernel modules
Build modules:

```
./fix_kernel_modules.sh
```

and install new ones from ```kernel``` directory:

``` 
sudo make M=sound/pci/hda modules_install 
sudo depmod -a
```




