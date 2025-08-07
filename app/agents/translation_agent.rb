class TranslationAgent < ApplicationAgent
  generate_with :openai, model: "gpt-4o-mini"

  def translate
    prompt
  end
end
