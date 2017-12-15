class PigLatinizer

  def piglatinize(word)
    if word.length <= 2
      first_letters = ""
    elsif word[0].downcase.scan(/[aeoui]/) != []
      first_letters = word[0] + word[1]
    else
      first_letters = word[0] + word[1] + word[2]
    end

    if first_letters.downcase.scan(/[bcdfghjklmnpqrstvwxyz]{3}/) != []
      word.gsub(/^#{first_letters}/, "") + first_letters + "ay"
    elsif first_letters.downcase.scan(/[bcdfghjklmnpqrstvwxyz]{2}/) != []
      first_letters = word[0] + word[1]
      word.gsub(/^#{first_letters}/, "") + first_letters + "ay"
    elsif word[0].downcase.scan(/[aeoui]/) != []
      word + "way"
    else
      first_letter = word[0]
      word.sub(/^#{first_letter}/, "") + first_letter + "ay"
    end
  end

  def to_pig_latin(phrase)
    arrayed_phrase = phrase.split
    piglatin_phrase = []

    arrayed_phrase.each do |word|
      piglatin_phrase << piglatinize(word)
    end
    piglatin_phrase.join(" ")
  end

end
