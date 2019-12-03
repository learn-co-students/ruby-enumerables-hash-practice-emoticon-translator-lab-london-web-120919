require "yaml"
require "pry"

def load_library(file_name)
  emoticons_file = YAML.load_file(file_name)

  emoticons_hash = {:get_meaning => {}, :get_emoticon => {}}
  emoticons_file.each do |key, values|

      emoticons_hash[:get_meaning][values[1]] = key
      emoticons_hash[:get_emoticon][values[0]] = values[1]
  end
  emoticons_hash
end



def get_japanese_emoticon(file_name, emoticon)
  translator = load_library(file_name)
  translator[:get_emoticon].each do |key, value|
    if key == emoticon
      return value
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_name, emoticon)
  translator = load_library(file_name)
  translator[:get_meaning].each do |key, value|
    if key == emoticon
      return value
    end
  end
  return "Sorry, that emoticon was not found"
end

# binding.pry
