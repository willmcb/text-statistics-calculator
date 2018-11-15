require 'flesch_kincaid'
require_relative 'results_wrapper'
class CalculatorService

  def self.readability(text)
    fk_results = FleschKincaid.read(text)
    results = ResultsWrapper.new
    results.score = fk_results.score
    results.grade = fk_results.grade
    results.notes = fk_results.notes
    results.word_count = word_count(text)
    results.syllables = syllables_count(text)
    results.sentences = sentences_count(text)
    results
  end

  def self.word_count(text)
    text.split(" ").count
  end

  def self.sentences_count(text)
    sentenceise(text).split(/[?!.]/).count
  end

  def self.syllables_count(text)
    total = 0
    normalize(text).each do |word|
      total += syllables_in_word(word)
    end
    total
  end

  def self.syllables_in_word(word)
    # see: https://stackoverflow.com/questions/1271918/ruby-count-syllables
    word.downcase!
    return 1 if word.length <= 3
    word.sub!(/(?:[^laeiouy]es|ed|[^laeiouy]e)$/, '')
    word.sub!(/^y/, '')
    word.scan(/[aeiouy]{1,2}/).size
  end

  private
  def self.sentenceise(text)
    text.downcase.gsub(/['’,:;`"]+/i,'')
  end

  def self.normalize(text)
    text.downcase.gsub(/[^a-z ]+/i,'').split(' ')
  end

end
