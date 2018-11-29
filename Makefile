all: g81_relative.js dist

dist:
	parcel index.html

g81_relative.js:
	gem install opal
	opal -c g81_relative.rb > g81_relative.js
