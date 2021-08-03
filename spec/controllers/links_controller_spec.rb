require 'rails_helper'

RSpec.describe LinksController, type: :controller do

  it "can shorten a link provided by a user" do
    url = "https://www.favoritewebsite.com/articles/how-to-cook"

    request.env["HTTP_ACCEPT"] = "text/javascript" 
    post :create, params: { link: { original_url: url } }
    link = assigns(:link)
    expect(link.original_url).to eq(url)
    expect(link.valid?).to be(true)  
    expect(link.lookup_code.length).to be(7)  
    expect(link.persisted?).to be(true)
    expect(response).to render_template('create')
  end

end
