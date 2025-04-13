# :tent: A complete bspwm configuration for Arch Linux

- Modern NEOVIM configuration.
- 18 different themes i collected for BSPWM and Polybar. With a theme selector to change on the fly.
- All the system initialization configuration you needed.

## :stars: Thanks for dropping by

This is my personal collection of configuration files.

You are probably here for my **Aesthetic BSPWM** and **Aesthetic NEOVIM** configuration.

<details>
   <summary>Here are some details about my setup:</summary>
   <ul>
      <li><strong>WM: </strong> <a href="https://github.com/baskerville/bspwm">bspwm</a></li>
      <li><strong>OS: </strong> <a href="https://archlinux.org">Arch Linux</a></li>
      <li><strong>Terminal: </strong> <a href="https://github.com/alacritty/alacritty">Alacritty</a>/<a href="https://github.com/kovidgoyal/kitty">Kitty</a></li>
      <li><strong>Shell: </strong> <a href="https://www.zsh.org">Zsh</a></li>
      <li><strong>Bar: </strong> <a href="https://github.com/polybar/polybar">Polybar</a></li>
      <li><strong>Music/Player: </strong> <a href="https://github.com/MusicPlayerDaemon/MPD">MPD</a>/<a href="https://github.com/ncmpcpp/ncmpcpp">ncmpcpp</a></li>
      <li><strong>Widgets: </strong> <a href="https://github.com/elkowar/eww">Eww</a></li>
      <li><strong>Compositor: </strong> <a href="https://github.com/ibhagwan/picom">picom</a></li>
      <li><strong>Editor: </strong> <a href="https://github.com/neovim/neovim">NeoVim</a></li>
      <li><strong>Browser: </strong> <a href="https://www.mozilla.org/en-US/firefox">Firefox</a></li>
      <li><strong>File Manager: </strong> <a href="https://github.com/xfce-mirror/thunar">Thunar</a></li>
      <li><strong>Application Launcher: </strong> <a href="https://github.com/davatorium/rofi">Rofi</a></li>
   </ul>
</details>

## :book: Wiki

