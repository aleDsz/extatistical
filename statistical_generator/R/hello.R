# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

args = commandArgs(trailingOnly=TRUE)
if (length(args) == 0) {
	cat("there's no args")
} else {
	base64_json = jsonlite::base64_dec(args[1])
	json = jsonlite::fromJSON(rawToChar(base64_json))
	json$test = "321"
	json$processed_by = "R application"
	cat(jsonlite::base64_enc(jsonlite::toJSON(json, auto_unbox = TRUE)))
}