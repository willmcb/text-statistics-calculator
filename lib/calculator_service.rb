class CalculatorService
  def initialize
   @common_words =  %w(and the is i a an but for or of so to on in if as)
  end

  def word_count(text)
    text.split(" ").count.to_s
  end

  def five_most_common_words(text)
    occurences = count_occurrences(normalize(text))
    top_five(sort(delete_common(occurences)))
  end

  private
  def normalize(text)
    text.downcase.gsub(/[^a-z ]+/i,'').split(' ')
  end

  def count_occurrences(words)
    words.each_with_object(Hash.new(0)) { |e, h| h[e] += 1 }
  end

  def delete_common(occurences)
    occurences.delete_if do |k, v|
      @common_words.include?(k.to_s)
    end
  end

  def sort(occurences)
    occurences.sort_by{ |k,v| v }.reverse
  end

  def top_five(occurences)
    occurences[0..4]
  end

end
