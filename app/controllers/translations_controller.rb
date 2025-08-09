class TranslationsController < ApplicationController
  def index
    # Main translation interface
    @source_text = <<~TEXT
      In a world of code, where dreams take flight, Ruby on Rails shines, a beacon of light.
      With gems and scripts, we build and create, Web apps that flourish, it's never too late.
      From models to views, the structure is clear, With each line of code, our vision draws near.
      So let’s code together, let our passions ignite, In the realm of Rails, everything feels right."
    TEXT
  end

  def create
    @source_text = params[:source_text]
    @target_language = params[:target_language]

    if @source_text.blank?
      @error = "Please provide text to translate"
      render :index and return
    end

    if @target_language.blank?
      @error = "Please select a target language"
      render :index and return
    end

    begin
      response = TranslationAgent.with(
        locale: @target_language,
        message: @source_text
      ).translate.generate_now
      @translated_text = response.message.content
    rescue => e
      @error = "Translation failed: #{e.message}"
    end
  end

  private

  def translation_params
    params.permit(:source_text, :target_language)
  end
end
