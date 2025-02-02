# Container
%%t220609%%
## Lifecycle
container 与虚拟机不同，执行完命令就会退出。

%%t15%%
## Editing files
[^edit-so]
- VS Code
- SSH
  
	`vim scp://root@localhost:22//app/conf`
- Copy files
	```sh
	docker cp <container>:/path/to/file .
	#...
	docker cp file <container>:/path/to/file
	```
- Instal an editor
	```sh
	apt-get update
	# nano, vi or vim-tiny
	apt-get install vim-tiny
	```

[^edit-so]: [command line interface - How do I edit a file after I shell to a Docker container? - Stack Overflow](https://stackoverflow.com/questions/30853247/how-do-i-edit-a-file-after-i-shell-to-a-docker-container)

## Environment variables
%%t24%%
PATH:
```sh
docker run ... bash -c 'export PATH=$PATH:/app/bin; bash'
```