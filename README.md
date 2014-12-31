# social_snippet.vim

[![Build Status](https://travis-ci.org/social-snippet/vim-social-snippet.svg?branch=master)](https://travis-ci.org/social-snippet/vim-social-snippet)

Social snippet plugin for Vim

## Installation

### Use Git

```bash
$ mkdir -p ~/.vim/bundle
$ git clone https://github.com/social-snippet/vim-social-snippet ~/.vim/bundle/vim-social-snippet
```

### Use [neobundle.vim](https://github.com/Shougo/neobundle.vim)

Add the following line to .vimrc:

```viml
NeoBundle "social-snippet/vim-social-snippet"
```

and run `:NeoBundleInstall`

### Requirements

* vim >= 7.3
* ruby >= 1.9.3

## Usage

TODO: Write usage instructions here

## Issues

* SEGV
  * if `:ruby p RUBY_VERSION` (vim) != `$ ruby --version` (cli)
    * recommend to rebuild vim by your self


## Contributing

1. Fork it ( https://github.com/social-snippet/vim-social-snippet/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

