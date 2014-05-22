class PigLatin
  def initialize
    @words, @given_language, @translated = input_values, detect_input, translate
  end
    
  def input_values
    puts ''; puts 'Welcome to the english => piglatin piglatin => english translator!'
    puts 'Input a sentence!'; puts ''
    @words = gets.chomp.downcase.gsub(/[^a-z\s]/, '').split
    puts ''; puts '============================='; puts ''
  end

  def detect_input
    ispiglatin = true
    @words.each { |word| word[-2..-1] == 'ay' ? next : ispiglatin = false ; break }
    if ispiglatin
      @given_language = "piglatin"
    else
      @given_language = "english"
    end
  end

  def translate
    if @given_language == "english"
      @words = platinify.split
    else
      @words = englishify.split
    end
    print @translated.join(' '); puts ""; puts ""
  end

  def platinify
    pyg_consonant = 'ay'
    pyg_vowel = 'qay'
    @translated = @words.map do |word|
      if ['a', 'e', 'i', 'o', 'u'].include?(word.chars.first)
        word + pyg_vowel
      else
        word[1,word.length] + word.chars.first + pyg_consonant
      end
    end
    @translated.join(' ')
  end

  def englishify
    @translated = @words.map do |word|
      if "qay" == word[-3,3]
        word[0...-3] 
      else  
        word[-3] + word[0...-3]
      end
    end
    @translated.join(' ')
  end 
end

pl = PigLatin.new
