require 'spec_helper'

describe 'Our Anagrams App' do
  include SpecHelper
  
  it 'has a words model' do
    expect(Word.find_by_text("CAT").present?).to be(true)
  end
  
end