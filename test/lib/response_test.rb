# frozen_string_literal: true

require './test/test_helper'

class ResponseTest < Minitest::Test
  def test_prepare_response
    request = { path: '/test', method: 'GET', headers: [] }
    response = Response.prepare(request)

    assert_instance_of(Response, response)
  end
end
