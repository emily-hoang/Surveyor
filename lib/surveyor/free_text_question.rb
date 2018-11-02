module Surveyor
  class FreeTextQuestion < Question
    attr_reader :title
    
    def initialize(title:)
      @title = title
      @valid_answers = []
    end

    def valid_answer?(answer)
       answer.class == String
    end
  end
end
