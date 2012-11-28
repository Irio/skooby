Skooby
=====

[![Build Status](https://secure.travis-ci.org/Irio/skooby.png?branch=master)](https://travis-ci.org/Irio/skooby)

Gives you some API like's methods to access [Skoob](http://skoob.com.br/) data.

Installation
------------

Add in your Gemfile

```ruby
gem 'skooby'
```

Then run `bundle install`

Usage
-----

**Fetching information about a book**
```ruby
book = Skooby::Book.new(id: 108)
book.url
# => "http://skoob.com.br/livro/108"

# Force eager load of attributes
book.fetch
# => #<Skooby::Book:0x007faafa445898
#  @author="J. K. Rowling",
#  @id=108,
#  @rating=0.88,
#  @title="Harry Potter e a Pedra Filosofal",
#  @votes="47688">
```

**Searching books**
```ruby
collection = Skooby::Search.new.book("O Iluminado")
# => [#<Skooby::Book:0x007faafa335098
#  @author="Stephen  King",
#  @id="19733",
#  @title="O Iluminado">,
# #<Skooby::Book:0x007faafa333d60
#  @author="Deepak Chopra",
#  @id="1896",
#  @title="Buda">,
# #<Skooby::Book:0x007faafa3327d0
#  @author="Helena Jobim",
#  @id="4447",
#  @title="Antonio Carlos Jobim">, ...]
```

**Reviews**
```ruby
book = Skooby::Book.new(id: 108)
book.reviews(page: 1)
# => {:page=>1,
#  :results=>
#   [#<Skooby::Review:0x007fe45b4f07f8
#     @author="Rafa",
#     @text=
#      "Vi todos os filmes e resolvi ler os livros, acho que J.K tem que ter poderes mágicos para poder escrever um livro magnifico como esse, ela é uma das melhores escritoras atualmente e faz suas história criarem vida.",
#     @title="Harry Potter e a pedra filosofal ">, ...]}
```

Contributing
------------

Feel free to contribute with any patch, even removing extra white spaces.

Open a pull request and make us all happy!

To start with the development:
```sh
$ git clone git@github.com:Irio/skooby.git
$ cd skooby
$ bundle install
$ rake test
```
