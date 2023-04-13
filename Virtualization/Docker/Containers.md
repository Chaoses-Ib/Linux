# Containers
## Container detection
How to tell if you're in a Docker container:

- [cat /proc/self/cgroup](https://tuhrig.de/how-to-know-you-are-inside-a-docker-container/)
- [test -f /.dockerenv && echo inside docker || echo not inside docker](https://stackoverflow.com/a/25518538/14105244)

[shell - How to check if a process is running inside docker container? - Stack Overflow](https://stackoverflow.com/questions/23513045/how-to-check-if-a-process-is-running-inside-docker-container)