require './Classes/nameable'

describe Nameable do
  context 'calling a unimplemented method' do
    it 'raises' do
      nameable = Nameable.new
      expect(nameable.class).to eq Nameable
      expect { nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
