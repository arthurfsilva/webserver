# frozen_string_literal: true

require './test/test_helper'

class RequestTest < Minitest::Test
  def test_parse_request
    request = 'GET /test HTTP/1.1'

    parsed = Request.parse(request)

    assert_equal({
                   path: '/test',
                   method: 'GET',
                   headers: []
                 }, parsed)
  end
end
