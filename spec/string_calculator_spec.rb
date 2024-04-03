describe StringCalculator do
  let!(:str_calculator) { described_class.new }
  describe '#add' do
    it 'should return 0 for empty string' do
      expect(str_calculator.add('')).to eq(0)
    end
  end
end
