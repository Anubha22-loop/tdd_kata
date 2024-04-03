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

    context '2 numbers' do
      it 'should return 6 for 1,5' do
        expect(str_calculator.add('1,5')).to eq(6)
      end

      it 'should return 30 for 20,10' do
        expect(str_calculator.add('20,10')).to eq(30)
      end
    end
  end
end
