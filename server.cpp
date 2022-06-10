#include <cassert>
#include <iostream>
#include <unistd.h>
#include <uv.h>
#include <stdio.h>
#include <string.h>

#define LISTEN_ADDRESS "/home/uthuqinghong/Desktop/mytest/666"

void on_connect_cb(uv_stream_t *, int);

int main(int argc, char **argv)
{
  int r;
  uv_loop_t *loop = uv_default_loop();
  uv_pipe_t pipe;

  uv_pipe_init(loop, &pipe, 0);
  unlink(LISTEN_ADDRESS);
  uv_pipe_bind(&pipe, LISTEN_ADDRESS);
  uv_listen((uv_stream_t *)&pipe, 0, on_connect_cb);

  r = uv_run(loop, UV_RUN_DEFAULT);
  std::cout << "Done, uv_run returned " << r << std::endl;
  return 0;
}

void alloc_buffer(uv_handle_t *handle, size_t suggested_size, uv_buf_t *buf)
{
  // 设置每次接收的buffer
  buf->base = (char *)malloc(512);
  buf->len = 512;
}

void echo_write(uv_write_t *req, int status) { free(req); }

void echo_read(uv_stream_t *client, ssize_t nread, const uv_buf_t *buf)
{
  std::cerr << "nread is " << nread << ", buf is " << buf->len
            << ", last char is " << (int)buf->base[buf->len - 1] << std::endl;

  if (nread == buf->len)
  {
    std::cerr << "received " << std::string(buf->base, buf->len) << std::endl;
    std::cerr << "Server buffer full, wait for more data" << std::endl;
  }
  if ((nread >= 0 && nread < buf->len) || nread == UV_EOF)
  {
    std::cerr << "received from client:" << std::string(buf->base, buf->len) << std::endl;

    uv_write_t *req = (uv_write_t *)malloc(sizeof(uv_write_t));

    const uv_buf_t b = uv_buf_init(strdup("ok, I got the data"), strlen(("ok, I got the data")) + 1);
    uv_write((uv_write_t *)req, client, &b, 1, echo_write);
    std::cerr << "Close Connection" << std::endl;
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

void on_connect_cb(uv_stream_t *stream, int status)
{
  assert(status == 0);

  uv_pipe_t *client = (uv_pipe_t *)malloc(sizeof(uv_pipe_t));

  uv_pipe_init(stream->loop, client, 0);

  if (uv_accept(stream, (uv_stream_t *)client) == 0)
  {
    uv_read_start((uv_stream_t *)client, alloc_buffer, echo_read);
  }
}
