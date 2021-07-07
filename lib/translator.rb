# require modules here
require 'pry'
require "yaml"

def load_library(file_path)
library = YAML.load_file("./lib/emoticons.yml")

result = { 'get_meaning' => {}, 'get_emoticon' => {} }

library.each { |english,(en_emoticon,jap_emoticon)| # 0 is in english and 1 is in japanese
  result["get_meaning"][jap_emoticon] = english
  result["get_emoticon"][en_emoticon] = jap_emoticon
}
result

end

def get_japanese_emoticon(source , emoticon)
  # code goes here
 #  calls on #load_library and gives it the argument of the file path (FAILED - 1) ------ load_library(yamlFile)
 # returns the Japanese equivalent of an English grinning (FAILED - 2)
 # returns the Japanese equivalent of an English happy (FAILED - 3)
 # returns the Japanese equivalent of an English sad (FAILED - 4)
 # returns an apology message if the argument is not a known emoticon (FAILED - 5)
 # library = load_library(file_path)
 #  if library["get_emoticon"].include?(english_emoticon)
 #    library["get_emoticon"][english_emoticon]
 #  else
 #    "Sorry, that emoticon was not found"
 #  end
library = load_library(source)
if library["get_emoticon"].include?(emoticon)
  library["get_emoticon"][emoticon]
else
  "Sorry, that emoticon was not found"
end


end

def get_english_meaning(source, emoticon)
  # code goes here
  library = load_library(source)
  if library["get_meaning"].include?(emoticon)
    library["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end

end
