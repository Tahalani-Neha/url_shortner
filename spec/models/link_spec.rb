require 'rails_helper'

RSpec.describe Link, type: :model do

  it "it is valid if it has an original URL and a lookup code" do
    link = Link.new(
      original_url: "https://www.favouritewebsite.com/article/how-to-cook",
      lookup_code: "1234567"
    )
    expect(link.valid?).to be(true)
  end

  it "it is valid if the URL is not formatted properly" do
    link = Link.new(
      original_url: "dhbcdifboi",
      lookup_code: "1234567"
    )
    expect(link.valid?).to be(false)
  end

  it "it is invalid if it dose not have a lookup code" do
    link = Link.new(
      original_url: "https://www.favouritewebsite.com/article/how-to-cook"
    )
    expect(link.valid?).to be(false)
  end

  it "it is invalid if it dose not have a original url" do
    link = Link.new(
      lookup_code: "1234567"
    )
    expect(link.valid?).to be(false)
  end

  it "is invalid if the loopup code already exists" do
  	link = Link.new(
      original_url: "https://www.favouritewebsite.com/article/how-to-cook",
      lookup_code: "1234567"
    )
    link.save

    link_2 = Link.new(
      original_url: "https://www.favouritewebsite.com/article/how-to-cook",
      lookup_code: "1234567"
    )
    expect(link_2.valid?).to be(false)
  end

end