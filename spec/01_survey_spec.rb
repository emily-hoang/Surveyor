require 'spec_helper'

RSpec.describe Surveyor::Survey do
  subject { described_class.new(name: "Engagement Survey") }

  it "has a name" do
    expect(subject.name).to eq("Engagement Survey")
  end

  it "can have questions added" do
    question = double(:question)
    subject.add_question(question)
    expect(subject.questions).to include(question)
  end

  it "can have responses added" do
    response = double(:response)
    subject.add_response(response)
    expect(subject.responses).to include(response)
  end

  describe "#find_response_by_email" do
    context "when there are responses" do
      let(:response1) { Surveyor::Response.new(email: 'nhung@nhunghoang.com' )}
      let(:response2) { Surveyor::Response.new(email: 'emilyhoang.132@gmail.com' )}

      before {
        subject.add_response(response1)
        subject.add_response(response2)
      }

      context "and we try to find an email that exists" do
        it 'will find the response by its email' do
          expect(subject.find_response_by_email('nhung@nhunghoang.com').size).to eq(1)
        end
      end

      context "and there are no email that matches" do
        it "will return nil" do
          expect(subject.find_response_by_email('anEmail@thatdoesntexist.com')).to eq(nil)
        end
      end
    end

    context "when there are no responses" do
      it "will return nil" do
        expect(subject.find_response_by_email('nhung@nhunghoang.com')).to eq(nil)
      end
    end
  end

  describe "#has_responded_yet?" do
    let(:response1) { Surveyor::Response.new(email: 'nhung@nhunghoang.com' )}
    let(:response2) { Surveyor::Response.new(email: 'emilyhoang.132@gmail.com' )}

    before {
      subject.add_response(response1)
      subject.add_response(response2)
    }

    context "when the user has responded" do
      it "will return true" do
        expect(subject.has_responded_yet?('nhung@nhunghoang.com')).to eq(true)
      end
    end

    context "when the user has not responded" do
      it "will return false" do
        expect(subject.has_responded_yet?('anemail@thatdoesntexist.com')).to eq (false)
      end
    end
  end
end
