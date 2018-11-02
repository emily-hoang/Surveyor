module Surveyor
  class Response 
    attr_reader :email, :answers

    def initialize(email:)
      @email = email
      @answers = []
    end

    def add_answer(answer)
      @answers << answer
    end

    def valid_answer?(answer)
      return false if answer.class != Integer 
      answer >= 1 && answer <= 5
    end

    def valid_answer?(answer)
      if answer.class == String
        return true
      else
        raise ResponseError
      end
    end
  end
end

class ResponseError < RuntimeError; 
end
