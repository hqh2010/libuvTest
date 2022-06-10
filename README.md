# 说明

this is a demo for libuv

# 使用

mkdir build

cd build

cmake ..

make -j8

# 运行结果

client

```bash
test@test-pc:/media/libuv_test/build$ ./uv_client
nread is 19, buf is 512, last char is 0
client received ok, I got the data
Client has received NULL BYTE, done.
Done, uv_run returned 0
```

server

```bash
test@test-pc:/media/libuv_test/build$ ./uv_server
nread is 28, buf is 512, last char is 0
received from client:hello, server, I am client1
Close Connection
```

# 参考文档

https://gist.github.com/trevershick/080f56b36a0aa81b0658a10fd3b94c22

https://github.com/libuv/libuv/blob/v1.x/docs/code/tcp-echo-server
