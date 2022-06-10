#include <cassert>
#include <iostream>
#include <unistd.h>
#include <uv.h>
#include <stdio.h>
#include <string.h>

#define LISTEN_ADDRESS "/home/uthuqinghong/Desktop/mytest/666"

void on_connect_cb(uv_connect_t *req, int status);

int main(int argc, char **argv)
{
  int r;
  uv_loop_t *loop = uv_default_loop();
  uv_pipe_t pipe;

  uv_pipe_init(loop, &pipe, 0);

  uv_connect_t *connect = (uv_connect_t *)malloc(sizeof(uv_connect_t));
  uv_pipe_connect(connect, &pipe, LISTEN_ADDRESS, on_connect_cb);

  r = uv_run(loop, UV_RUN_DEFAULT);
  std::cout << "Done, uv_run returned " << r << std::endl;
  return 0;
}

void alloc_buffer(uv_handle_t *handle, size_t suggested_size, uv_buf_t *buf)
{
  // 设置客户端接收的buff大小
  buf->base = (char *)malloc(512);
  buf->len = 512;
}

void echo_read(uv_stream_t *client, ssize_t nread, const uv_buf_t *buf)
{
  std::cerr << "nread is " << nread << ", buf is " << buf->len
            << ", last char is " << (int)buf->base[buf->len - 1] << std::endl;
  std::cout << "client received " << std::string(buf->base, buf->len) << std::endl;
  if (nread == buf->len)
  {
    std::cout << "Client's buffer is full" << std::endl;
  }

  if (buf->base[nread - 1] == 0)
  {
    std::cout << "Client has received NULL BYTE, done." << std::endl;
    uv_close((uv_handle_t *)client, NULL);
    return;
  }

  if ((nread >= 0 && nread < buf->len) || nread == UV_EOF ||
      buf->base[nread - 1] == 0)
  {
    std::cout << "Client has received:" << std::string(buf->base, buf->len) << std::endl;
    std::cerr << "Close connection from client side" << std::endl;
    uv_close((uv_handle_t *)client, NULL);
    return;
  }

  if (nread < 0)
  {
    if (nread != UV_EOF)
      fprintf(stderr, "Read error %s\n", uv_err_name(nread));
    else
      std::cerr << "Received EOF" << std::endl;
    uv_close((uv_handle_t *)client, NULL);
  }
}

void after_write(uv_write_t *req, int status)
{
  free(req);
  // ok now read the results
  uv_read_start((uv_stream_t *)req->handle, alloc_buffer, echo_read);
}

void on_connect_cb(uv_connect_t *req, int status)
{
  assert(status == 0);
  int r;

  uv_write_t *wreq = (uv_write_t *)malloc(sizeof(uv_write_t));
  const char *request = "hello, server, I am client1";
  const uv_buf_t b = uv_buf_init(strdup(request), strlen(request) + 1);
  uv_write((uv_write_t *)wreq, req->handle, &b, 1, after_write);
}
