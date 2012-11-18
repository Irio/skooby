Skooby
=====

Gives you some API like's methods to access [Skoob](http://skoob.com.br/) data.

Installation
------------

**Not yet released at RubyGems**

Usage
-----

**Searching books**
```ruby
im_feeling_lucky = Skooby::Book.first("Iluminado")
# => #<Skooby::Book:0x007ff8c34a6370 @id="19733", @title="O Iluminado">

collection = Skooby::Search.new.book("O Iluminado")
# => [#<Skooby::Book:0x007ff8c31f5248 @id="19733", @title="O Iluminado">,
# #<Skooby::Book:0x007ff8c32055f8 @id="4257", @title="Os Vagabundos Iluminados">,
# #<Skooby::Book:0x007ff8c3204bd0 @id="1896", @title="Buda">,
# #<Skooby::Book:0x007ff8c3203aa0 @id="4447", @title="Antonio Carlos Jobim">,
# #<Skooby::Book:0x007ff8c3209248 @id="115179", @title="O Milionário em um Minuto">,
# #<Skooby::Book:0x007ff8c3207b28 @id="247852", @title="Iluminados">,
# #<Skooby::Book:0x007ff8c3207240 @id="50085", @title="A hierarquia dos iluminados">,
# #<Skooby::Book:0x007ff8c32069d0 @id="2956", @title="I Ching Iluminado">,
# #<Skooby::Book:0x007ff8c3206250 @id="31676", @title="O exército iluminado">,
# #<Skooby::Book:0x007ff8c3205cb0 @id="58763", @title="O Iluminado - A História de Buda">,
# #<Skooby::Book:0x007ff8c321da90 @id="181707", @title="Os Iluminados">,
# #<Skooby::Book:0x007ff8c321d2e8 @id="75327", @title="O enigma do Iluminado Vl. I">,
# #<Skooby::Book:0x007ff8c321cde8 @id="249007", @title="O Tesouro Iluminado">,
# #<Skooby::Book:0x007ff8c321c640 @id="201998", @title="O iluminado">,
# #<Skooby::Book:0x007ff8c321bd30 @id="165554", @title="Palco Iluminado">,
# #<Skooby::Book:0x007ff8c321b588 @id="59664", @title="Os amantes iluminados">,
# #<Skooby::Book:0x007ff8c321aed0 @id="259475", @title="O enigma do Iluminado Vl. II">,
# #<Skooby::Book:0x007ff8c321a728 @id="153544", @title="O vazio iluminado">,
# #<Skooby::Book:0x007ff8c321a138 @id="95917", @title="O gol iluminado">,
# #<Skooby::Book:0x007ff8c32211e0 @id="50069", @title="Caminho Iluminado">]
```

Contributing
------------

Feel free to contribute with any patch, even removing extra white spaces. Open a pull request and make us all happy!
