describe StringCalculator do
  let!(:str_calculator) { described_class.new }
  describe '#add' do
    it 'should return 0 for empty string' do
      expect(str_calculator.add('')).to eq(0)
    end

    context 'single number' do
      it 'return 0 for 0' do
        expect(str_calculator.add('0')).to eq(0)
      end

      it 'return 78 for 78' do
        expect(str_calculator.add('78')).to eq(78)
      end
    end
  end
end
