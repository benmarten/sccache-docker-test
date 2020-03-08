# Docker+Rust Buildcache

Describing two strategies to cache rust builds within docker in the minimal example repo.

## Caching Cargo and Target Folders
To achieve local like build caching you simply need mount cargos `registry` and your build `target` folder as a docker cache mount.

A minimal example can be found in this branch: https://github.com/benmarten/sccache-docker-test/tree/no-sccache

## Minimal rust+sccache compilation example with docker cache volume.
If you want your cache to outlive the `target` folder or you want to share the buildcache between multiple clients/nodes, you can use sccache to achieve that. Check out the example in this master branch:

To see sccache in action within the docker container, run:

`DOCKER_BUILDKIT=1 docker build . --progress=plain`

then change the `echo 1` line to `echo 2` (to force recompilation from this line), and rerun the docker command, you'll see cache hits in sccache's stats ;)

To clear the docker cache mount:
`docker builder prune --filter type=exec.cachemount`
