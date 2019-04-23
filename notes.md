# getting completion engine to work
```bash
pip install backports.functools_lru_cache configparser futures
```

# Setting up nvim with autocomplete

- [nice! tutorial](https://jdhao.github.io/2018/12/24/centos_nvim_install_use_guide_en/)
- [Shougo/deoplete.nvim](https://github.com/Shougo/deoplete.nvim#configuration)
- pointing nvim to specific python:
    `let g:python3_host_prog = '/path/to/anaconda3/bin/python'`

put some of this in `~/.config/nvim/init.vim` and then
finish with sourceing .vimrc
- `pip install jedi-vim, pynvim`
- `:UpdateRemotePlugins`
- `:checkhealth`

