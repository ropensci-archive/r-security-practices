# Secutity Roadmap

## Signing and validation of R packages (and other things from the internet)

To be fleshed out and annotated as things become clearer.  I am a novice in this area so misunderstandings here will probably be shared by other users.

* `install.packages` - to get this to support signed releases we would have to have signatures with the package and that is going to require CRAN support.  We could support this for non-CRAN repos though (drat repos, etc).
* `install_github` - here we need to be able to verify the signature of a github package.  Commits can be signed and then that shows up on the releases.  To be able to verify this on installation we need to agree that the developer is someone in our web of trust.
* `source` (and other functions like `readLines`) can happily consume urls.  We could validate these
* When building packages, libraries might be downloaded (e.g., Jeroen's collection of windows libraries).  These should be signed and the signatures verified during installation (we could survey packages that use `configure` scripts to work out how many packages are potentially affected here.

## Best practices for avoiding risky behaviour

* Avoiding SQL injection
* Being careful with `system`
* etc...

## Package threat monitoring

Packages have access to the system at the level of privilege of the user running it.  This means that an R package can do all sorts of nasty things that a user can do, particularly with `system`; see [rpwnd](https://github.com/hrbrmstr/rpwnd) for a non-exhaustive list and proof of concept.

**Static analysis** This will probably be better for detecting risky behaviour than malicious behaviour.  There will be patterns that we could detect in the style of `lintr` or `goodpractice`.

**Dynamic analysis** Run a package in a sand-boxed environment and watch for things like disk and network access.  In particular anything that sends information *out* is a problem, but even some reading from remote system could send all sorts of information.  Does the package try to read from the file system at all?

## Motivating people

People don't care about this stuff.  Pair things that try to improve security with short motivational videos/gifs that show the extent of the exploit and with a video/gif that shows how a best practice/alternative tooling would prevent it. The shorter and more obvious the better.
