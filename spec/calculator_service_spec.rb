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
    expect(calculator.word_count(hard_times_text)).to eq("77")
  end

  it 'can calculate the ten most common words in some text' do
    expect(calculator.five_most_common_words(hard_times_text)).to eq([['facts', 5],
                                                                      ['else', 3],
                                                                      ['nothing', 3],
                                                                      ['which', 2],
                                                                      ['children', 2]])
  end
end
