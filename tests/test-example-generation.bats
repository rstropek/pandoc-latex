#!/usr/bin/env bash

# Setup
rm -rf /tmp/md-to-pdf

# Function to verify an example.
# @param $1 The name of the directory to proceed.
verify_example() {

	# Copy the test resources
	tdir="$1"
	mkdir -p "/tmp/md-to-pdf"
	cp -r "${BATS_TEST_DIRNAME}/../examples/${tdir}" "/tmp/md-to-pdf"
	rm "/tmp/md-to-pdf/${tdir}/mydoc.pdf"
	
	# Precondition: no PDF file
	[ ! -f "/tmp/md-to-pdf/${tdir}/mydoc.pdf" ]

	# Generate it by using pandoc-latex-template 2.4.0
	run docker run --rm \
		-v "/tmp/md-to-pdf/${tdir}":/data \
		-w /data  \
		--user `id -u`:`id -g` \
		rstropek/pandoc-latex:test \
		-f markdown \
		--template https://raw.githubusercontent.com/Wandmalfarbe/pandoc-latex-template/v2.4.0/eisvogel.tex \
		-t latex \
		-o mydoc.pdf \
		--metadata-file=mydoc.yaml \
		mydoc.md

	echo "$output"
	[ "$status" -eq 0 ]

	# Postcondition: a PDF file was generated
	[ -f "/tmp/md-to-pdf/${tdir}/mydoc.pdf" ]	
}


@test "Generation works for the « basic » example" {
	echo "Testing the the « basic » example"
	verify_example "basic"
}


@test "Generation works for the example « with optional packages »" {
	echo "Testing the the example « with optional packages »"
	verify_example "with-optional-packages"
}

