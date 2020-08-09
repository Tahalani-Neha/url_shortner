require "rails_helper"

RSpec.describe Shortener do

  it "shortens a give URL to 7 characher lookup code" do
  	url = "https://www.favouritewebsite.com/article/how-to-cook"
  	shortener = Shortener.new(url)
  	expect(shortener.lookup_code.length).to eq(7)
  end

  it "gives each URL its own lookup code" do
  	url = "https://www.favouritewebsite.com/article/how-to-cook"
  	shortener = Shortener.new(url)
  	code_1 = shortener.lookup_code

  	url = "https://www.favouritewebsite.com/article/how-to-bake"
  	shortener = Shortener.new(url)
  	code_2 = shortener.lookup_code

  	expect(code_2).not_to eq(code_1)
  end

  it "always give the same URL the same lookup code" do
    url = "https://www.favouritewebsite.com/article/how-to-cook"
    shortener = Shortener.new(url)
    first_code = shortener.lookup_code

    url = "https://www.favouritewebsite.com/article/how-to-cook"
    shortener = Shortener.new(url)
    second_code = shortener.lookup_code

    expect(first_code).to eq(second_code)
  end

end