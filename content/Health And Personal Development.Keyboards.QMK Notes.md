---
id: kcmdgu65zep2guaa3kfnxr6
title: Tools
desc: ""
updated: 2024-12-15T22:35
created: 1656838045147
---
Notes, following the [official QMK documentation](https://docs.qmk.fm/).

# QMK Firmware

[[Engineering.Firmware]]

From [QMK docs](https://docs.qmk.fm/#/newbs)
Your computer **keyboard has a processor** inside of it, similar to the one inside your computer. This processor **runs software** that is responsible for **detecting button pr
sesses** and informing the computer when keys are pressed. **QMK Firmware** fills the role of **that software**, detecting button presses and passing that information on to the host computer. When you build your **custom keymap**, you are creating an **executable program for your keyboard**.
jkll

Steps:

1. First, fork the ergohaven's fork of the qMk repo. they have the code there.
2. Make sure the compiler works, using some of the example keyboards in the qmk repo.
3. install the qmk. it was tricky to do on linux, as there was something with the nmPy first, and then after that arm stack etc...
4. From the EH repo, copy to the vial repo, the EH files. Edit as needed. I basically removed the fancy rgb sruff, and added rhe tap daace stuff. 
5. Build the files. I found the build hex files in rhe .build folder in the repo.
6. Use the qmk toolbox to flash. The best way to flash is to check in **Vial** where is the **Reset** button. This will put the kb in the flash mode, then relAtively quickly press the ** flash** button in the qmk toolbox interface. 
7. Of course, there is an equivalent command line way to do that, but haven't used it.
8. Voila, you gotthe tap dace option now!!!

# QMK Configurator

# QMK Toolbox

# qmk.fm

# Software-only alternatives

On windows there is autohotkey, which has a bunch of advanced functionalities.
On unix and mac (as well as Win), there is  kmonad, which can I suppose emulate qmk pretty well...

Will try to check it out, p;erhaps especially with autoshift for the kinesis and so on...

Maybe also on the lapop i would be nice.

