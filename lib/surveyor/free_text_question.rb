module Surveyor
  class FreeTextQuestion < Question
    attr_reader :title
    
    def initialize(title:)
      @title = title
      @valid_answers = []
    end

    def valid_answer?(answer)
      if answer.class == String
        return true
      else
        raise ResponseError
      end
    end
  end

  ResponseError = Class.new(RuntimeError)
end



