class MessengerController < ApplicationController
  include MessengerHelper

  def receive
    msg = params[:message].downcase

    sentiment_analysis = get_sentiment_analysis(msg)
    # concepts = get_concepts(msg)

    response = get_targeted_response(msg, sentiment_analysis)
    p response
    if response
      render plain: response
      return
    end

    response = get_key_phrase_response(msg)
    p response
    if response
      render plain: response
      return
    end

    response = get_sentiment_response(msg, sentiment_analysis)
    p response
    if response
      render plain: response
      return
    end

    render plain: get_inspirational_quote
  end

  private

  require 'uri'

  def get_sentiment_analysis(msg)
    msg = URI.encode(msg)
    response = `curl -X POST "https://api.havenondemand.com/1/api/sync/analyzesentiment/v2?apikey=#{KEYS['hpe_api_key']}&text=#{msg}"`
    p response
    object = JSON.parse(response)
    p object
    sentiment_analysis = object["sentiment_analysis"][0]
  end

  def get_concepts(msg)
    msg = URI.encode(msg)
    concepts = JSON.parse(`curl -X POST "https://api.havenondemand.com/1/api/sync/extractconcepts/v1?apikey=#{KEYS['hpe_api_key']}&text=#{msg}"`)
  end

  def get_targeted_response(msg, sentiment_analysis)
    if !sentiment_analysis
      return
    end

    positive_sentiment = {
      'women' => get_go_women_response
    }

    sentiment_analysis["positive"].each do |x|
      response = positive_sentiment[x["topic"]]
      return response if response
    end

    negative_sentiment = {
      'men' => get_go_women_response
    }

    sentiment_analysis["negative"].each do |x|
      response = negative_sentiment[x["topic"]]
      return response if response
    end

    return
  end

  def get_key_phrase_response(msg)
    key_phrases = {
      'who are you?' => get_who,
      'what are you?' => get_what,
      'upcoming features' => get_features,
      'quote' => get_inspirational_quote,
      'inspir' => get_inspirational_quote,
      'motivat' => get_inspirational_quote,
      'stop talking' => get_talking_response,
      'shut up' => get_talking_response,
    }

    key_phrases.each do |phrase, response|
      if msg.include?(phrase)
        return response
      end
    end

    return
  end

  def get_sentiment_response(msg, sentiment_analysis)
    if !sentiment_analysis
      return
    end

    case sentiment_analysis['aggregate']['sentiment']
      when 'negative'
        return get_supportive_response
      when 'slightly negative'
        return get_supportive_responses
      # when 'neutral'
      #   render plain: ''
      #   return
      when 'mixed'
        return get_inspirational_quote
      when 'slightly positive'
        return get_happy_response
      when 'positive'
        return get_happy_response
    end
    return
  end
end
