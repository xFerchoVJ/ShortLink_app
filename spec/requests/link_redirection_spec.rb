require 'rails_helper'

RSpec.describe "Link redirection", type: :request do
  it "Redirects to the original URL for a given short link" do
    url = 'https://www.techmaker.tv/content/rails-view-component-structure'
    shortener = Shortener.new(url)
    link = shortener.generate_short_link
    get link.shortener_url

    expect(response).to redirect_to(link.original_url)  
  end
end
