# This file contains hax that must be done better

# Simple form is not compatible with BS3. I fixed this by changing  some default classes
# in the simple form initializer. This gives all inputs the class form-control.
#
# Sadly, BS3 does not like form-control on file inputs, so we have to remove it again there.
$ ->
	$('input.file').removeClass('form-control')
