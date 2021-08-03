require 'rails_helper'

RSpec.describe Link, type: :model do

  it "Is valid if it has an original URL and a lookup code" do
    link = Link.new(
      original_url: "https://www.favoritewebsite.com/articles/how-to-bake",
      lookup_code: "1234567"
    )
    expect(link.valid?).to be(true)
  end

  it "Is valid if the URL isn't formatted properly" do
    link = Link.new(
      original_url: "adsadsa",
      lookup_code: "1234567"
    )
    expect(link.valid?).to be(false)
  end

  it "Is invalid if it doesn't have a lookup code" do
    link = Link.new(
      original_url: "https://www.favoritewebsite.com/articles/how-to-bake"
    )
    expect(link.valid?).to be(false)
  end

  it "Is invalid if it doesn't have a original_url" do
    link = Link.new(
      lookup_code: "1234567"
    )
    expect(link.valid?).to be(false)
  end

  it "is invalid if the lookup_code already exists" do
    link = Link.new(
      original_url: "https://www.favoritewebsite.com/articles/how-to-bake",
      lookup_code: "1234567"
    )
    link.save

    link2 = Link.new(
      original_url: "https://www.favoritewebsite.com/articles/how-to-cook",
      lookup_code: "1234567"
    )
    expect(link2.valid?).to be(false)
  end
  
  
end
