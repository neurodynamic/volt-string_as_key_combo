module KeyboardKeys
  class MainController < Volt::ModelController

    def keys(plus_separated_key_combination_string)
      combo = plus_separated_key_combination_string

      if combo.nil?
        []
      else
        # makes sure the plus key is correctly read with 
        # the plus delimiters
        inner_plus_subbed = combo.gsub(/\+\s*\+\s*\+/,'+plus+')
        edge_plus_subbed = inner_plus_subbed.
                              sub(/^\s*\+\s*\+/,'plus+').
                              sub(/\+\s*\+\s*$/,'+plus')
                              
        strokes = edge_plus_subbed.split(/\s*\+\s*/)
        plus_translated_strokes = strokes.map { |k| k == 'plus' ? '+' : k }
        plus_translated_strokes.reject { |k| k.strip == '' }
      end
    end
  end
end
