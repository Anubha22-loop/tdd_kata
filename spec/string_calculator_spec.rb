describe StringCalculator do
  describe '#add' do
    it 'should return 0 for empty string' do
      str_calculator = described_class.new
      expect(str_calculator.add).to eq(0)
    end

    context 'single number' do
      it 'return 0 for 0' do
        str_calculator = described_class.new('0')
        expect(str_calculator.add).to eq(0)
      end

      it 'return 78 for 78' do
        str_calculator = described_class.new('78')
        expect(str_calculator.add).to eq(78)
      end
    end

    context '2 numbers' do
      it 'should return 6 for 1,5' do
        str_calculator = described_class.new('1,5')
        expect(str_calculator.add).to eq(6)
      end

      it 'should return 30 for 20,10' do
        str_calculator = described_class.new('20, 10')
        expect(str_calculator.add).to eq(30)
      end
    end

    context '3 numbers' do
      it 'should return 6 for 1,2,3' do
        str_calculator = described_class.new('1,2,3')
        expect(str_calculator.add).to eq(6)
      end

      it 'should return 100 for 50,25,25' do
        str_calculator = described_class.new('50,25,25')
        expect(str_calculator.add).to eq(100)
      end
    end

    context 'delimiters' do
      it 'supports new line as delimiter' do
        expect(described_class.new('1\n5').add).to eq(6)
      end

      it 'supports new line and command as delimiter in single input' do
        expect(described_class.new('1\n5,8').add).to eq(14)
      end

      it 'supports different delimiter' do
        expect(described_class.new('//;\n1;2').add).to eq(3)
      end

      it 'accepts any length of delimeter' do
        expect(described_class.new('//[***]\n1***2***3').add).to eq(6)
      end

      it 'accepts multiple delimeter' do
        expect(described_class.new('//[*][%]\n1*2%3').add).to eq(6)
      end

      it 'accepts multiple delimeter of any length' do
        expect(described_class.new('//[*][%%]\n1*2%%3').add).to eq(6)
      end
    end

    context 'negative numbers' do
      it 'raises an exception if negative number exist in the nummbers string' do
        expect{ described_class.new('-1').add }.to raise_error(StandardError)
      end

      it 'raises an exception with message if negative number exist in the nummbers string' do
        expect{ described_class.new('-1,-3,8').add }.to raise_error(StandardError, 'Negative numbers not allowed: -1, -3')
      end
    end

    context 'number greater than 1000' do
      it 'skips number greater than 1000' do
        str_calculator = described_class.new('50,1025,25')
        expect(str_calculator.add).to eq(75)
      end

      it 'include number equal to 1000' do
        str_calculator = described_class.new('50,1000,25')
        expect(str_calculator.add).to eq(1075)
      end
    end
  end
end
