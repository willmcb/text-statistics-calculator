require 'app'

describe App do
  it "should allow accessing the home page" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include('Hello world!')
  end
end
