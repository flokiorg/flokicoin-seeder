# Changelog

## [0.1.0]

First tagged release. The code predates this changelog; the entries below are
the changes made to get it building and releasable.

### Fixed

- The build failed on any glibc 2.38 or newer with `'size_t strlcpy(char*,
  const char*, size_t)' redeclared inline without 'gnu_inline' attribute`.
  glibc 2.38 added `strlcpy`/`strlcat` to `<string.h>`, which collided with the
  local fallback copies in `strlcpy.h`. Those fallbacks are now compiled only
  where the system does not provide the functions, so the seeder builds on
  current distributions as well as on the BSDs and macOS, which have always
  had them.

### Changed

- `-march=native` was removed from `CXXFLAGS`. It tunes the binary for
  whatever CPU built it, so a published artifact built on a release runner
  could fault with `SIGILL` on older hardware. `CXXFLAGS` is now overridable
  (`?=`) if you want to tune a local build.

### Added

- `CHANGELOG.md` is the version source of truth, and releases are cut by a
  `workflow_dispatch` run of `.github/workflows/release.yml`, matching the rest
  of the org. The unused `VERSION` file is gone -- nothing read it.
- CI builds the seeder on every push and pull request, so the build cannot
  break unnoticed again.
- Multi-arch `linux/amd64` and `linux/arm64` container images at
  `ghcr.io/flokiorg/flokicoin-seeder`. The released binaries are extracted from
  those same images, so the archives and the image are the same build.
