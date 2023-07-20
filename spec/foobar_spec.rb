require_relative '../Lesson_2/foobar.rb'
require 'rspec'

RSpec.describe 'foobar' do
  it 'returns number_two when either number_one or number_two is 20' do
    result = nil
    expect { result = foobar(6, 20) }.to output("20\n").to_stdout
    expect(result).to be_nil

    result = nil
    expect { result = foobar(20, 24) }.to output("24\n").to_stdout
    expect(result).to be_nil
  end

  it 'returns the sum of number_one and number_two when neither is 20' do
    result = nil
    expect { result = foobar(6, 24) }.to output("30\n").to_stdout
    expect(result).to be_nil

    result = nil
    expect { result = foobar(10, 5) }.to output("15\n").to_stdout
    expect(result).to be_nil
  end
end
