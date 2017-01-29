##
# require Rspec to run
# answer the questions by filling the before and let parts

require 'csv'

RSpec.describe "Build a csv" do
  context "I initialize needed elements to build the csv" do
    let(:alphabet) {}
    let(:matrix) {}
    let(:alphabet_matrix) {}

    it "should have alphabet that is an array" do
      expect(alphabet).to eq(%w(a b c d e f g h i j k l m n o p q r s t u v w x y z))
    end

    it "should have 'matrix' that is a matrix of 26x26" do
      26.times do |i|
        26.times do |j|
          expect(matrix[i][j]).to be_nil
        end
      end
    end

    it "should have 'alphabet_matrix' that is filled of row letter followed by the column letter" do
      26.times do |i|
        26.times do |j|
          expect(alphabet_matrix[i][j]).to eq(alphabet[i] + alphabet[j])
        end
      end
    end

    context "I build an array corresponding to the CSV result (see input.csv as an exemple) with rows and column headers" do
      let(:csv_a) {}

      it "should have 'csv_a' that is as expected (an array of rows)" do
        i = 0
        CSV.foreach('input.csv') do |row|
          expect(csv_a[i]).to eq(row)
          i += 1
        end
      end

      context "I wnat to write the ouput on 'output.csv'" do
        before do
        end

        it "should have a file 'output.csv'" do
          expect(File.exists?('output.csv')).to be_truthy
        end

        it "should have a file 'output.csv' that is the same as 'input.csv'" do
          input = Array.new
          output = Array.new
          CSV.foreach('input.csv') do |row|
            input << row
          end
          CSV.foreach('output.csv') do |row|
            output << row
          end

          expect(input).to eq(output)
        end
      end
    end
  end
end
