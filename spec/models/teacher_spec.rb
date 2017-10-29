require 'rails_helper'

RSpec.describe Teacher, type: :model do
  describe 'validation' do
    it 'has a valid email' do

        teacher = Teacher.new( FactoryGirl.attributes_for(:teacher))
        teacher.email = 'AAA'
        teacher.valid?
        expect(teacher.errors.messages).to have_key(:email)

    end

    it 'has a first_name and a last name' do
      teacher = Teacher.new
      teacher.valid?
      expect(teacher.errors.messages).to have_key(:first_name)
      expect(teacher.errors.messages).to have_key(:last_name)
    end

    
  end
end
