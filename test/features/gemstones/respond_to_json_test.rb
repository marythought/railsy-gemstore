require "test_helper"

feature "Gemstones::RespondToJson" do
  scenario "gemstone json" do
    pattern = [
      {
        id:           wildcard_matcher,
        name:         wildcard_matcher,
        description:  wildcard_matcher,
        shine:        Fixnum,
        price:        Float,
        rarity:       Fixnum,
        color:        wildcard_matcher,
        faces:        Fixnum,
        created_at:   wildcard_matcher,
        updated_at:   wildcard_matcher
      }
    ]
    server_response = visit '/gemstone.json'
    server_response.body.must_match_json_expression(pattern)
    expect server_response.must_have_content("id":1,"name":"ruby")
  end
end
