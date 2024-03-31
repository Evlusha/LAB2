class StringValidator
  def self.main
    puts "Введите текст"
    text = gets.chomp
    if text.nil?
      puts "у вас пустой текст"
    else
      (0..text.length - 3).each do |i|
        if text[i] == text[i + 1] && text[i + 1] == text[i + 2]
          text[i + 2] = random_char
        end
      end
    end
    puts text
  end

  def self.random_char
    chars = ("a".."z").to_a
    chars.sample
  end
end

StringValidator.main
