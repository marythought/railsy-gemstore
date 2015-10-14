require "test_helper"

class GemstoneStoriesTest < ActionDispatch::IntegrationTest
  test "returns list of gemstones as json" do
    # given an API, when I request for gemstones
    get '/gemstones', {}, { Accept: Mime::JSON }

    #Then I should get a valid response
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
    data = JSON.parse(response.body, symbolize_names: true)
    assert data[:gemstones].detect { |stone|
      stone[:name] == 'Ruby'
    }[:description]
      .match(/lovely/)
  end

  test 'create gemstones' do
    # post '/gemstones',
    #   { gemstone:
    #     { name: 'Emerald', price: 20.56 }
    #   }...FINISH
end
