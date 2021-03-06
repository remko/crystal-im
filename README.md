# [Crystal iconsets for Psi](https://el-tramo.be/crystal-im)

## About

These are a set of iconsets for Psi, based on the Crystal SVG iconset by
[Everaldo Coelho](http://www.everaldo.com). Many thanks to him for creating these 
beautiful icons.


## Building

To build the iconsets, just type:

    make

This should build all the iconsets, and create the JISPs in the current
directory.


# Installing

To use the iconsets under Psi, it suffices to copy the .jisp files into the
right directory. Put the system iconset in `PSIDIR/iconsets/system`, and
the other iconsets in `PSIDIR/iconsets/roster`. Alternatively, under Linux and
Mac OS X you can put them in `~/.psi/iconsets/roster` and `~/.psi/iconsets/system` for
convenience. Then, assign the iconsets in the Options dialog of Psi:

-  Select Crystal (System) as the system iconset
-  Select Crystal (Roster) as default roster iconset
-  From the Services tab of the roster iconsets, choose Crystal (Transport) 
as the Default
-  Optionally assign other transport iconsets to the transports 
