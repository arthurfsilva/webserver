# frozen_string_literal: true

require 'socket'
require 'rack'
require './lib/request'
require './lib/response'

DEFAULT_PORT = 5678
DEFAULT_TEXT = "Welcome to ruby webserver http://localhost:#{DEFAULT_PORT}"

server = TCPServer.new(DEFAULT_PORT)

puts DEFAULT_TEXT

while (session = server.accept)
  request = session.gets
  puts request

  request = Request.parse(request)
  response = Response.prepare(request)

  response.send(session)

  session.close
end
