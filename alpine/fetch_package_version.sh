#!/bin/sh
set -e
# $1: package name to look up version number
# $2: branch name (Alpine version or "edge")
# $3: architecture name ("x86", "x86_64", or "aarch64")
# $4: repository name ("main" or "community")

usage() {
	cat <<-EOF
		Usage:
		  $0 [-j|--json] package branch [arch [repo]]
		  $0 -h|-H|--help

		Look up package version and print package versions in the following
		space delimited format:

		    package branch repo arch version

		package: package name to look up version number
		branch: branch name (Alpine version prefixed by "v", or "edge")
		repo: repository name ("main" or "community")
		arch: architecture name ("x86", "x86_64", or "aarch64")

		-j | --json:
		      Print non-essential field-descriptors for machine readability
		-h | -H | --help:
		      Print this help message and quit immediately
	EOF
}

case "$1" in
	-h|-H|--help)
		usage
		exit
		;;
esac

if [ $# -lt 2 ]; then
	usage
	exit 255
fi

get_version() {
	awk_options=""
	case "$1" in
		-j|--json)
			awk_options="-v json=1"
			shift
			;;
	esac

	pkg=$1
	branch=$2
	arch=${3:-x86_64}
	repo=${4:-""}

	case "$branch" in
		edge) ;;
		v[0-9]*.[0-9]*) ;;
		*)
			echo "Illegal branch name: $branch" >&2
			return 1;;
	esac

	url="https://pkgs.alpinelinux.org/packages?branch=$branch&repo=$repo&arch=$arch&name=$pkg"

	# having quoting awk_options prevents awk from reading stdin
	# shellcheck disable=SC2086
	curl -s "$url" 2>&1 | grep -A6 "$pkg\">" | awk $awk_options '\
/href="\/package\// { \
    match($0, /href="\/package\/([^\/]+)\/([^\/]+)\/([^\/]+)\/([^"]+)"/, a); \
    if (json == 1) { \
	    printf("{\"name\":\"%s\", \"branch\":\"%s\", \"repo\":\"%s\", \"arch\":\"%s\", ", a[4], a[1], a[2], a[3]); \
	} else {\
	    printf("%s %s %s %s ", a[4], a[1], a[2], a[3]); \
    }\
} \
/<strong/ { \
    match($0,/>([^<]+)</, v); \
    if (json == 1) { \
	    printf("\"version\":\"%s\"}\n", v[1]); \
	} else {
	    print v[1]; \
	} \
} \
'
}

version=$(get_version "$1" "$2" "$3" "$4")
if [ -n "$version" ]; then
	echo "$version"
else
	echo "NOT_FOUND"
fi
