all: g81_relative.js dist

dist: g81_relative.js
	parcel build index.html --public-url ./

g81_relative.js: g81_relative.rb
	gem install opal
	opal -c g81_relative.rb > g81_relative.js
	$(MAKE) dist
