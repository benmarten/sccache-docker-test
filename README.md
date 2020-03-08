# Minimal rust+sccache compilation example with docker cache volume.

To see sccache in action within the docker container, run:

`DOCKER_BUILDKIT=1 docker build . --progress=plain`

then change the `echo 1` line to `echo 2` (to force recompilation from this line), and rerun the docker command, you'll see cache hits in sccache's stats ;)


To clear the docker cache mount:
`docker builder prune --filter type=exec.cachemount`
