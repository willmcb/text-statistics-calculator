describe 'Statext app user interaction' do
  let(:hard_times_text) { "‘NOW, what I want is, Facts. Teach these boys" +
                " and girls nothing but Facts. Facts alone are" +
                " wanted in life. Plant nothing else, and root" +
                " out everything else. You can only form the minds" +
                " of reasoning animals upon Facts: nothing else will " +
                "ever be of any service to them. This is the principle " +
                " on which I bring up my own children, and this is the" +
                " principle on which I bring up these children. Stick " +
                "to Facts, sir!’"}

  it 'allows a user to access it' do
    visit('/')
    expect(page).to have_content 'Statext'
  end

  it 'allows users to submit text and see results of its readability' do
    visit('/')
    fill_in 'text', :with => hard_times_text
    click_on 'Submit'
    expect(page).to have_content 'Results'
    expect(page).to have_content 'This text is fairly easy to read.'
    expect(page).to have_content 'It has a raw readability score of 74.81'
    expect(page).to have_content 'It would be easily read by the average 7th grade student.'
  end
end
