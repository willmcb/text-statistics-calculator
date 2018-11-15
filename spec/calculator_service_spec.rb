require 'calculator_service'

describe CalculatorService do
  subject(:calculator) { CalculatorService.new }

  let(:hard_times_text) { "‘NOW, what I want is, Facts. Teach these boys" +
                " and girls nothing but Facts. Facts alone are" +
                " wanted in life. Plant nothing else, and root" +
                " out everything else. You can only form the minds" +
                " of reasoning animals upon Facts: nothing else will " +
                "ever be of any service to them. This is the principle " +
                " on which I bring up my own children, and this is the" +
                " principle on which I bring up these children. Stick " +
                "to Facts, sir!’"}

  it 'can calculate the wordcount of some text' do
    expect(CalculatorService.word_count(hard_times_text)).to eq(77)
  end

  it 'can count the syllables in some text' do
    expect(CalculatorService.syllables_count(hard_times_text)).to eq(98)
  end

  it 'can count the number of sentences' do
    expect(CalculatorService.sentences_count(hard_times_text)).to eq(7)
  end

  it 'can clalculate a readability score' do
    result = CalculatorService.readability(hard_times_text)
    expect(result.score).to eq(74.81)
    expect(result.grade).to eq("7th grade")
    expect(result.notes).to eq("Fairly easy to read.")
  end
end
