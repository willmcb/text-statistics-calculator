require 'statext'

describe Statext do
  it "should allow accessing the home page" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include('Statext')
  end
end
