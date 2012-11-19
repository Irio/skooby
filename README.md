Skooby
=====

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
book.reviews
# => [#<Skooby::Review:0x007fcca9c73da0
#  @author="BiIosack",
#  @text=
#   "Harry Potter e a Pedra Filosofal. O Primeiro livro dessa saga incrível. A magia começa a partir dai.\r\nVários 'Potterheads' (fãs de Harry Potter) nasceram depois de conhecer essa obra incrível, escrita por J.K Rowling. Vale a pena conferir essa aventura. Você vai se emocionar, chorar e sorrir com essa historia maravilhosa...",
#  @title="A Magia começa a partir dai">, ...]
```

Contributing
------------

Feel free to contribute with any patch, even removing extra white spaces.

Open a pull request and make us all happy!
