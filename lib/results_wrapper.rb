class ResultsWrapper
  attr_accessor :score, :notes, :grade, :word_count, :syllables, :sentences
  def initialize
    @score = 0
    @notes = ''
    @grade = ''
    @word_count = 0
    @syllables = 0
    @sentences = 0
  end
end
