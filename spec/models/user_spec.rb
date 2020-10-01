require 'rails_helper'
describe User, type: :model do
  subject do
    User.new(
      name: 'User',
      email: 'teste@gmail.com',
      password: 123_456
    )
  end

  context 'User Model' do
    it 'is not valid without name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is valid with a valid name' do
      subject.name = 'teste'
      expect(subject).to be_valid
    end

    it 'is invalid with a name bigger than 20 characteres' do
      subject.name = 'asdfgfkgjfdoigjfdoigfjiofsjdfdklsfjdsfgsidjfdsgjhisodgjsdoifjsdoig'
      expect(subject).to_not be_valid
    end

    it 'is not valid with a password smaller than 6 characteres' do
      subject.password = 123
      expect(subject).to_not be_valid
    end

    it 'is valid with a password that is 6 characteres or more' do
      subject.password = 123_456_789
      expect(subject).to be_valid
    end

    it 'is not valid without password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end
end
