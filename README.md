# social_snippet.vim

[![Build Status](https://travis-ci.org/social-snippet/vim-social-snippet.svg?branch=master)](https://travis-ci.org/social-snippet/vim-social-snippet)

Social snippet plugin for Vim

## Installation

### Using [neobundle.vim](https://github.com/Shougo/neobundle.vim)

Add the following lines to .vimrc:

```viml
NeoBundle "social-snippet/vim-social-snippet"

" to enable completion feature
let g:neocomplete#enable_at_startup = 1
let g:social_snippet#complete#enable = 1
NeoBundle "Shougo/neocomplete.vim"
```

and run `:NeoBundleInstall`

### Requirements

* [social_snippet](https://social-snippet.github.io/) >= 0.0.2 # Don't forget to install
  * `$ gem install social_snippet`
* vim >= 7.3
  * [neocomplete.vim](https://github.com/Shougo/neocomplete.vim)
* ruby >= 1.9.3
* git

## Usage

### Commands

* `:SSInsertSnippet`
* `:SSVersion`

TODO: Write more usage instructions here

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

