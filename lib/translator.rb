require 'yaml'

def load_library(path)
  emoticon_hash = {
    get_meaning: {},
    get_emoticon: {}
  }
  emoticons = YAML.load_file(path)
  emoticons.each { |k, v|  
    emoticon_hash[:get_meaning][v[1]] = k
    emoticon_hash[:get_emoticon][v[0]] = v[1]
  }
  emoticon_hash
end

def get_japanese_emoticon(path, english_emoticon)
  get_emoticon = load_library(path)[:get_emoticon]
  if !get_emoticon[english_emoticon]
    return "Sorry, that emoticon was not found"
  else
    get_emoticon[english_emoticon]
  end
end

def get_english_meaning(path, japanese_emoticon)
  get_meaning = load_library(path)[:get_meaning]
  if !get_meaning[japanese_emoticon]
    return "Sorry, that emoticon was not found"
  else
    get_meaning[japanese_emoticon]
  end
end