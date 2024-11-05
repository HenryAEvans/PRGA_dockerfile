#!/bin/bash
docker run -it \
	-v $(pwd)/workspace:/root/workspace:rw \
	prga_container bash
