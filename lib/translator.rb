# require modules here
require "yaml"

def load_library(file)
  hash = {
    "get_meaning" => {},
    "get_emoticon" =>{}
  }

  YAML.load_file(file).each do |meaning, describe|
     eng, jan = describe
     hash["get_meaning"][jan] = meaning
     hash["get_emoticon"][eng] = jan
  end
  hash
end

def get_japanese_emoticon(file, hash)
  jap_emoticons = load_library(file)
  result = jap_emoticons["get_emoticon"][hash]
  if result
    result
  else
    "Sorry, that emoticon was not found"
  end
end


def get_english_meaning(file, hash)
  eng_emoticons = load_library(file)
  result = eng_emoticons["get_meaning"][hash]
  if result
    result
  else
    "Sorry, that emoticon was not found"
  end
end
