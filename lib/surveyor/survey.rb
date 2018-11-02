module Surveyor
  class Survey
    attr_reader :name, :questions, :responses

    def initialize(name:)
      @name = name
      @questions = []
      @responses = []
    end

    def add_question(question)
      @questions << question
    end
      
    def add_response(response)
      @responses << response
    end

    # NOTE: if there are multiple responses with the same email
    # it will return all
    def find_response_by_email(email)
      responses = @responses.select { |response| response.email == email }  
      if  responses.empty?
        return nil
      else
        return responses
      end
    end

    def has_responded_yet?(email)
      responses = @responses.select do |response| 
        response.email == email
      end

      if responses.count > 0
        return true
      else
        return false
      end
    end
  end
end
