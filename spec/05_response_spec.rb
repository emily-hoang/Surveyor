require 'spec_helper'

RSpec.describe Surveyor::Response do
  subject { described_class.new(email: "nhung@nhunghoang.com") }

  it "has an email" do
    expect(subject.email).to eq("nhung@nhunghoang.com")
  end

  it "can have asnwers added" do
    answer = double(:answer)
    subject.add_answer(answer)
    expect(subject.answers).to include(answer)
  end
end
