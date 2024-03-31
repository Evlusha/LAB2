require 'set'

class Zd2
  def self.main2
    text = ["qaq", ".___ .", "3", "2"]
    unique_text_count = repac(text, 4)
    puts "Количество уникальных слов на азбуке Морзе: #{unique_text_count}"
  end

  def self.repac(text, size)
    unique_text = Set.new
    text.each do |word|
      sorted_word = word.chars.sort.join
      unique_text.add(sorted_word)
    end
    unique_text.size
  end
end

Zd2.main2
