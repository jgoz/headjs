all: head min load


# for debugging
head: src/core.js src/css3.js src/load.js
	# grep "console" $^
	cat $^ > dist/head.js

min: head
	curl --data-urlencode js_code@dist/head.js http://marijnhaverbeke.nl/uglifyjs > dist/head.min.js
	
load: src/load.js
	curl --data-urlencode js_code@$^ http://marijnhaverbeke.nl/uglifyjs > dist/head.load.min.js
