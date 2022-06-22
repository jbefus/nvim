# my neovim config for c# + svelte + tailwindcss web dev

23/06/2022: as of right now this runs pretty stable on wsl2 ubuntu 22 LTS on neovim 0.8.0 \[c9432528\]

feel free to use this as reference point, i can not promise this stays stable all the time, because I'm constantly tweaking things.
I've gotten a lot of inspiration from [Chris@machine](https://github.com/ChristianChiarulli). 

![How it looks by default](https://gitlab.becute.dev/drgg/image-dump/-/raw/mega/Screenshot%202022-06-23%20105606.png))

## 100% lua, 100% luv

## things you 100% need:

- Neovim python support

  ```
  pip install pynvim
  ```

- Neovim node support

  ```
  npm i -g neovim
  ```
  
also: I'm on nightly, so if you are on neovim/stable you might experience some issues :/

---

## Resources

[config with lua basics](https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/)

<details>
  <summary>
     Vim Surround reference
  </summary>
  
  It's easiest to explain with examples. Press `cs"'` inside

      "Hello world!"

to change it to

      'Hello world!'

Now press `cs'<q>` to change it to

      <q>Hello world!</q>

To go full circle, press `cst"` to get

      "Hello world!"

To remove the delimiters entirely, press `ds"`.

      Hello world!

Now with the cursor on "Hello", press `ysiw]` (`iw` is a text object).

      [Hello] world!

Let's make that braces and add some space (use `}` instead of `{` for no
space): `cs]{`

      { Hello } world!

Now wrap the entire line in parentheses with `yssb` or `yss)`.

      ({ Hello } world!)

Revert to the original text: `ds{ds)`

      Hello world!

Emphasize hello: `ysiw<em>`

      <em>Hello</em> world!

Finally, let's try out visual mode. Press a capital V (for line-wise
visual mode) followed by `S<p class="important">`.

      <p class="important">
        <em>Hello</em> world!
      </p>

This plugin is very powerful for HTML and XML editing, a niche which
currently seems under-filled in Vim land. (As opposed to HTML/XML
_inserting_, for which many plugins are available). Adding, changing,
and removing pairs of tags simultaneously is a breeze.

The `.` command will work with `ds`, `cs`, and `yss` if you install
[repeat.vim](https://github.com/tpope/vim-repeat).
  
[checkout tpope/vim.surround](https://github.com/tpope/vim-surround)

</details>

## vim emmet reference

```html
.contet
```

press CTRL + y and then ,(comma)

```html
<div class="contet"></div>
```

_Note in regards to prettier and svelte: make sure the required plugins are either installed globally or referenced when the sources are setup_

<details>
<summary>install history from netcoredbg</summary>

- 845 cd ~/.local/share/nvim/site/pack/packer/start/netcoredbg/
- 852 mkdir build
- 853 cd build/
- 855 sudo apt install clang
- 856 CC=clang CXX=clang++ cmake ..
- 859 cd build/
- 860 make
- 862 sudo make install
- 868 /usr/local/netcoredbg --buildinfo

[check here](https://github.com/Samsung/netcoredbg)

</details>