Here is the [wiki](https://github.com/CuB3y0nd/1llusion/wiki). I also wrote a tutorial about the installation of Arch Linux dual boot + dotfile usage, check [Arch Linux 双系统 + Bspwm 配置小记](https://www.assembly.rip/posts/linux/archlinux-configure-note/).

## :rocket: Features

<img src="https://user-images.githubusercontent.com/67278339/221426400-6029bdd7-f183-4860-9ade-a5fe35d2251a.png" alt="Rice Menu" align="right" width="400px">

### Change themes on the fly

With our custom menu based on rofi launcher, switching between the 15 themes is as easy as a click. Enjoy the versatility of styles and color combinations instantly.

### Consistency Across the Environment

Each theme not only changes the appearance of bspwm but also instantly transforms the color scheme in alacritty terminal, eww widgets, polybar bars, notifications, and more. Visual harmony is guaranteed in every corner of your system.

### RiceEditor

Is an application designed to simplify the customization of your current theme. It allows you to easily adjust various visual and configuration aspects, tailoring your environment to your preferences without the need to manually edit configuration files.

### Unique Eww Widgets

Discover 4 unique eww widgets, including a calendar, power menu, music player, and user card. These widgets are not only functional but also instantly adapt to the color scheme of the selected theme.

### Complete Customization

Explore an elegant right-click menu made with Jgmenu, which also syncs with themes for flawless visual consistency. Additionally, 10 polybar bars and 2 eww widgets offer a fully customizable user experience.

### LockScreen

The lockscreen automatically adapts to the active theme and offers two locking options: it can capture the current screen with a blur effect, or use a specific wallpaper depending on the selected theme.

### Variety of Wallpapers

Each login surprises you with a randomly selected wallpaper. But if surprises aren't your thing, our wallpaper menu lets you choose from overall wallpapers.

### Scratchpad

A scratchpad is a tool designed to provide quick, temporary access to applications or notes without disrupting the desktop workflow. When activated, the scratchpad appears over the current workspace, allowing the user to access applications like a terminal, text editor, or any configured tool. Minimizing it hides the scratchpad from view but keeps it running in the background, ready to be reopened with a simple keyboard shortcut.

It's ideal for quick note-taking, running commands, or accessing auxiliary tools without losing focus on the current task.

### Visual Composition with Picom

Experience effortless beauty with picom as the compositor, providing a pleasing aesthetic without sacrificing performance. Enjoy a hassle-free working experience with delightful visual effects, balance between performance and beauty..
And you can adjust the transparency of your open windows with a simple key combination. Control the appearance of your desktop to perfectly suit your mood and style.

## :crystal_ball: Additional Features

### Local Music Control

Manage your local music from the polybar module and the ncmpcpp player, both with a unique design that adapts to the theme's color scheme.

### Flexibility

Hide and show the polybar and eww widgets according to your needs, giving you complete control over your workspace.

### Functional Scratchpad

Access the scratchpad functionality, a terminal window you can show or hide for tasks when you don't want the window taking up unnecessary space.

- **Change themes on the fly:** 15 different Rices now!
- **Theme Selector:** `Alt + Space` to launch it.
- **Random wallpaper:**  Every time you switch between rices or reload bspwm with `Space + R` a new wallpaper is set depending on the rice you are on.
- **Wallpaper Changer:** `Ctrl + Alt + W` changes between different wallpapers in the actual rice.
- **Hide / Unhide Bar:** If you need, you can hide bars!
- **Change transparency on the fly:** Increase and decrease transparency in focused or selected window.

**And more...**

> [!CAUTION]
> This dotfiles are configured at 1600x900 resolution with 96 DPI and 1 monitor. Some stuff might break on lower or higher resolutions, but still work!

## :art: The themes

<video src="https://user-images.githubusercontent.com/67278339/211363959-9182ecb7-e56e-4598-afed-f352c5d2979e.mp4"></video>

| :tshirt: Theme Selector |
|:-:|
|![Screenshot-11_12_2023-01-06-03](https://github.com/gh0stzk/dotfiles/assets/67278339/b11b5c58-b9ec-446b-8980-4f77bebb3432)|

| :traffic_light: Wallpaper Selector |
|:-:|
|![Screenshot-11_12_2023-01-03-00](https://github.com/gh0stzk/dotfiles/assets/67278339/0746df0f-6a56-44d6-a899-7bdbc0f1a593)|

### :octopus: Emilia

|<img src="https://user-images.githubusercontent.com/67278339/280174054-8f56d12d-4efa-4024-99e1-4679591b45ca.gif" alt="Emilia Rice" align="center">|
|---|

### :octopus: Jan

|<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/6e4959b7-6d07-42c6-8ede-2f3c16094ad2" alt="Jan Rice" align="center">|
|---|

### :octopus: Aline

|<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/874fe328-de49-4af9-8381-fce80fa9f11b" alt="Aline Rice" align="center">|
|---|

### :octopus: Andrea

|<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/1bfd302f-0e3f-4973-975b-56c78d6140ee" alt="Andrea Rice" align="center">|
|---|

### :octopus: Cynthia

|<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/5df45139-1d73-4f5f-8e8d-a417c86bfb96" alt="Cynthia Rice" align="center">|
|---|

### :octopus: Isabel

|<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/f2a0002f-3370-4361-9301-08abadcad600" alt="Isabel Rice" align="center">|
|---|

### :octopus: Silvia

|<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/616c2d93-fabf-41c2-9ab8-9c7b4d6a2e35" alt="Silvia Rice" align="center">|
|---|

### :octopus: Melissa

|<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/a63e250d-c5d1-4360-afd7-cf64bf55a0fc" alt="Melissa Rice" align="center">|
|---|

### :octopus: Pamela

|<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/f9e85839-53c9-4e15-a800-8a2f7ca40691" alt="Pamela Rice" align="center">|
|---|

### :octopus: Cristina

|<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/e14c6777-25f6-4621-a88b-4fda71dbcc7f" alt="Cristina Rice" align="center">|
|---|

### :octopus: Karla

**(Zombie-Night Color Scheme)**

|<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/5455afdf-cc2f-4a8c-8fcd-526c59066d50" alt="Karla Rice" align="center">|
|---|

### :octopus: z0mbi3

|<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/ff65caa8-6a15-4873-bf05-edf89ac0985d" alt="z0mbi3 Rice" align="center">|
|---|

### :octopus: Brenda

|<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/22e37944-5aad-46bf-8934-3a57d1718ed2" alt="Brenda Rice" align="center">|
|---|

### :octopus: Daniela

|<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/f296d6b4-9c8a-49ae-bf63-d82e5105f122" alt="Daniela Rice" align="center">|
|---|

### :octopus: Marisol

|<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/d11d20c5-1edc-44c8-901b-a4103a139617" alt="Daniela Rice" align="center">|
|---|

### :octopus: h4ck3r

|<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/2d55fcc6-1ea4-4d56-8c46-3a3fe10566fe" alt="Hacker Rice" align="center">|
|---|

### :octopus: Varinka

|<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/454d82b4-8f09-4768-bf51-6ce7818ad226" alt="Varinka Rice" align="center">|
|---|

### :octopus: Yael

|<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/cbb0a1cc-4e2d-46a2-a4f2-ee0be3d08b50" alt="Yael Rice" align="center">|
|---|

## :coffee: Very useful keybindigs to know

- `Alt + F1` Keybindings Cheat Sheet
- `Super + R` Restart bspwm
- `Super + Esc` Restart sxhkd
- `Alt + Space` Theme Selector
- `Super + Space` Apps Launcher
- `Ctrl + Alt + W` Wallpaper Selector
- `Alt + Return` Open a terminal
- `Alt + Shift + Return` Open a floating terminal
- `Super + Shift + {h, u}` Hide/Unhide Polybar/Eww bars
- `Ctrl + Alt + S` Screenshot
- `Ctrl + Shift + {+, -, i}` Changes transparency
- `Ctrl + Super + Shift + P` Power off
- `Ctrl + Super + Shift + R` Restart
- `Ctrl + Super + Shift + L` Lockscreen
- `Ctrl + Super + Shift + Q` Logout
- `Ctrl + Super + Shift + K` Brute Kill a window/process

Hold `Super` and left-click to move window, right-click to resize window.

## :floppy_disk: Installation

> [!IMPORTANT]
> The installer only works for **Arch Linux**, and based distros.
> This is step-by-step how to install this dotfiles. Just [R.T.F.M](https://en.wikipedia.org/wiki/RTFM).

- **First, download the install script**

```bash
curl https://raw.githubusercontent.com/CuB3y0nd/1llusion/master/install -o $HOME/install
```

- **Then, give it execute permissions**

```bash
chmod +x install
```

- **Finally, run the install script**

```bash
./install
```

## :jack_o_lantern: References

- **gh0stzk's rices:** [dotfiles](https://github.com/gh0stzk/dotfiles/tree/master)
- **ElKowars wacky widgets:** [Eww](https://github.com/elkowar/eww)
