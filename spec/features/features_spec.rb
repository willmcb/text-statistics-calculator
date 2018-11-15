describe 'Statext app user interaction' do
  it 'allows a user to access it' do
    visit('/')
    expect(page).to have_content 'Statext'
  end

  it 'allows user to enter text to and submit it'
end
