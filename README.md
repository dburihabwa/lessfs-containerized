# Lessfs
A containerized version if lessfs.

## Building:

```bash
docker build -t lessfs .
```

## Running
```bash
docker run --detach=true \
           --device /dev/fuse --cap-add SYS_ADMIN --security-opt apparmor:unconfined \
           lessfs
```
Or in interactive mode
```bash
docker run --interactive --tty \
           --device /dev/fuse --cap-add SYS_ADMIN --security-opt apparmor:unconfined \
           lessfs
```