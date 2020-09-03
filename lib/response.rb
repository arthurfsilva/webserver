# frozen_string_literal: true

class Response
  SERVER_ROOT = 'public/'

  def initialize(code:, data: '')
    @response =
      "HTTP/1.1 #{code}\r\n" \
      "Content-Length: #{data.size}\r\n" \
      "\r\n" \
      "#{data}\r\n"
  end

  def send(client)
    client.write(@response)
  end

  class << self
    def prepare(request)
      path = request.fetch(:path)
      path += 'index.html' if path == '/'

      respond_with(SERVER_ROOT + path)
    end

    private

    def respond_with(path)
      if File.exist?(path)
        send_response(200, File.binread(path))
      else
        send_response(404)
      end
    end

    def send_response(status, body = '')
      Response.new(code: status, data: body)
    end
  end
end
